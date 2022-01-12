import 'package:flutter/material.dart'; //библиотека с дизайном от андроид
import 'package:google_fonts/google_fonts.dart'; //библиотека со шрифтами от гугл
import 'package:sliding_switch/sliding_switch.dart'; //библиотека для кнопки (переключателя (теста)
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart'; // библиотека также определяет классы DateFormat , NumberFormat и BidiFormatter .

void main() {
  runApp(const PizzaCalculatorScreen());
}

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
      home: Scaffold(
        body: Container(
          width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 62,
                  ),
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/dart-logo 3.png'),
                 ),

                Text('Калькулятор пиццы',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),

                SizedBox(height: 9),

                Text('Выберите параметры:',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color.fromRGBO(0, 0, 0, 1), //цвет текста
                  ),
                ),

                SizedBox(height: 12),

                SizedBox(
                  width: 300,
                  child: SlidingSwitch(
                    value: false,
                    width: 300,
                    onChanged: (bool value) {
                    _isSlimDough = value;
                    setState(() {
                    _calcCost();
                    });
                    },

                    height: 30,
                    animationDuration : const Duration(milliseconds: 100),
                    onTap: () {},
                    onDoubleTap: () {},
                    onSwipe: () {},
                    textOff: "Обычное тесто",
                    textOn: "Тонкое тесто",
                    colorOn: const Color(0xffFFFFFF),
                    colorOff: const Color(0xf0FFFFFF),
                    background: const Color(0xffECEFF1),
                    buttonColor: const Color(0xff0079D0),
                    inactiveColor: const Color(0xff636f7b),
                   ),
                  ),

                const SizedBox(height: 10),

                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: const Text('Размер',
                    style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
                ),

                SizedBox(
                  width: 300,
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

                const SizedBox(height: 10),

                Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: const Text('Соус',
                  style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
                ),

                RadioListTile<Sauce>(
                  title: const Text ('Острый'),
                  value: Sauce.hot,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                ),
                RadioListTile<Sauce>(
                  title: const Text ('Кисло-сладкий'),
                  value: Sauce.sweet,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                ),
                RadioListTile<Sauce>(
                  title: const Text ('Сырный'),
                  value: Sauce.cheese,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                ),

                SizedBox(
                  width:300,
                  child: Card(
                    elevation: 0,
                    color: Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                          ),
                          child: SizedBox(
                          width:38,
                          height: 56,
                            child: Image.asset('assets/dart-logo 4.png'),
                           ),
                          ),

                        Text('Дополнительный сыр:',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            //letterSpacing: -0.015,
                            color: const Color.fromRGBO(0, 0, 0, 1)
                          )
                        ),

                        Switch(
                          value: _addCheese,
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

                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text('Стоимость',
                    style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
                  ),

                SizedBox(
                  width: 300,
                  height: 50,

                  child: Card(
                    elevation: 0,
                    color: const Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10)),
                    child:Text('${_calcCost()} руб.',
                      style: const TextStyle(fontSize: 32, color: Color(0xFF000000)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

              const SizedBox(height: 40),
          ],
        ),
      ),
    )
    );
  }
}

