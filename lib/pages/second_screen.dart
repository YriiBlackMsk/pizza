import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/utils/strings.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

//Виджет для body: const SimpleList(), просто список и список с оформлением статичный
class SimpleList extends StatelessWidget {
  const SimpleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        Text('первый'),
        Text('Второй'),
        MyListItem(number: 1),
        MyListItem(number: 2),
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Map'),),
      ],
    );
  }
}

class MyListItem extends StatelessWidget {
  const MyListItem({Key? key, required this.number}) : super(key: key);

  //final string text;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all()
      ),
      child: Text('Элемент # $number',
          style: Theme.of(context).textTheme.headline6),
    );
  }
}


class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.amber[50],//локальный бэкграунд второго экрана
          appBar: AppBar(title: const Text('Текст Second Screen'),), //заголовок второго экрана

          body: const SimpleList(),
          // body: Center(
          //   child: Text(Strings.longBodyText2, style: Theme.of(context).textTheme.headline2),
          // ), //контент боди второго экрана, забирает данные с файла стрингс, для мультиязычной поддержки и редактирования
        ));
  }
}