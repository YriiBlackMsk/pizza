import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/utils/strings.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.amber[50],//локальный бэкграунд второго экрана
          appBar: AppBar(title: const Text('Текст Second Screen'),), //заголовок второго экрана
          body: Center(child: Text(Strings.longBodyText2, style: Theme.of(context).textTheme.headline2),), //контент боди второго экрана, забирает данные с файла стрингс, для мультиязычной поддержки и редактирования
        ));
  }
}