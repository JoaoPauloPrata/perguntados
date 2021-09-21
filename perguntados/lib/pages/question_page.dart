import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perguntados/pages/pages.dart';

import '../data/questions.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: defaultColor,
        title: Text('Perguntas e respostas'),
      ),
      body: Padding(padding: EdgeInsets.all(32), child: WidgetsLists()),
    );
  }
}

ButtonStyle getButtonStyle(isSelected) {
  if (isSelected) {
    return ElevatedButton.styleFrom(
        primary: defaultColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        textStyle: TextStyle(fontSize: 20));
  } else {
    return ElevatedButton.styleFrom(
        primary: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        textStyle: TextStyle(fontSize: 20));
  }
}

class ResponseButton extends StatelessWidget {
  late bool isSelected;
  late Function responseAction;

  ResponseButton(newIsSelectedValue, nextQuestion, responseAction) {
    this.isSelected = newIsSelectedValue;
    this.responseAction = responseAction;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        child: ElevatedButton(
          style: getButtonStyle(isSelected),
          onPressed: () {
            if (isSelected) {
              responseAction();
            }
          },
          child: const Text('Responder'),
        ));
  }
}

class NextQuestionButton extends StatelessWidget {
  late Function nextQuestion;
  NextQuestionButton(function) {
    this.nextQuestion = function;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: defaultColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              textStyle: TextStyle(fontSize: 20)),
          onPressed: () {
            nextQuestion();
          },
          child: const Text('Próxima Pergunta'),
        ));
  }
}

class WidgetsLists extends StatefulWidget {
  const WidgetsLists({Key? key}) : super(key: key);

  @override
  WidgetsListsState createState() => WidgetsListsState();
}

class WidgetsListsState extends State<WidgetsLists> {
  late int atualIndex = 0;
  late bool isSelected = false;
  late int selectedOption = 12;
  late int correctCount = 0;
  bool answered = false;
  List<int> responseBoxSates = [4, 4, 4, 4];
  Widget returnButton(answered) {
    if (answered) {
      return NextQuestionButton(nextQuestion);
    } else {
      return ResponseButton(isSelected, nextQuestion, responseAction);
    }
  }

  void markSelection(index) {
    setState(() {
      if (responseBoxSates[index] == 1) {
        responseBoxSates[index] = 4;
        isSelected = false;
      } else {
        responseBoxSates[index] = 1;
        for (int i = 0; i < 4; i++) {
          if (i != index) {
            responseBoxSates[i] = 4;
          }
        }
        isSelected = true;
      }
      debugPrint(index.toString());
    });
    selectedOption = index;
  }

  void responseAction() {
    setState(() {
      if (selectedOption == allQuestions[atualIndex].correctResponse) {
        correctCount++;
        responseBoxSates[selectedOption] = 3;
      } else {
        responseBoxSates[selectedOption] = 2;
        responseBoxSates[allQuestions[atualIndex].correctResponse] = 3;
      }
      answered = true;
      isSelected = !isSelected;
    });
  }

  void nextQuestion() {
    setState(() {
      for (int i = 0; i < 4; i++) {
        responseBoxSates[i] = 4;
      }
      answered = false;
      atualIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 50,
          child: Text(
            allQuestions[atualIndex].question,
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Repostas',
          style: TextStyle(fontSize: 16, color: defaultColor),
        ),
        SizedBox(
          height: 10,
        ),
        ResponseBox(atualIndex, 0, markSelection, responseBoxSates[0]),
        SizedBox(
          height: 10,
        ),
        ResponseBox(atualIndex, 1, markSelection, responseBoxSates[1]),
        SizedBox(
          height: 10,
        ),
        ResponseBox(atualIndex, 2, markSelection, responseBoxSates[2]),
        SizedBox(
          height: 10,
        ),
        ResponseBox(atualIndex, 3, markSelection, responseBoxSates[3]),
        SizedBox(
          height: 10,
        ),
        returnButton(answered)
      ],
    );
  }
}

class ResponseBox extends StatefulWidget {
  late int widgetIndex;
  int atualIndex = 0;
  late int atualState;
  late Function callBackFunction;
  // late BoxDecoration atualDecoration;
  void setSelfState(newState) {
    this.atualState = newState;
  }

  ResponseBox(atualIndex, widgetIndex, callBackFunction, atualState) {
    this.widgetIndex = widgetIndex;
    this.atualIndex = atualIndex;
    this.callBackFunction = callBackFunction;
    this.atualState = atualState;
    // this.atualDecoration = style;
  }
  @override
  _ResponseBoxState createState() => _ResponseBoxState();
}

class _ResponseBoxState extends State<ResponseBox> {
  BoxDecoration getContainerDecoration(isChecked) {
    if (widget.atualState == 1) {
      return BoxDecoration(
          border: Border.all(color: defaultColor),
          color: Color.fromRGBO(117, 140, 255, 0.3),
          borderRadius: BorderRadius.circular(24));
    } else if (widget.atualState == 2) {
      return BoxDecoration(
          border: Border.all(color: Colors.red),
          color: Color.fromRGBO(255, 214, 214, 0.3),
          borderRadius: BorderRadius.circular(24));
    } else if (widget.atualState == 3) {
      return BoxDecoration(
          border: Border.all(color: Colors.green),
          color: Color.fromRGBO(229, 255, 230, 0.3),
          borderRadius: BorderRadius.circular(24));
    }
    return BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(24));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            widget.callBackFunction(widget.widgetIndex);
          });
        },
        child: Container(
          decoration: getContainerDecoration(widget.atualState),
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
                    SizedBox(width: 4),
                    Text(allQuestions[widget.atualIndex]
                        .responses[widget.widgetIndex])
                  ])
                ],
              )),
        ));
  }
}
