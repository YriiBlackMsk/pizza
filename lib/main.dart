import 'package:flutter/material.dart'; //подключение библиотеки с дизайном от андроида
// import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/navigation.dart';
import 'package:pizza/second_screen.dart';
import 'package:pizza/third_screen.dart';
import 'package:pizza/fourth_screen.dart';
import 'package:pizza/fifth_screen.dart';

void main() {
  runApp (const MyApp ()); ////старт приложения с навания страницы, либо MyApp
}
//(стейтфул виджет из 2х классов, изменяет вид от события является динамическим классом
class MyApp extends StatelessWidget { //1 класс используется для хранения переданных параметров и инициализации состояния
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', //индексная страница, может быть либо она, либо home см. выше
      routes: { //прописываем маршруты для страниц
        '/2': (context) => const SecondScreen(),
        '/3': (context) => const ThirdScreen(),
        '/4': (context) => const FourthScreen(),
        '/5': (context) => const FifthScreen(),
    },
      title: 'Что это', //за что отвечает???
      theme: ThemeData( //задает цвет бэкграунда на аппбаре, на футере цвет иконок и текста
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false, //снимает попдис debag
      home: const MainScreen(), //путь до галвной страницы
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: NavigationDrawer(), //отправляет нас в класс навигации
        ),
      ),
    );
  }
}
