import 'package:flutter/material.dart'; //подключение библиотеки с дизайном от андроида
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/navigation.dart';

void main() {runApp (const MyApp ()); ////старт приложения с навания страницы, либо MyApp
}
//(стейтфул виджет из 2х классов, изменяет вид от события является динамическим классом
class MyApp extends StatelessWidgetWidget { //1 класс используется для хранения переданных параметров и инициализации состояния
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { //описываем
    return MaterialApp(
      //home: const MainScreen(),
      initialRoute: '/', //индексная страница, может быть либо она, либо home см. выше
      routes: { //прописываем маршруты для страниц
        '/': (context) => const MainScreen(),
        '/2': (context) => const SecondScreen(),
        // '/3': (context) => const ThirdScreen(),
        // '/4': (context) => const FourthScreen(),
      },
      title: 'Trader Camp',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
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
          child: NavigationDrawer(),
        ),
      ),
    );
  }
}
