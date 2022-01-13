import 'package:flutter/material.dart';
void main() {runApp (const NavigationDemo ());}
class NavigationDemo extends StatefulWidget {
  const NavigationDemo({Key? key}) : super(key: key);

  @override
  _NavigationDemoState createState() => _NavigationDemoState();
}

class _NavigationDemoState extends State<NavigationDemo> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const MainScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/contacts': (context) => const SecondScreen(),
      },
    );
  }
}

Widget navDrawer(context) => Drawer( //ящик, бургер
  child: ListView(padding: EdgeInsets.zero, children: [
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
          title: const Text('Главная'), //заголовок кнопки
          onTap: () { //обработчик
            // Navigator.pop(context);
            Navigator.pushNamed(context, '/');
            // _messengerKey.currentState!.showSnackBar(
            // const SnackBar(content: Text('Переход в каталог')));
          },
        ),

        ListTile(
          leading: const Icon(Icons.two_k), //иконка
          title: const Text('Контакты'), //заголовок кнопки
          onTap: () { //обработчик
            Navigator.pushNamed(context, '/contacts');
            // _messengerKey.currentState!.showSnackBar(
            // const SnackBar(content: Text('Переход в каталог')));
          },
        ),
      ]),
);

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( //материал апп не походит тут!
      appBar: AppBar(
        title: const Text('Главная страница')), // текст  заголовке
        drawer: navDrawer(context),
         body: const Center(
          child: Text('Главная страница'),), //содержание страницы
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( //материал апп не походит тут!
      appBar: AppBar(
          title: const Text(
              'Контакты'
          )),
      drawer: navDrawer(context),
      body: const Center(
        child: Text(
            'Контакты'
        ),
      ),
    );
  }
}