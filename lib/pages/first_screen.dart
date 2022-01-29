import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/utils/strings.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
           //backgroundColor: Colors.amber[50],//локальный бэкграунд первого экрана
          body: SingleChildScrollView(
            child: Center(
             child: Column(
               children: [
                 Text('text', style: GoogleFonts.oswald()),
                 Text(Strings.longBodyText8, style: GoogleFonts.getFont('Lato')),//динамически подгружаем
                 Text(Strings.longBodyText8, style: GoogleFonts.lato(
                   textStyle: const TextStyle(color: Colors.blue, letterSpacing: 2.5)
                 )),
                 Text(Strings.longBodyText8, style: GoogleFonts.lato(
                     textStyle: Theme.of(context).textTheme.headline6,
                     fontSize: 48),
                 ),
                 // Container(
                  //  height: 100,
                  //   color: Theme.of(context).colorScheme.secondary,
                  // ),
                ],
             ), //текст глвной страницы
            ),
          ),
        ),
    );
  }
}