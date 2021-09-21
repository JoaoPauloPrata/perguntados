import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perguntados/pages/pages.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
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
                          child: Text('Sua pontuação foi de:',
                              style: TextStyle(fontSize: 12))),
                      SizedBox(height: 30),
                      Center(
                          child: Text(
                        arguments.toString(),
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      )),
                      SizedBox(height: 20),
                      Center(
                          child: GestureDetector(
                        child: Text(
                          'Tentar novamente',
                          style: TextStyle(
                              color: defaultColor,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () {
                          debugPrint('Click');
                        },
                      ))
                    ],
                  ))),
        ))
      ]),
    );
  }
}
