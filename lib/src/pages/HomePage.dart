import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia_game/src/routes/constants_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = new InkWell(
        onTap: () {
          Navigator.pushNamed(context, GAME);
        },
        child: new Container(
          margin: new EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          height: 50.0,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(30.0),
              color: Colors.blue),
          child: new Center(
            child: new Text("Play Now",
                style: const TextStyle(color: Colors.white)),
          ),
        ));

    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            new Backhome(),
            new Positioned(
                bottom: 0.0,
                child: new Container(
                  alignment: Alignment.center,
                  margin: new EdgeInsets.only(bottom: 50.0),
                  width: MediaQuery.of(context).size.width,
                  child: new Column(
                    children: <Widget>[button],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Backhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Colors.black87),
    );
  }
}
