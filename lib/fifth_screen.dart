import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          backgroundColor: Colors.pink[200],
          appBar: AppBar(title: const Text('Текст Fifth Screen'),),
          body: const Center(child: Text('Текст Fifth Screen'),),
        ));
  }
}