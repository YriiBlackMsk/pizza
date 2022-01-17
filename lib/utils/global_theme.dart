//Настройки темы для всего приложения
import 'package:flutter/material.dart';

final fPrimaryColor = Colors.green;//не работает

ThemeData globalTheme() => ThemeData( //Настройка темы (типа css, цвет, стиль и т.п.) всего приложения
  fontFamily: 'Arial Black', //текст глобально
  splashColor: Colors.red, //цвет при нажатии кнопки типа волны глобально

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,//не работает
    primarySwatch: Colors.red, //
  ).copyWith(
    secondary: Colors.green,
  ),
//переопределение типовых значений в шаблонных стилях см.документации, для локальных вариантов
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 50.0, fontWeight: FontWeight.normal),
    headline2: TextStyle(fontFamily: 'Times New Roman', fontSize: 40.0, fontStyle: FontStyle.italic),
    headline3: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    headline4: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
    headline5: TextStyle(fontSize: 10.0, fontStyle: FontStyle.italic),
    bodyText1: TextStyle(fontSize: 15.0, fontFamily: 'Hind'),
    bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
  ),

);


/*
class ThemesApp extends StatelessWidget {
  const ThemesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThemesScreen(),
    );
  }
}


class ThemesScreen extends StatefulWidget {
  const ThemesScreen({Key? key}) : super(key: key);

  @override
  _ThemesScreenState createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //каракас экрана

    );
  }
}
*/
