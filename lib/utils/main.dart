//1.Подключаем библиотеки и ссылки на другие страницы приложения
import 'package:flutter/material.dart'; //подключение библиотеки с дизайном от андроида
import 'package:pizza/pages/page1.dart';
import 'package:pizza/pages/reg.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/utils/navigation.dart';
import 'package:pizza/pages/order.dart';
import 'package:pizza/pages/second_screen.dart';
import 'package:pizza/pages/third_screen.dart';
import 'package:pizza/pages/fourth_screen.dart';
import 'package:pizza/pages/fifth_screen.dart';
import 'package:pizza/utils/global_theme.dart';

//2.Активируем запуск приложения
void main() {
  runApp (const MyApp ()); ////старт приложения с навания страницы, либо MyApp
}

//3.Описываем маршруты, задаем тему (css)
class MyApp extends StatelessWidget { //1 класс используется для хранения переданных параметров и инициализации состояния
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App', //?
      // initialRoute: '/', //индексная страница, может быть либо она, либо home
      routes: { //прописываем маршруты для страниц
        // '/' : (context) => const MainScreen(),
        '/1': (context) => const NavigationDrawer(),
        '/2': (context) => const SecondScreen(),
        '/3': (context) => const ThirdScreen(),
        '/4': (context) => const FourthScreen(),
        '/5': (context) => const FifthScreen(),
        '/6': (context) => const RegPage(),
        '/7': (context) => const PizzaCalculatorScreen(),



    },
       theme: globalTheme(), //глобальный вариант темы, настройка в отдельном файле global_theme
        /*theme: ThemeData( //локальный вариант темы
        fontFamily: 'Georgia',
        splashColor: Colors.yellow,

        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          primarySwatch: Colors.orange,
        ).copyWith(
          secondary: Colors.green,
        ),

        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      */
      debugShowCheckedModeBanner: false, //снимает попдис debag
      home: const PizzaStartPage(), //путь до галвной страницы
    );
  }
}
//4.Рисуем страницу
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
