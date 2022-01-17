import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/utils/strings.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({Key? key}) : super(key: key);

  @override
  _FifthScreenState createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(title: const Text('Текст Fifth Screen'),),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
            child: SingleChildScrollView(
                child: Center(
                  child: Text(Strings.longBodyText5, style: Theme.of(context).textTheme.headline5),)),
          ),
        ));
  }
}