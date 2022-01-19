import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/utils/strings.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.teal[200],
          appBar: AppBar(title: const Text('Текст Third Screen'),),
          body: Center(child: Text(Strings.longBodyText3, style: Theme.of(context).textTheme.headline3),),
        ));
  }
}