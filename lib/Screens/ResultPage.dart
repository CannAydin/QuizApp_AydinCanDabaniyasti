import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  int score;
  ResultPage({Key key, this.score}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuç'),
      ),
      body: Container(
        color: widget.score >= 20 ? Colors.greenAccent : Colors.redAccent,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
              child: Text(
                widget.score >= 20 ? 'Tebrikler' : '',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Sınavı Bitirdiniz',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Puanınız: ${widget.score}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }
}
