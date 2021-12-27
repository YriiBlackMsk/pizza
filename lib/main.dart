import 'package:flutter/material.dart'; //подключение библиотеки с дизайном от андроид

void main() { //запуск программы
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold( //общий каркас для контейнеров и т.п.
      backgroundColor: Color(0xffffffff), //установка цвета общего фона
        body: Container( //контейнер для наполнения содержимым
          padding: EdgeInsets.symmetric(horizontal: 50), //симметричный горизонтальный отступ
          child: SingleChildScrollView( //прокрутка страницы содержимого внутри скобок
            child: Column( //выравнивание сожержимого в колонку
                children: const [ //перечисление содержимого внутри колонки установлено по умолчанию константой

                  SizedBox(height: 150,), //отступ
                  //логотип
                  SizedBox(width: 110.02, height: 83.78, //ширина и высота коробки в которой будет содержимое
                    child: Image(image: AssetImage('assets/img.png')),), //ссылаемся на картинку в папке, требуется прописать в pubspec.yaml настройку

                  SizedBox(height: 20,), //отступ
                  //текст
                  Text('Введите логин в виде 10 цифр номера телефона',
                    style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6) ),),

                  SizedBox(height: 20,), //отступ
                  //поле ввода телефона
                  TextField(
                    keyboardType: TextInputType.phone, //способ вывода клавиатуры
                    decoration: InputDecoration( //оформление декорации-фон на фоне
                      filled: true,
                      fillColor: Color(0xFFeceff1), //цвет декорации
               //       enabledBorder: borderStyle, //стиль оформления выненсен в отельный
               //       focusedBorder: borderStyle, //стиль оформления выненсен в отельный
                      labelText: 'Телефон', //текст на фоне
                    ),
                  ),

                  SizedBox(height: 20,), //отступ
                  //поле ввода пароля
                  TextField(
                    obscureText: true, //скрыть пароль при введении
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                //      enabledBorder: borderStyle,
                //      focusedBorder: borderStyle,
                      labelText: 'Пароль',
                    ),
                  ),

                  SizedBox(height: 20,), //отступ
                  //кнопка
                  // SizedBox(height: 20,),
                  // SizedBox(width: 154, height: 42, child:
                  // ElevatedButton(onPressed: () {},
                  //   child: Text('Войти'),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Color(0xFF0079D0),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(36.0),
                  //     ),
                  //   ),
                  // )
                  // ),
                  SizedBox(height: 32,),

             ],  //Children
            ),
          ),
        ),
      ),
    );
  }
}
