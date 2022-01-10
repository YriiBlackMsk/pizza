import 'package:flutter/material.dart'; //подключение библиотеки с дизайном от андроид
import 'package:google_fonts/google_fonts.dart'; //подключение библиотеки со шрифтами от гугл
//тема не работает
// ThemeData themeData(BuildContext context) {
//   return ThemeData(
//       textTheme: GoogleFonts.macondoTextTheme().copyWith(
//         bodyText1: TextStyle(color: Colors.red,fontSize: 32) //test
//       ),
//   );
// }
//тема

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
    //общая константа для стиля гиперссылок
    const linkTextStyle = TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.015, //межбуквенный интервал
      color: Color.fromRGBO(0, 121, 208, 1), //цвет текста
    );

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
          padding: const EdgeInsets.symmetric(horizontal: 50), //симметричный горизонтальный отступ
          child: SingleChildScrollView( //прокрутка страницы содержимого внутри скобок
            child: Column( //выравнивание сожержимого в колонку
               children: [ //перечисление содержимого внутри колонки установлено по умолчанию константой

                  // const SizedBox(height: 81), //отступ сверху
                  // //логотип
                  // const SizedBox(width: 103, height: 79.42, //ширина и высота коробки в которой будет содержимое
                  //   child: Image(image: AssetImage('assets/img.png')),), //ссылаемся на картинку в папке, требуется прописать в pub spec yaml настройку

                  const SizedBox(height: 18.58,), //отступ
                  //текст
                      Text(
                     'Введите логин в виде 10 цифр\n номера телефона', //текст к выводу
                     textAlign: TextAlign.center,//текст к выводу
                     style: GoogleFonts.roboto( //стиль шрифта
                     textStyle: Theme.of(context).textTheme.headline4,
                     fontStyle: FontStyle.normal, //наклон шрифта
                     fontWeight: FontWeight.normal, //жирность шрифта 400
                     fontSize: 16, //размер шрифта в пикселях
                     letterSpacing: -0.015, //межбуквенный интервал
                     color: const Color.fromRGBO(0, 0, 0, 0.6), //цвет текста
                   ),
                 ),
                  const SizedBox(height: 20,), //отступ
                     //поле ввода телефона
                  const TextField(
                    keyboardType: TextInputType.phone, //способ вывода клавиатуры
                    decoration: InputDecoration( //оформление декорации-фон на фоне
                      filled: true,
                      fillColor: Color(0xFFeceff1), //цвет декорации
                      enabledBorder: borderStyle, //отображение границ окна ввода до нажатия, см. общую константу
                      focusedBorder: borderStyle, //отображение границ окна ввода после нажатия-фокусировки см. общую константу
                      labelText: 'Номер телефона', //текст на фоне
                    ),
                  ),

                  const SizedBox(height: 20,), //отступ
                  //поле ввода пароля
                  const TextField(
                    obscureText: true, //скрыть пароль при введении
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                     enabledBorder: borderStyle, //отображение границ окна ввода до нажатия, см. общую константу
                     focusedBorder: borderStyle, //отображение границ окна ввода после нажатия-фокусировки см. общую константу
                      labelText: 'Пароль',
                    ),
                  ),

                  const SizedBox(height: 28,), //отступ
                  //кнопка, добавить остальные атрибуты шрифта
                  SizedBox(width: 154, height: 42, child:
                  ElevatedButton(onPressed: () {},
                    child: const Text('Войти'),
                    style: ElevatedButton.styleFrom( //формат кнопка
                      primary: const Color(0xFF0079D0), //цвет
                      shape: RoundedRectangleBorder( //форма Rectangle-прямоугольник
                        borderRadius: BorderRadius.circular(22.0), //радиус скргленный
                        ),
                      ),
                    ),
                  ),
                 const SizedBox(height: 62,), //отступ
                 //ссылка
                 InkWell(child: const Text('Регистрация',
                   style: linkTextStyle,), onTap: () {}),

                 const SizedBox(height: 19,), //отступ
                 //ссылка
                 InkWell(child: const Text('Забыли пароль?',
                   style: linkTextStyle,), onTap: () {}),

                 const SizedBox(height: 84,), //отступ
            ],  //Children
            ),
          ),
        ),
      ),
    );
  }
}

