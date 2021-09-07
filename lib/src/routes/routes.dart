import 'package:flutter/material.dart';
import 'package:trivia_game/src/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => HomeScreen(),
  'details': (_) => DetailsScreen(),
  'actor': (_) => DetailsActorScreen(),
};
