import 'package:flutter/material.dart';
import 'package:trivia_game/src/pages/HomePage.dart';
import 'package:trivia_game/src/pages/GamePage.dart';
import 'package:trivia_game/src/routes/constants_routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => HomePage());
    case GAME:
      return MaterialPageRoute(builder: (context) => GamePage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
