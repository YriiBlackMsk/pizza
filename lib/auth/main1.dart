import 'package:firebase_core/firebase_core.dart'; //подключенные библиотеки
import 'package:pizza/auth/reset_password.dart';
import 'package:pizza/auth/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:pizza/auth/counter.dart';
import 'package:pizza/auth/infouser.dart';
import 'package:pizza/auth/home_screen.dart';
import 'package:pizza/auth/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//3.Описываем маршруты, задаем тему (css)
class MyApp extends StatelessWidget { //1 класс используется для хранения переданных параметров и инициализации состояния
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'Pizza App', //название приожения для десктопа
      debugShowCheckedModeBanner: false, //снимает попдис debag
      // initialRoute: '/', //индексная страница, может быть либо она, либо home
      routes: { //прописываем маршруты для страниц
        // '/' : (context) => const MainScreen(),
        '/ HomeScreen': (context) => const HomeScreen(),
        '/1': (context) => InfoUser(),
        '/2': (context) => const SignInScreen(),
        '/3': (context) => const Counter(),
        '/4': (context) => const SignUpScreen(),
        '/5': (context) => const ResetPassword(),
      },
      home: const Counter(), //путь до галвной страницы
    );
  }
}

