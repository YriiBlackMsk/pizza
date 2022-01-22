import 'package:flutter/material.dart';

//класс для отображения страницы
class SixthScreen extends StatefulWidget {
  const SixthScreen({Key? key}) : super(key: key);

  @override
  _SixthScreenState createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Текст Sixth Screen'),),
        body: MyListTileWidget(),
      ),
    );
  }
}

//класс для наполнения боди списком
class MyListTileWidget extends StatefulWidget {
  const MyListTileWidget({Key? key}) : super(key: key);

  @override
  _MyListTileWidgetState createState() => _MyListTileWidgetState();
}

class _MyListTileWidgetState extends State<MyListTileWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index)
      {
        return ListTile(
          title: Text('Item $index'),
          selected: index == _selectedIndex,
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      },
    );
  }
}
