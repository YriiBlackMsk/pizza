import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class NavigationDrawer extends StatefulWidget { //(стейтфул виджет из 2х классов, изменяет вид от события является динамическим классом
  const NavigationDrawer({Key? key}) : super(key: key); //1 класс используется для хранения переданных параметров и инициализации состояния

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState(); //старая запись выглядит как _NavigationDemoState createState(){return _NavigationDemoState();}
}

class _NavigationDrawerState extends State<NavigationDrawer> { //2 класс используется для отрисовки текущего состояния, реакция
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
      backgroundColor: Colors.green[200],
      drawerDragStartBehavior: DragStartBehavior.down,
      drawerEdgeDragWidth: 70,
      body: const Center(child: Text('Текст Main Screen')),
      appBar: AppBar(
        title: const Text('Текст AppBar '),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          TextButton(
           onPressed: () {},
              child: const Text('Выход'), style: buttonStyle),
        ],
      ),
      drawer: SizedBox(
          width: 250,
        child: Drawer(
          backgroundColor: Colors.pink,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.tealAccent,
                ),
                child: Container(
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
                      const Text('Заголовок в бургере')
                    ],
                  ),
                ),
            ),

            ListTile( //список
              leading: const Icon(Icons.two_k), //иконка
              title: const Text('SecondScreen'), //заголовок
              onTap: () { //обработчик для снэкбара
                Navigator.pushNamed(context, '/2');
                // _messengerKey.currentState!.showSnackBar(
                //   const SnackBar(content: Text('Переход на SecondScreen')));
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.three_k), //иконка
              title: const Text('ThirdScreen'), //заголовок
              onTap: () { //обработчик
                Navigator.pushNamed(context, '/3');
                // _messengerKey.currentState!.showSnackBar(
                //   const SnackBar(content: Text('Переход на ThirdScreen')));
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.four_k), //иконка
              title: const Text('FourthScreen'), //заголовок
              onTap: () { //обработчик
                Navigator.pushNamed(context, '/4');
                // _messengerKey.currentState!.showSnackBar(
                //   const SnackBar(content: Text('Переход на FourthScreen')));
              },
            ),

            const Divider(),

            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Профиль'),
            ),

            ListTile(
              leading: const Icon(Icons.settings), //иконка
              title: const Text('FifthScreen'), //заголовок
              onTap: () { //обработчик
                Navigator.pushNamed(context, '/5');
                // _messengerKey.currentState!.showSnackBar(
                //   const SnackBar(content: Text('Переход в каталог')));
              },
            ),
           ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.gps_fixed), label: 'GPS локация'),
       ], currentIndex: _selectedIndex, onTap: _onItemTapped
      ),

     persistentFooterButtons: [
      Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: IconButton(
            splashColor: Colors.blue,
            color: Colors.green,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Телефон')));
              },
              icon: const Icon(Icons.phone_android)),
          ),
          Expanded(child: IconButton(

            color: Colors.green,
            splashColor: Colors.blue,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(' E-mail')));
            },
            icon: const Icon(Icons.mail)),
          ),
          Expanded(child:IconButton(
            splashColor: Colors.blue,
            color: Colors.green,
            highlightColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Chat')));
            },
            icon: const Icon(Icons.message)),
          ),
        ],
      ),
     ],
    );
  }
}
