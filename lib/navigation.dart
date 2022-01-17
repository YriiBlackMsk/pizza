import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:pizza/utils/strings.dart';

//страница навигации
//1.Создаем класс для отрисовки экрана
class NavigationDrawer extends StatefulWidget { //(стейтфул виджет из 2х классов, изменяет вид от события является динамическим классом
  const NavigationDrawer({Key? key}) : super(key: key); //1 класс используется для хранения переданных параметров и инициализации состояния

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState(); //старая запись выглядит как _NavigationDemoState createState(){return _NavigationDemoState();}
}

class _NavigationDrawerState extends State<NavigationDrawer> { //2 класс используется для отрисовки текущего состояния, реакция
  final _messengerKey = GlobalKey<ScaffoldMessengerState>(); //скафолд всплывающие сообшения о переходе

  int _selectedIndex = 0; //состоит из 2х частей, это часть 1 - запоминает какую кнопку нажали в BottomNavigationbar
  void _onItemTapped(var text) {
  setState(() {
  _selectedIndex = text;
  });
  }

/*отдельно вынесенная функция аппбар для удобства не работает с текстовой кнопкой
  PreferredSizeWidget _appBar() => AppBar(
    title: const Text('Текст AppBar '), //текст заголовка аппбар
    actions: [ //икноки аппбар
      IconButton(icon: const Icon(Icons.add_call), tooltip: 'Уведомления', onPressed: () {},),
      IconButton(icon: const Icon(Icons.settings),tooltip: 'Уведомления', onPressed: () {},),
      TextButton (child: const Text ('Выход'), onPressed: () {},),
    ],
  );
*/
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
        primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[200], //цвет бэкграунда главного экрана
      drawerDragStartBehavior: DragStartBehavior.down, //скорость вытаскивания ящика, стоит более быстрое открывание
      drawerEdgeDragWidth: 70, //расстояние от левого края откуда начинает работать возможность вытащить ящик

      body: const SingleChildScrollView(
        child: Center(
            child: Text(Strings.longBodyText1),),
      ), //текст глвной страницы

      // appBar: _appBar(), //хедер
      appBar: AppBar( //локальный вариант, вынесена в отдельную функцию
        title: const Text('Текст AppBar '), //текст заголовка аппбар
        actions: <Widget>[ //икноки аппбар
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          TextButton(onPressed: () {}, child: const Text('Выход'), style: buttonStyle),
        ],
      ),

      drawer: SizedBox(
          width: 250,
        child: Drawer( //бургер
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
            DrawerHeader( //хедер
                decoration: const BoxDecoration(
                  color: Colors.tealAccent,
                ),
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
      ), //бургер

     persistentFooterButtons: [ //футер три кнопки
      Row(
        children: [
          Expanded(
            child: IconButton(
            splashColor: Colors.blue,
            color: Colors.green,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Контакты')));
              },
              icon: const Icon(Icons.work)),
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

      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная страница'),
        BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Позвонить'),
      ],
          currentIndex: _selectedIndex, onTap: _onItemTapped //состоит из 2х частей, это часть 2 - запоминает какую кнопку нажали в BottomNavigationbar
      ), //нижние две кнопки

    );
  }
}
