import 'dart:async'; //для работы с асинхронными операциями
import 'dart:developer';
import 'dart:io';//для работы с операциями ввода-вывода
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';//сохранеие в черном ящике устройства
import 'package:path_provider/path_provider.dart';

//класс отображения страницы
class SeventhScreen extends StatefulWidget {
  const SeventhScreen({Key? key}) : super(key: key);

  @override
  _SeventhScreenState createState() => _SeventhScreenState();
}

class _SeventhScreenState extends State<SeventhScreen> {//класс состояния
  String value = 'Тут будет значение'; //определили переменную для запписи в нее значений ключа
  int _counter = 0;

  @override
  void initState() { //инициализирует состояние виджета
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {//загружает текущее значеие счетчика из памяти телефона, не сбрасывается
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
      prefs.setInt('counter', _counter);
    });
  }

  void _incrementCounter() async { //увеличение счетчика на 1
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea( //отвечает за отображение страницы в видимых пределах в зависимости от устройства
        child: Scaffold(//каркас для отображения страницы в привычном виде, а не в виде материал апп
          appBar: AppBar(
            title: const Text('Текст Seventh Screen'),), //заголовок второго экрана
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 100),

                Text(value, style: Theme.of(context).textTheme.headline6), //отображаемое значение

                const SizedBox(height: 20),

                ElevatedButton(
                  child: const Text('Читать значение ключа Text_1'),
                  onPressed: () async { //действие при нажатии асинхронное добавлено к функции т.к., есть внутри функции await
                    SharedPreferences prefs = await SharedPreferences.getInstance(); //функция позволяющая использовать хранилище
                    setState(() {//для обновления интерфейса после прочтения
                      value = prefs.getString('Text_1') ?? 'NULL'; //указали переменную вэлью в которую положим данные из запроса, из функции в которую передаем ключ в кавычках по которому хотим получить данные, через вопросы указали, что показывать если ничего до этого не записывали
                    });
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  child: const Text('Записать значение 1'),
                  onPressed: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('Text_1', 'Значение 1'); //записываем значение по ключу в кавычках
                    setState(() {
                      value = prefs.getString('Text_1') ?? 'NULL';
                    });
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  child: const Text('Записать значение 2'),
                  onPressed: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('Text_1', 'Значение 2');
                    setState(() {
                      value = prefs.getString('Text_1') ?? 'NULL';
                    });
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  child: const Text('Удалить значение ключа Text_1'),
                  onPressed: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.remove('Text_1');
                    setState(() {
                      value = prefs.getString('Text_1') ?? 'NULL';
                    });
                  },
                ),

                const SizedBox(height: 20),

                Text('$_counter', style: const TextStyle(fontSize: 20),),
              ],
           ),
          ),
          floatingActionButton: FloatingActionButton(//кнопка добавляет +1
            child: const Icon(Icons.add),
            onPressed: _incrementCounter,
            tooltip: 'Increment',
          ),
        )
    );
  }
}

/*
class User {
  late String name;
  late String phone;

  User({required this.name, required this.phone});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Телефонная книга'),
      ),
      body: const Center(child: UserListWidget()),
    );
  }
}

class UserListWidget extends StatefulWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  List<User> users = [
    User(name: "Anna", phone: "+79516437515"),
    User(name: "Philipo", phone: "+793685759"),
    User(name: "Julia", phone: "+709875385"),
    User(name: "Piter", phone: "+7957875445"),
    User(name: "Anna", phone: "+79516437515"),
    User(name: "Philipo", phone: "+793685759"),
    User(name: "Julia", phone: "+709875385"),
    User(name: "Piter", phone: "+7957875445"),
    User(name: "Anna", phone: "+79516437515"),
    User(name: "Philipo", phone: "+793685759"),
    User(name: "Julia", phone: "+709875385"),
    User(name: "Piter", phone: "+7957875445"),
    User(name: "Anna", phone: "+79516437515"),
    User(name: "Philipo", phone: "+793685759"),
    User(name: "Julia", phone: "+709875385"),
    User(name: "Piter", phone: "+7957875445"),
    User(name: "Anna", phone: "+79516437515"),
    User(name: "Philipo", phone: "+793685759"),
    User(name: "Julia", phone: "+709875385"),
    User(name: "Piter", phone: "+7957875445"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          // print(index);
          //return Text('sdfsdf');
          return PersonCardWidget(
            name: users[index].name,
            phone: users[index].phone,
          );
        });
  }
}

class PersonCardWidget extends StatelessWidget {
  late String name;
  late String phone;
  PersonCardWidget({Key? key, required this.name, required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: InkWell(
            onTap: () {
              //debugPrint('Card tapped.');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    children: [
                      const Icon(Icons.supervised_user_circle),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(name),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    children: [
                      const Icon(Icons.phone),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(phone)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
