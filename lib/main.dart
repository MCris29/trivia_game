import 'package:flutter/material.dart';
import 'package:trivia_game/src/providers/categories_provider.dart';
import 'package:trivia_game/src/routes/constants_routes.dart';
import 'package:trivia_game/src/routes/router.dart' as router;
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Trivia Game',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    // onGenerateRoute: router.generateRoute,
    //   initialRoute: HOME,
    // );

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CategoriesProvider())],
      child: MaterialApp(
        title: 'Trivia Game',
        initialRoute: HOME,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
