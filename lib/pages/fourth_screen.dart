import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/pages/second_screen.dart';
import 'package:pizza/utils/strings.dart';


class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

//список с разделением
class SimpleListSeparated extends StatelessWidget {
  SimpleListSeparated({Key? key}) : super(key: key);

  var list = List<int>.generate(50, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return MyListItem(number: index);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 3,),
    );
  }
}


class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.green[200], //локальный бэкграунд четвертого экрана
          appBar: AppBar(title: const Text('Текст Fourth Screen')),
          body: SimpleListSeparated(),
          // body: Center(child: Text(Strings.longBodyText4, style: Theme.of(context).textTheme.headline4),),
        ));
  }
}