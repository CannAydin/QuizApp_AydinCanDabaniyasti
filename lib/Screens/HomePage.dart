
import 'package:flutter_app/Screens/QuizPage.dart';
import 'package:flutter_app/Screens/FlutterQuiz.dart';

import 'package:flutter/material.dart';

void gotoQuizPage(BuildContext context, name) {
  if(name== 'Genel'){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => QuizPage()),
    );
  }
  else{
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => FlutterQuiz()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellowAccent,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                'Merhaba Sınava Hoşgeldiniz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Genel Kültür Testi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                gotoQuizPage(context, 'Genel');
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Text('Başla', style: TextStyle(fontSize: 20)),
              color: Colors.greenAccent,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Flutter Testi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                gotoQuizPage(context, 'asd');
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: const Text('Başla', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
