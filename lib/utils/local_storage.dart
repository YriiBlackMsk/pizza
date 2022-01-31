/*import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _LocalFile async {
    final path = await _LocalPath;
    return File ('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      //читает файл
      final contents = await fail.readAsString();

      return int.parse(contents);
    } catch (e) {
      //если ошибка вернуть ноль
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    //запись в файл
    return file.writeAsString('$counter');
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    })
  }

  Future<File> _incrementCounter2() {
    setState(() {
      _counter++;
    });
    //запись переменной как строку в файл
    return widget.storage.writeCounter(_counter);
  }

  //что дальше писать?
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
*/