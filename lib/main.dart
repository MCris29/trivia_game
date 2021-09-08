import 'package:flutter/material.dart';
import 'package:trivia_game/src/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Juego de Preguntas',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.indigo,
          fontFamily: "Montserrat",
          buttonColor: Colors.pink,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              textTheme: ButtonTextTheme.primary)),
      home: HomePage(),
    );
  }
}
