import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pizza/auth/color_utils.dart';
import 'user.dart';
import 'user_id.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late Future<List<User>> userlist;
  @override
  void initState() {
    super.initState();
    userlist = getUserList();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
        primary: Theme.of(context).colorScheme.onPrimary//подсветка белым текстовой кнопки в аппбаре
    );
    return Scaffold(
      drawerEdgeDragWidth: 70, //расстояние от левого края до места откуда начинает работать возможность вытащить ящик
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: <Color>[Colors.black, Colors.blue]),
          // ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Возврат',
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, '/ HomeScreen'); //переход на страницу регистрации
            }, child: const Text('Выход'), style: buttonStyle),
        ],
        title: const Text('Список Юзеров'),
      ),
      body: FutureBuilder<List<User>>(
        future: userlist,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Имя: ${snapshot.data![index].name}'),
                      subtitle: Text('Email: ${snapshot.data![index].email}'),
                      leading: Text('ID: ${snapshot.data![index].id}'),
                      // trailing: Image.network(
                      //     'https://randomuser.me/api/portraits/med/women/${snapshot.data![index].id}.jpg'),
                      onTap: () async {
                        UserID uid = UserID(
                            snapshot.data![index].id,
                            '${snapshot.data![index].name}',
                            '${snapshot.data![index].username}',
                            '${snapshot.data![index].email}',
                            '${snapshot.data![index].address!.street}',
                            '${snapshot.data![index].address!.suite}',
                            '${snapshot.data![index].address!.city}',
                            '${snapshot.data![index].address!.zipcode}',
                            '${snapshot.data![index].address!.geo!.lat}',
                            '${snapshot.data![index].address!.geo!.lng}',
                            '${snapshot.data![index].phone}',
                            '${snapshot.data![index].website}',
                            '${snapshot.data![index].company!.name}',
                            '${snapshot.data![index].company!.catchPhrase}',
                            '${snapshot.data![index].company!.bs}');
                        Navigator.pushNamed(context, '/1',
                            arguments: uid);
                      },
                    ),
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<List<User>> getUserList() async {
    List<User> prodList = [];
    const url = 'https://jsonplaceholder.typicode.com/users'; //загружаем юзеров
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      for (var prod in jsonList) {
        prodList.add(User.fromJson(prod));
      }
      return prodList;
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: NavigationDrawer(), //отправляет нас в класс навигации в файл
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Colors.white, //если включить, то при переключении в режим dark на белом не видно белый текст
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
        DrawerHeader( //хедер
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        // decoration: const BoxDecoration(
        //   color: Colors.tealAccent,
        // ),
         child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 200,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.0))),
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/330px-Google-flutter-logo.svg.png'
                ),
              ),
              const Text('Заголовок в бургере'),
            ],
          ),
        ),
      ),
          ListTile( //боди
            leading: const Icon(Icons.exit_to_app), //иконка
            title: const Text('Выход на предпоследний экран'), //заголовок
            onTap: () { //обработчик для снэкбара
              Navigator.pushNamed(context, '/ HomeScreen');
              // _messengerKey.currentState!.showSnackBar(
              //   const SnackBar(content: Text('Переход на SecondScreen')));
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.home), //иконка
            title: const Text('Вход в приложение'), //заголовок
            onTap: () { //обработчик
              Navigator.pushNamed(context, '/2');
              // _messengerKey.currentState!.showSnackBar(
              //   const SnackBar(content: Text('Переход на ThirdScreen')));
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.zoom_out_outlined), //иконка
            title: const Text('Посмотреть главную страницу'), //заголовок
            onTap: () { //обработчик
              Navigator.pushNamed(context, '/3');
              // _messengerKey.currentState!.showSnackBar(
              //   const SnackBar(content: Text('Переход на FourthScreen')));
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.how_to_reg), //иконка
            title: const Text('Сброс пароля'), //заголовок
            onTap: () { //обработчик
              Navigator.pushNamed(context, '/5');
              // _messengerKey.currentState!.showSnackBar(
              //   const SnackBar(content: Text('Переход на FourthScreen')));
            },
          ),

          const Divider(),

          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('Настройка профиля'),
          ),

          ListTile(
            leading: const Icon(Icons.settings), //иконка
            title: const Text('Создать профиль'), //заголовок
            onTap: () { //обработчик
              Navigator.pushNamed(context, '/4');
              // _messengerKey.currentState!.showSnackBar(
              //   const SnackBar(content: Text('Переход в каталог')));
            },
          ),
         ],
      ),
    );
  }
}