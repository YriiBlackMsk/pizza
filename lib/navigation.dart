import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  // final _messengerKey = GlobalKey<ScaffoldMessengerState>(); //доступ к сообщениям
  int _selectedIndex = 0;
  void _onItemTapped(var text) {
  setState(() {
  _selectedIndex = text;
  });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
     TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      backgroundColor: Colors.amber[200],
      drawerDragStartBehavior: DragStartBehavior.down,
      drawerEdgeDragWidth: 70,
      body: const Center(child: Text('TraderCamp')),
      appBar: AppBar(
        title: const Text('TraderCamp'),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          TextButton(
           onPressed: () {}, child: const Text('Вход'), style: buttonStyle),
        ],
      ),
        drawer: SizedBox(
          width: 250,
        child: Drawer(
          backgroundColor: Colors.amberAccent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
            DrawerHeader( //c этого места!!!
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
