import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perguntados/pages/pages.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: defaultColor,
        title: Text('Perguntas e respostas'),
      ),
      body: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 50,
                child: Text(
                  'Qual o nome do professor de flutter?',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Repostas',
                style: TextStyle(fontSize: 16, color: defaultColor),
              ),
              SizedBox(height: 20),
              responseBox(),
              SizedBox(height: 20),
              responseBox(),
              SizedBox(height: 20),
              responseBox(),
              SizedBox(height: 20),
              responseBox(),
              SizedBox(height: 20),
              responseButton()
            ],
          )),
    );
  }

  Container responseButton() {
    return Container(
        height: 64,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: defaultColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              textStyle: TextStyle(fontSize: 20)),
          onPressed: () {},
          child: const Text('Responder'),
        ));
  }

  Container responseBox() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(24)),
      height: 110,
      child: Column(
        children: [
          Row(children: [
            Checkbox(
              value: true,
              onChanged: null,
            ),
            Text('Pablo Escobar')
          ])
        ],
      ),
    );
  }
}
