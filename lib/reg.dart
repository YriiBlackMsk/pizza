import 'package:flutter/material.dart'; //подключение библиотеки с дизайном от андроид
import 'package:google_fonts/google_fonts.dart'; //подключение библиотеки со шрифтами от гугл

void main() { //запуск программы
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //общая константа для стиля границ окон ввода
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)), //радиус скругления бордюра
        borderSide: BorderSide(
            color: Color(0xFFbbbbbb), width: 0.01)); //цвет бордюра

    return MaterialApp( //добавить остальные атрибуты
      //не работает тема, поэтому этот костыль, глобальная переменная по оформлению шрифтов, если у шрифта нет своего определения берет эту
      theme:ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold( //общий каркас для контейнеров и т.п.
        backgroundColor: const Color(0xffffffff), //установка цвета общего фона
        body: Container( //контейнер для наполнения содержимым
          padding: const EdgeInsets.symmetric(horizontal: 10), //симметричный горизонтальный отступ
          child: SingleChildScrollView( //прокрутка страницы содержимого внутри скобок
            child: Column( //построение содержимого в колонку
              children: [ //перечисление содержимого внутри колонки установлено по умолчанию константой

                const SizedBox(height: 81), //надо 34 но сделал 81 отступ сверху

                Row( //построение содержимого в ряд
                   crossAxisAlignment: CrossAxisAlignment.center, //выравнивание по второстепенной оси (в зависимости от row или column)
                   mainAxisAlignment: MainAxisAlignment.center, //выравнивание по главной оси (в зависимости от row или column)
                    children: [
                      Container( //контейнер для картинки
                          height: 20,
                          width: 20,
                          child: Image.asset('assets/dart-logo 2.png')),

                    const SizedBox(width: 9), //пробел

                    Text(' Регистрация', //текст
                        // textAlign: TextAlign.center,//центрирование
                        style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w800, //жирность шрифта 400
                                fontStyle: FontStyle.normal, //наклон шрифта
                                fontSize: 20, //размер шрифта в пикселях
                                letterSpacing: -0.01, //межбуквенный интервал -1%
                                color: Color.fromRGBO(92, 92, 92, 1), //цвет текста,
                                height: 0.87, //line-height высота строки
                            ))),
                  ],
                ),

                const SizedBox(height: 15), //пробел

                const Divider( //подчеркивание, разделитель
                  thickness: 1,
                  height: 15,
                  color: Color.fromRGBO(196, 196, 196, 1.0),
                ),

                const SizedBox(height: 7), //отступ
                //текст
                Text(
                  'Чтобы зарегистрироваться введите\n свой номер телефона и почту', //текст к выводу
                  textAlign: TextAlign.center,//текст к выводу
                  style: GoogleFonts.roboto( //стиль шрифта
                    fontStyle: FontStyle.normal, //наклон шрифта
                    fontWeight: FontWeight.w400, //жирность шрифта 400
                    fontSize: 19, //размер шрифта в пикселях
                    letterSpacing: -0.015, //межбуквенный интервал
                    color: const Color.fromRGBO(196, 196, 196, 1.0), //цвет текста
                  ),
                ),
                const SizedBox(height: 14), //отступ
                //заголовок
                Text('Телефон',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          letterSpacing: -0.015,
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                        ))),

                const SizedBox(height: 6), //отступ

                //поле ввода телефона
                const TextField(
                  keyboardType: TextInputType.phone, //способ вывода клавиатуры
                  decoration: InputDecoration( //оформление декорации-фон на фоне
                    filled: true,
                    fillColor: Color(0xFFeceff1), //цвет декорации
                    enabledBorder: borderStyle, //отображение границ окна ввода до нажатия, см. общую константу
                    focusedBorder: borderStyle, //отображение границ окна ввода после нажатия-фокусировки см. общую константу
                    // labelText: '+7', //отображаемый текст до нажатия
                    hintText: '+7', //отображаемый текст при активации окна
                  ),
                ),

                const SizedBox(height: 14,), //отступ

                //заголовок
                Text('Почта',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          letterSpacing: -0.015,
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                        ))),

                const SizedBox(height: 6,), //отступ

                //поле ввода почты
                const TextField(
                  obscureText: true, //скрыть пароль при введении
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle, //отображение границ окна ввода до нажатия, см. общую константу
                    focusedBorder: borderStyle, //отображение границ окна ввода после нажатия-фокусировки см. общую константу
                  ),
                ),

                  const SizedBox(height: 24),
                    Text(
                      'Вам придет четырехзначный код,\n который будет вашим паролем', //текст к выводу
                      textAlign: TextAlign.center,//текст к выводу
                      style: GoogleFonts.roboto( //стиль шрифта
                        fontStyle: FontStyle.normal, //наклон шрифта
                        fontWeight: FontWeight.normal, //жирность шрифта 400
                        fontSize: 16, //размер шрифта в пикселях
                        letterSpacing: -0.015, //межбуквенный интервал
                        color: const Color.fromRGBO(0, 0, 0, 0.6), //цвет текста
                      ),
                    ),

                //отступ
                const SizedBox(height: 14), //отступ
                //текст
                Text(
                  'Изменить пароль можно\n будет в личном кабинете после\n регистрации', //текст к выводу
                  textAlign: TextAlign.center,//текст к выводу
                  style: GoogleFonts.roboto( //стиль шрифта
                    fontStyle: FontStyle.normal, //наклон шрифта
                    fontWeight: FontWeight.normal, //жирность шрифта 400
                    fontSize: 16, //размер шрифта в пикселях
                    letterSpacing: -0.015, //межбуквенный интервал
                    color: const Color.fromRGBO(0, 0, 0, 0.6), //цвет текста
                  ),
                ),

                const SizedBox(height: 32), //отступ

                //кнопка, добавить остальные атрибуты шрифта
                SizedBox(width: 154, height: 42, child:
                ElevatedButton(onPressed: () {},
                  child: const Text('Отправить код'),
                  style: ElevatedButton.styleFrom( //формат кнопка
                    primary: const Color(0xFF0079D0), //цвет
                    shape: RoundedRectangleBorder( //форма Rectangle-прямоугольник
                      borderRadius: BorderRadius.circular(22.0), //радиус скргленный
                    ),
                  ),
                ),
                ),

                const SizedBox(height: 84,), //отступ
              ],  //Children
            ),
          ),
        ),
      ),
    );
  }
}

