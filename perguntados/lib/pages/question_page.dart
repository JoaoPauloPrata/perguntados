import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perguntados/pages/pages.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  ResponseBox option_1 = new ResponseBox('');
  ResponseBox option_2 = new ResponseBox('');
  ResponseBox option_3 = new ResponseBox('');
  ResponseBox option_4 = new ResponseBox('');
  String teste = '';
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
              option_1,
              SizedBox(height: 20),
              option_2,
              SizedBox(height: 20),
              option_3,
              SizedBox(height: 20),
              option_4,
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
}

BoxDecoration getContainerDecoration(isChecked) {
  if (isChecked) {
    return BoxDecoration(
        border: Border.all(color: defaultColor),
        color: Color.fromRGBO(117, 140, 255, 0.3),
        borderRadius: BorderRadius.circular(24));
  }
  return BoxDecoration(
      border: Border.all(color: Colors.grey),
      color: Colors.white,
      borderRadius: BorderRadius.circular(24));
}

class ResponseBox extends StatefulWidget {
  String _response = '';
  ResponseBox(value) {
    this._response = value;
  }
  @override
  _ResponseBoxState createState() => _ResponseBoxState();
}

class _ResponseBoxState extends State<ResponseBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            widget._response = 'ARROZ';
          });
        },
        child: Container(
          decoration: getContainerDecoration(_isChecked),
          height: 110,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(children: [
                    Container(
                      height: 25,
                      width: 25,
                      child: Icon(
                        Icons.check,
                        color: defaultColor,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: defaultColor),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(width: 3),
                    Text(widget._response)
                  ])
                ],
              )),
        ));
  }
}
