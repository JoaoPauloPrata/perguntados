import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perguntados/pages/pages.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 233, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: defaultColor,
        title: Text('Perguntas e respostas'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              height: 250,
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        'Perguntas e repostas',
                        style: TextStyle(
                          color: defaultColor,
                          fontSize: 24,
                        ),
                      )),
                      SizedBox(height: 30),
                      Center(
                          child: Text(
                              'Responda 10 perguntas e veja sua pontuação no fim!',
                              style: TextStyle(fontSize: 12))),
                      SizedBox(height: 30),
                      startButton()
                    ],
                  ))),
        ))
      ]),
    );
  }

  Container startButton() {
    return Container(
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: defaultColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              textStyle: TextStyle(fontSize: 20)),
          onPressed: () {},
          child: Text('Start!'),
        ));
  }
}
