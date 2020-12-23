import 'package:flutter/material.dart';

import 'package:flutter_app/Service/Question.dart';
import 'package:flutter_app/Service/QuizManager.dart';
import 'package:flutter_app/Screens/ResultPage.dart';

class FlutterQuiz extends StatefulWidget {
  @override
  _FlutterQuizState createState() => _FlutterQuizState();
}

class _FlutterQuizState extends State<FlutterQuiz> {

  QuizManager _manager = QuizManager();

  List<Widget> getOptions(Question question) {
    List<Widget> optionButtons = [];
    for(int i = 0; i < question.options.length; i++) {
      optionButtons.add(FlatButton(
        onPressed: () {
          _manager.nextQuestionforSecondQuiz(_manager.getSecondPartQuestions().options[i].score);
          if(_manager.isFinished()) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ResultPage(
                  score: _manager.getSecondScore(),
                )));
          }
          setState(() {});
        },
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${_manager.getSecondPartQuestions().options[i].text}',
              style: TextStyle(
                fontSize: 20,
              ),
            )
        ),
      ));
    }
    return optionButtons;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Questions ${_manager.getSecondQuizId()}/3'),),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      '${_manager.getSecondPartQuestions().text}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                )
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: getOptions(_manager.getSecondPartQuestions()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
