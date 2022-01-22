import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/pages/second_screen.dart'; //работает от класса второго экрана
import 'package:pizza/utils/strings.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}
//создание списка
class SimpleListBuilder extends StatelessWidget {
   SimpleListBuilder({Key? key}) : super(key: key);

  var list = List<int>.generate(20, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 20, //ограничение по количеству, а так неограниченно
        itemBuilder: (BuildContext context, int index) {
          return MyListItem(number: index);
        }
    );
  }
}


class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.teal[200],
          appBar: AppBar(title: const Text('Текст Third Screen'),),
          body: SimpleListBuilder(), //подключаем список
          // body: Center(child: Text(Strings.longBodyText3, style: Theme.of(context).textTheme.headline3),),
        ));
  }
}