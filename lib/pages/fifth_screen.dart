import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza/utils/strings.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({Key? key}) : super(key: key);

  @override
  _FifthScreenState createState() => _FifthScreenState();
}

//выбираемый список
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 50,
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


class _FifthScreenState extends State<FifthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.white, //локальный бэкграунд пятого жкрана
          appBar: AppBar(title: const Text('Текст Fifth Screen'),),
        body: MyStatefulWidget(),
        //   body: Padding(
        //     padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
        //      child: SingleChildScrollView(//локальный скроллинг
        //         child: Center(
        //           child: Text(Strings.longBodyText5, style: Theme.of(context).textTheme.headline5),)),
        // ),
      ),
    );
  }
}