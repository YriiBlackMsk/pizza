//Настройки темы для всего приложения
import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData( //Настройка темы (типа css, цвет, стиль и т.п.) всего приложения
  //глобальный вариант темы
  scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),//бэкграунд всех страниц, кроме подвала
  fontFamily: 'Georgia', //стиль текста глобально
  splashColor: Colors.blue, //цвет нажатия на кнопку волна нарастающая

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,//переключение с dark контрасный на light  меняется на аппбар и кнопках, также в бургере, текст не читаем на светлом фоне
    primarySwatch: Colors.deepPurple, //цвет бэкграунда аппбара и футера (BottomNavigationBarItem)
  ).copyWith(
    secondary: Colors.red, //цвет кнопок подвала в основном
  ),

  textTheme: const TextTheme( //переопределение темы
    headline1: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
    headline3: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    headline4: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 10.0, fontFamily: 'Hind'),
  ),
);