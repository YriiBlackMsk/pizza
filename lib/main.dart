import 'package:flutter/material.dart'; //подключение библиотеки с дизайном от андроида

void main() { //запуск приложения
  runApp (const NavigationDemo ()); //название приложения которое запускается
}
//(стейтфул виджет из 2х классов, изменяет вид от события является динамическим классом
class NavigationDemo extends StatefulWidget { //1 класс используется для хранения переданных параметров и инициализации состояния
  const NavigationDemo({Key? key}) : super(key: key);

  @override //переопределяем метод
  _NavigationDemoState createState() => _NavigationDemoState();
} //старая запись выглядит как _NavigationDemoState createState(){return _NavigationDemoState();}

class _NavigationDemoState extends State<NavigationDemo> { //2 класс используется для отрисовки текущего состояния, реакция

  @override
  Widget build(BuildContext context) { //описываем
    return MaterialApp(
      //home: const MainScreen(),
      initialRoute: '/', //индексная страница, может быть либо она, либо home см. выше
      routes: { //прописываем маршруты для страниц
        '/': (context) => const MainScreen(),
        '/contacts': (context) => const SecondScreen(),
      },
    );
  }
}

Widget navDrawer(context) => Drawer( //ящик, бургер
  child: ListView(padding: EdgeInsets.zero, children: [
    DrawerHeader(
      decoration: const BoxDecoration( //декорация для лого
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
                color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              child: Image.network( //подгрузка картинки с сети
               'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/330px-Google-flutter-logo.svg.png'
              ),
            ),
            const Text('Навигация во Flutter') //текст под лого
          ],
        ),

      ),
    ),

        ListTile( //список кнопок
          leading: const Icon(Icons.one_k), //иконка кнопки штаная с оформлением
          title: const Text('Главная'), //заголовок кнопки
          onTap: () { //обработчик
            // Navigator.pop(context);
            Navigator.pushNamed(context, '/'); //метод отправки по маршруту
            // _messengerKey.currentState!.showSnackBar(
            // const SnackBar(content: Text('Переход в каталог')));
          },
        ),

        ListTile(
          leading: const Icon(Icons.two_k),
          title: const Text('Контакты'),
          onTap: () { //обработчик
            Navigator.pushNamed(context, '/contacts');
            // _messengerKey.currentState!.showSnackBar(
            // const SnackBar(content: Text('Переход в каталог')));
          },
        ),
      ]),
);
//(стейтлес виджет управляет отрисовкой статических объектов
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( //материал апп не походит тут!
      appBar: AppBar( //описываем заголовок справа от бургера
        title: const Text('Главная страница')), // текст  заголовке
        drawer: navDrawer(context),
         body: const Center(
          child: Text('Содержание главной страницы'),), //текст содержание страницы
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
            'Содержание страницы контакты'
        ),
      ),
    );
  }
}