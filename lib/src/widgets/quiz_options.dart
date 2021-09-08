import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trivia_game/src/models/category.dart';
import 'package:trivia_game/src/models/question.dart';
import 'package:trivia_game/src/providers/api_provider.dart';
import 'package:trivia_game/src/pages/error.dart';
import 'package:trivia_game/src/pages/quiz_page.dart';

class QuizOptionsDialog extends StatefulWidget {
  final Category category;

  const QuizOptionsDialog({Key key, this.category}) : super(key: key);

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog> {
  int _noOfQuestions;
  String _difficulty;
  bool processing;

  @override
  void initState() {
    super.initState();
    _noOfQuestions = 10;
    _difficulty = "easy";
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: Colors.green,
                child: Center(
                  child: Text(
                    widget.category.name,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                child: Text(
                  "Selecciona el total de preguntas:",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                runSpacing: 16.0,
                spacing: 16.0,
                children: <Widget>[
                  SizedBox(width: 0.0),
                  ActionChip(
                    label: Text("10"),
                    labelStyle: TextStyle(
                        color:
                            _noOfQuestions == 10 ? Colors.black : Colors.white),
                    backgroundColor: _noOfQuestions == 10
                        ? Colors.green
                        : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(10),
                  ),
                  ActionChip(
                    label: Text("20"),
                    labelStyle: TextStyle(
                        color:
                            _noOfQuestions == 20 ? Colors.black : Colors.white),
                    backgroundColor: _noOfQuestions == 20
                        ? Colors.green
                        : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(20),
                  ),
                  ActionChip(
                    label: Text("30"),
                    labelStyle: TextStyle(
                        color:
                            _noOfQuestions == 30 ? Colors.black : Colors.white),
                    backgroundColor: _noOfQuestions == 30
                        ? Colors.green
                        : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(30),
                  ),
                  ActionChip(
                    label: Text("40"),
                    labelStyle: TextStyle(
                        color:
                            _noOfQuestions == 40 ? Colors.black : Colors.white),
                    backgroundColor: _noOfQuestions == 40
                        ? Colors.green
                        : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(40),
                  ),
                  ActionChip(
                    label: Text("50"),
                    labelStyle: TextStyle(
                        color:
                            _noOfQuestions == 50 ? Colors.black : Colors.white),
                    backgroundColor: _noOfQuestions == 50
                        ? Colors.green
                        : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(50),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                child: Text(
                  "Selecciona la dificultad:",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                runSpacing: 16.0,
                spacing: 16.0,
                children: <Widget>[
                  SizedBox(width: 0.0),
                  ActionChip(
                    label: Text("Al azar"),
                    labelStyle: TextStyle(
                        color:
                            _difficulty == null ? Colors.black : Colors.white),
                    backgroundColor: _difficulty == null
                        ? Colors.green
                        : Colors.grey.shade600,
                    onPressed: () => _selectDifficulty(null),
                  ),
                  ActionChip(
                    label: Text("Fácil"),
                    labelStyle: TextStyle(
                        color: _difficulty == "easy"
                            ? Colors.black
                            : Colors.white),
                    backgroundColor: _difficulty == "easy"
                        ? Colors.green
                        : Colors.grey.shade600,
                    onPressed: () => _selectDifficulty("easy"),
                  ),
                  ActionChip(
                    label: Text("Medio"),
                    labelStyle: TextStyle(
                        color: _difficulty == "medium"
                            ? Colors.black
                            : Colors.white),
                    backgroundColor: _difficulty == "medium"
                        ? Colors.green
                        : Colors.grey.shade600,
                    onPressed: () => _selectDifficulty("medium"),
                  ),
                  ActionChip(
                    label: Text("Difícil"),
                    labelStyle: TextStyle(
                        color: _difficulty == "hard"
                            ? Colors.black
                            : Colors.white),
                    backgroundColor: _difficulty == "hard"
                        ? Colors.green
                        : Colors.grey.shade600,
                    onPressed: () => _selectDifficulty("hard"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            processing
                ? CircularProgressIndicator(
                    color: Colors.green,
                  )
                : RaisedButton(
                    color: Colors.green,
                    child: Text(
                      "Comenzar a responder",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: _startQuiz,
                  ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  _selectNumberOfQuestions(int i) {
    setState(() {
      _noOfQuestions = i;
    });
  }

  _selectDifficulty(String s) {
    setState(() {
      _difficulty = s;
    });
  }

  void _startQuiz() async {
    setState(() {
      processing = true;
    });
    try {
      List<Question> questions =
          await getQuestions(widget.category, _noOfQuestions, _difficulty);
      Navigator.pop(context);
      if (questions.length < 1) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ErrorPage(
                  message: "No hay suficientes preguntas para esta categoría",
                )));
        return;
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => QuizPage(
                    questions: questions,
                    category: widget.category,
                  )));
    } on SocketException catch (_) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => ErrorPage(
                    message: "No se pudo conectar con el servidor",
                  )));
    } catch (e) {
      print(e.message);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => ErrorPage(
                    message: "Ocurrió un error, no se pudo conectar con la API",
                  )));
    }
    setState(() {
      processing = false;
    });
  }
}
