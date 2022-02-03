import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza/auth/counter.dart';
import 'package:pizza/auth/signin_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, //выравнивание по второстепенной оси (в зависимости от row или column)
              mainAxisAlignment: MainAxisAlignment.center, //выравнивание по главной оси (в зависимости от row или column)
              children: [
            Center( //контейнер для картинки

                  child: Image.network(
                      'https://thumbs.gfycat.com/HandyGrouchyHake-size_restricted.gif'
                  ),),

            const SizedBox(height: 20),

             ElevatedButton(
              child: const Text("Покинуть приложение"),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignInScreen()));
                });
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Передумал"),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Counter()));
                });
              },
            ),
          ]),
        ),
      ),
    );
  }
}