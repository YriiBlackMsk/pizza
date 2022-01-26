import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeventhScreen extends StatefulWidget {
  const SeventhScreen({Key? key}) : super(key: key);

  @override
  _SeventhScreenState createState() => _SeventhScreenState();
}

class _SeventhScreenState extends State<SeventhScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.amber[50],//локальный бэкграунд второго экрана
          appBar: AppBar(title: const Text('Текст Second Screen'),), //заголовок второго экрана

          body: Center(
            child: RaisedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment Counter'),
            ),
          ),
        ),
    );
  }

  _incrementCounter() async {
    SeventhScreen prefs = await SeventhScreen.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }
}
/*
class User {
  late String name;
  late String phone;

  User({required this.name, required this.phone});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Телефонная книга'),
      ),
      body: const Center(child: UserListWidget()),
    );
  }
}

class UserListWidget extends StatefulWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  List<User> users = [
    User(name: "Anna", phone: "+79516437515"),
    User(name: "Philipo", phone: "+793685759"),
    User(name: "Julia", phone: "+709875385"),
    User(name: "Piter", phone: "+7957875445"),
    User(name: "Anna", phone: "+79516437515"),
    User(name: "Philipo", phone: "+793685759"),
    User(name: "Julia", phone: "+709875385"),
    User(name: "Piter", phone: "+7957875445"),
    User(name: "Anna", phone: "+79516437515"),
    User(name: "Philipo", phone: "+793685759"),
    User(name: "Julia", phone: "+709875385"),
    User(name: "Piter", phone: "+7957875445"),
    User(name: "Anna", phone: "+79516437515"),
    User(name: "Philipo", phone: "+793685759"),
    User(name: "Julia", phone: "+709875385"),
    User(name: "Piter", phone: "+7957875445"),
    User(name: "Anna", phone: "+79516437515"),
    User(name: "Philipo", phone: "+793685759"),
    User(name: "Julia", phone: "+709875385"),
    User(name: "Piter", phone: "+7957875445"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          // print(index);
          //return Text('sdfsdf');
          return PersonCardWidget(
            name: users[index].name,
            phone: users[index].phone,
          );
        });
  }
}

class PersonCardWidget extends StatelessWidget {
  late String name;
  late String phone;
  PersonCardWidget({Key? key, required this.name, required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: InkWell(
            onTap: () {
              //debugPrint('Card tapped.');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    children: [
                      const Icon(Icons.supervised_user_circle),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(name),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    children: [
                      const Icon(Icons.phone),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(phone)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
