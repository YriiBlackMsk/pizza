import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; //библиотека с дизайном от андроид
import 'package:google_fonts/google_fonts.dart'; //библиотека со шрифтами от гугл
import 'package:sliding_switch/sliding_switch.dart'; //библиотека для кнопки (переключателя (теста)
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart'; // библиотека также определяет классы DateFormat , NumberFormat и BidiFormatter .

// void main() {
//   runApp(const PizzaCalculatorScreen());
// }

class PizzaCalculatorScreen extends StatefulWidget {
  const PizzaCalculatorScreen({Key? key}) : super(key: key);

  @override
  _PizzaCalculatorScreenState createState() => _PizzaCalculatorScreenState();
}

enum Sauce { hot, sweet, cheese }

class _PizzaCalculatorScreenState extends State<PizzaCalculatorScreen> {
  bool _isSlimDough = false;
  double _pizzaSize = 40;
  int _cost = 100;
  Sauce? _sauce = Sauce.hot;
  bool _addCheese = true;

  int _calcCost() {
    _cost = _pizzaSize.round() + 100; //с округлением (round)

    if (_isSlimDough == true) _cost += 30;
    if (_addCheese == true) _cost += 50;

    switch (_sauce) {
      case Sauce.hot:
        _cost += 10;
        break;
      case Sauce.sweet:
        _cost += 20;
        break;
      case Sauce.cheese:
        _cost += 40;
        break;
      case null:
        _sauce = Sauce.hot;
        break;
    }
    return _cost;
  }

  void _onSauceChanged(Sauce? value) {
    setState(() {
      _sauce = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor, //установка цвета общего фона//локально backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 81),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start, //выравнивание по второстепенной оси (в зависимости от row или column)
                  mainAxisAlignment: MainAxisAlignment.end, //выравнивание по главной оси (в зависимости от row или column)
                    children: [
                      SizedBox( //контейнер для картинки
                      height: 123,
                      width: 232,
                      child: Image.asset('assets/dart-logo 3.png')
                      )]),

              const SizedBox(height: 20),

              Text('Калькулятор пиццы',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),

              const SizedBox(height: 9),

              Text('Выберите параметры:',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color.fromRGBO(0, 0, 0, 1), //цвет текста
                ),
              ),

              const SizedBox(height: 33),

              SizedBox(
                width: 300,
                height: 34,
                child: SlidingSwitch(
                  value: false,
                  width: 300,
                  onChanged: (bool value) {
                    _isSlimDough = value;
                    setState(() {
                    _calcCost();
                    });
                  },
                  height: 34,

                  onTap: () {},
                  onDoubleTap: () {},
                  onSwipe: () {},
                  textOff: "Обычное тесто",
                  textOn: "Тонкое тесто",
                  colorOn: const Color(0xffFFFFFF), //текст при нажатии кнопка 1
                  colorOff: const Color(0xffFFFFFF), //текст при нажатии кнопка 2
                  background: const Color(0xffECEFF1), //задний фон
                  buttonColor: const Color(0xff0079D0), //цвет кнопки
                  inactiveColor: const Color(0xff999999), // текст не нажатый
                 ),
                ),

              const SizedBox(height: 19),

              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                child: const Text('Размер:',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      letterSpacing: -0.015,
                      color: Color.fromRGBO(0, 0, 0, 1)))),

              const SizedBox(height: 5),

              SizedBox(
                width: 300,
                height: 34,
                child: SfSlider(
                  min: 20,
                  max: 60,
                  value: _pizzaSize,
                  interval: 20,
                  showTicks: true,
                  showLabels: true,
                  numberFormat: NumberFormat("## cm"),
                  enableTooltip: false,
                  minorTicksPerInterval: 0,
                  stepSize: 20,
                  onChanged: (dynamic value){
                    setState(() {
                    _pizzaSize = value;
                    _calcCost();
                  });
                 },
                )),

              const SizedBox(height: 23),

              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text('Соус',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 2.0,
                          color: Color.fromRGBO(38, 50, 56, 1)))),

              RadioListTile<Sauce>(
                controlAffinity: ListTileControlAffinity.trailing, //радиобаттон слева
                title: const Text ('Острый',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        // letterSpacing: 2.0,
                        color: Color.fromRGBO(51, 51, 51, 1))),
                value: Sauce.hot,
                groupValue: _sauce,
                onChanged: _onSauceChanged,
                activeColor: const Color.fromRGBO(93, 176, 117, 1),
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
              ),

              const Divider(
                thickness: 1,
                height: 15,
                color: Color.fromRGBO(232, 232, 232, 1),
              ),

              RadioListTile<Sauce>(
                controlAffinity: ListTileControlAffinity.trailing, //радиобаттон слева
                title: const Text ('Кисло-сладкий',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      // letterSpacing: 2.0,
                      color: Color.fromRGBO(51, 51, 51, 1))),
                value: Sauce.sweet,
                groupValue: _sauce,
                onChanged: _onSauceChanged,
                activeColor: const Color.fromRGBO(93, 176, 117, 1),
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
              ),

              const Divider( //подчеркивание, разделитель
                thickness: 1,
                height: 15,
                color: Color.fromRGBO(232, 232, 232, 1),
              ),

              RadioListTile<Sauce>(
                controlAffinity: ListTileControlAffinity.trailing, //радиобаттон слева
                title: const Text ('Сырный',
                    style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    // letterSpacing: 2.0,
                    color: Color.fromRGBO(51, 51, 51 , 1))),
                value: Sauce.cheese,
                groupValue: _sauce,
                onChanged: _onSauceChanged,
                activeColor: const Color.fromRGBO(93, 176, 117, 1),
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
              ),

              const Divider( //подчеркивание, разделитель
                thickness: 1,
                height: 15,
                color: Color.fromRGBO(232, 232, 232, 1),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width:291,
                height: 56,
                child: Card(
                  elevation: 0,
                  color: const Color(0xFFF0F0F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 6,
                        ),
                        child: SizedBox(
                        width:36,
                        height: 34,
                          child: Image.asset('assets/dart-logo 4.png'),
                         ),
                        ),

                      Text('Дополнительный сыр:',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          letterSpacing: 1,
                          color: const Color.fromRGBO(38, 50, 56, 1)
                        )
                      ),

                      Switch(
                        value: _addCheese,
                        activeColor: const Color.fromRGBO(17, 77, 164, 1),
                        onChanged: (bool value) {
                         setState(() {
                           _addCheese = value;
                           _calcCost();
                          });
                         }),
                     ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 25),
                  child: const Text('Стоимость',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          letterSpacing: -1.5,
                          color: Color.fromRGBO(0, 0, 0, 1)))),

              const SizedBox(height: 10),

              SizedBox(
                width: 300,
                height: 34,
                child: Card(
                  elevation: 0, //3д эффект кнопки
                  color: const Color(0xFFECEFF1),
                  shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(36)),
                  child:Text('${_calcCost()} руб.',
                    style: const TextStyle(
                     //выравнивание по второстепенной оси (в зависимости от row или column)
                     fontWeight: FontWeight.w800,
                     fontSize: 16,
                     color: Color(0xFF000000)),
                     textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(width: 154, height: 42, child:
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/1'); //переход на страницу два
                },
                  child: const Text('Заказать'),
                  style: ElevatedButton.styleFrom( //формат кнопка
                    primary: const Color(0xFF0079D0), //цвет
                    shape: RoundedRectangleBorder( //форма Rectangle-прямоугольник
                      borderRadius: BorderRadius.circular(22.0), //радиус скргленный
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(width: 40, height: 40, child:
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/'); //переход на страницу два
                },
                  child: const Text('X'),
                  style: ElevatedButton.styleFrom( //формат кнопка
                    primary: const Color.fromRGBO(255, 167, 153, 1), //цвет
                    shape: RoundedRectangleBorder( //форма Rectangle-прямоугольник
                      borderRadius: BorderRadius.circular(22.0), //радиус скргленный
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
           ],
          ),
        ),
      )
    );
  }
}

