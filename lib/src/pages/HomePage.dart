import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia_game/src/routes/constants_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, GAME);
        },
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
