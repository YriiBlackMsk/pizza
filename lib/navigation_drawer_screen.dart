import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>(); //доступ к сообщениям

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey, //ключ для снэкбара
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, //нулевой отступ
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0))
                        ),
                        child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/330px-Google-flutter-logo.svg.png'
                        ),
                      ),
                      const Text('Навигация во Flutter')
                    ],
                  ),
                ),
            ),

            ListTile( //список
              leading: const Icon(Icons.one_k), //иконка
              title: const Text('Каталог'), //заголовок
              onTap: () { //обработчик для снэкбара
                _messengerKey.currentState!.showSnackBar(
                  const SnackBar(content: Text('Переход в каталог')));
              },
            ),

            ListTile(
              leading: const Icon(Icons.two_k), //иконка
              title: const Text('Корзина'), //заголовок
              onTap: () { //обработчик
                _messengerKey.currentState!.showSnackBar(
                  const SnackBar(content: Text('Переход в каталог')));
              },
            ),

            const Divider(),

            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Профиль'),
            ),

            ListTile(
              leading: const Icon(Icons.settings), //иконка
              title: const Text('Корзина'), //заголовок
              onTap: () { //обработчик
                _messengerKey.currentState!.showSnackBar(
                  const SnackBar(content: Text('Переход в каталог')));
              },
            ),

          ],
        ),

        ),
        body: const Center(child: Text('Содержимое экрана')),
      ),
    );
  }
}
