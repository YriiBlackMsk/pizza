import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/utils/strings.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.green[200], //локальный бэкграунд четвертого экрана
          appBar: AppBar(title: const Text('Текст Fourth Screen')),
          body: Center(child: Text(Strings.longBodyText4, style: Theme.of(context).textTheme.headline4),),
        ));
  }
}