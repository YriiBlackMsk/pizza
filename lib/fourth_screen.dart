import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          backgroundColor: Colors.teal[200],
          appBar: AppBar(title: const Text('Текст Fourth Screen')),
        ));
  }
}