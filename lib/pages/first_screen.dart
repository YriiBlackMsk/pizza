import 'package:flutter/material.dart'; //подключение дизайна материал дарт
import 'package:google_fonts/google_fonts.dart'; //подключение гугл стилей текста
import 'package:pizza/utils/strings.dart'; //получение данных из строк на другой странице
import 'package:http/http.dart' as http; //пакет работы с загрузкой из сети
import 'dart:async'; //для асинхронной работы с сетевыми запросами (чтобы приложение не тормозило в одидании даных из сети
import 'dart:convert'; //для конвертирования данных из джейсон в дарт

//вставка начало 1 загрузка данных не помещать в билд страницы чтобы не выгружать многократныую загрузку
Future<Post> fetchPost() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')); //запрашиваем парсим данные в формате джейсон с открытого сайта

  if (response.statusCode == 200) { //проверяем статус, если ответ 200, то ок
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Post.fromJson(jsonDecode(response.body)); //отдаем данные, оторые размещены в объекте боди - это текст
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Post'); //если ошибка то пишем ошибка при загрзуке альбома (данных)
  }
}

class Post { //структура запрашиваемых данных, с присвоением типа данных
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post({ //конструктор для принятия полей, все они обязательные
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) { //фактори создает объекты на основании джейсон разметки
    return Post( //вытаскивает из джейсон и помещает в даные дарт
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
//вставка конец 1

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //вставка начало 2
  late Future<Post> futurePost; //отложенная загрузка дял работы с асинхронными операциями

  @override
  void initState() { //инициализация, вызов метода однократная загрузка данных из сети
  super.initState();
  futurePost = fetchPost();
  }
  //вставка конец 2

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
           //backgroundColor: Colors.amber[50],//локальный бэкграунд первого экрана
          body: SingleChildScrollView(
            child: Center(
             child: Column(
               children: [
                 const SizedBox(height: 20),

                 Text('Кейс 3.2', style: GoogleFonts.oswald(fontSize: 20)),

                 const SizedBox(height: 20),

                 FutureBuilder<Post>(//указан тип куда загрузятся данные, метод для загрузки данных используемых в будущем, чтобы не выпало ошибки обращения к несуществующим данным
                   future: futurePost, //куда загружаются данные
                   builder: (context, snapshot) {
                     if (snapshot.hasData) { //проверяем есть ли данные
                       return
                         PostCardWidget(
                           title: snapshot.data!.title, body: snapshot.data!.body);
                         /*Column(children: [ //вариант без класса
                          Text (snapshot.data!.title, style: const TextStyle(fontSize: 20)),
                          Text (snapshot.data!.body, style: const TextStyle(fontSize: 15))]);
                          */
                         //Text(snapshot.data!.body, style: const TextStyle(fontSize: 20)); //если данные есть в поле титул, можено к любому обратиться?, то записать
                       //return Text('${snapshot.data!.id}'); //вариант вывода id
                     } else if (snapshot.hasError) {
                       return Text('${snapshot.error}'); //выдать ошибку при загрузе если она есть
                     }

                     // By default, show a loading spinner.
                     return const CircularProgressIndicator(); //если данные не загруженны показывать индикатор загрузки
                   },
                 ),

                 const SizedBox(height: 20),

                 Text(Strings.longBodyText8, style: GoogleFonts.getFont('Lato')),//динамически подгружаем
                 Text(Strings.longBodyText8, style: GoogleFonts.lato(
                   textStyle: const TextStyle(color: Colors.blue, letterSpacing: 2.5)
                 )),
                 Text(Strings.longBodyText8, style: GoogleFonts.lato(
                     textStyle: Theme.of(context).textTheme.headline6,
                     fontSize: 48),
                 ),

                 // Container(
                  //  height: 100,
                  //   color: Theme.of(context).colorScheme.secondary,
                  // ),
                ],
             ), //текст глвной страницы
            ),
          ),
        ),
    );
  }
}

class PostCardWidget extends StatelessWidget { //оформление загрузки
  final String title;
  final String body;
  const PostCardWidget({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
              //debugPrint('Card tapped.');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.left),

                const Divider(height: 10),

                Text(body,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.left),
              ],
            ),
          ),
        ),
      ),
    );
  }
}