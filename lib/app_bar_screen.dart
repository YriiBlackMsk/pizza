import 'package:flutter/material.dart';

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({Key? key}) : super(key: key);

  @override
  _AppBarScreenState createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = //основная цветовая схема для текстовой кнопки
        TextButton.styleFrom(
            primary: Theme.of(context).colorScheme.onPrimary
        );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Демо AppBar'), //заголовок
          actions: <Widget> [ //иконка из штатных
            IconButton(
              tooltip: "Баланс", //подсказка при нажатии долгом
              onPressed: () {}, //обработчик при нажатии
              icon: const Icon(Icons.account_balance)),
            IconButton(
              onPressed: () {},
              icon:   const Icon(Icons.settings)),
            TextButton(
                onPressed: () {},
                child: const Text('Профиль'),
                style: buttonStyle, //ссылка на общий стиль в шапке
            ),
          ],
        ),
        body: const Center(
            child: Text('Контент')),
      ),
    );
  }
}
