import 'package:flutter/material.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, //нулевой отступ
          children: [
            ListTile( //список
              leading: const Icon(Icons.one_k), //иконка
              title: const Text('Каталог'), //заголовок
              onTap: () { //обработчик
                // _messengerKey.currentState!.showSnackBar(
                //   const SnackBar(content: Text('Переход в каталог')));           )
              },
            ),

            ListTile(
              leading: const Icon(Icons.two_k), //иконка
              title: const Text('Корзина'), //заголовок
              onTap: () { //обработчик
                // _messengerKey.currentState!.showSnackBar(
                //   const SnackBar(content: Text('Переход в каталог')));           )
              },
            )
          ],
        ),

        ),
        body: Center(child: Text('Содержимое экрана')),
      ),
    );
  }
}
