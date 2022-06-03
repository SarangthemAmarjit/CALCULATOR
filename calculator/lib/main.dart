import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_ringtone_player/android_sounds.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      title: 'CALCULATOR',
      home: CalcularApp(),
    );
  }
}

class CalcularApp extends StatefulWidget {
  const CalcularApp({Key? key}) : super(key: key);

  @override
  State<CalcularApp> createState() => _CalcularAppState();
}

class _CalcularAppState extends State<CalcularApp> {
  double firstnum2 = 0;
  double secondnum2 = 0;

  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String textToDisplay = '';
  String res = '';
  String operation = '';
  String display = '';

  void numberclicksound() {
    FlutterRingtonePlayer.play(fromAsset: 'assets/audio/number.mp3');
  }

  void operatorclicksound() {
    FlutterRingtonePlayer.play(fromAsset: 'assets/audio/operator.mp3');
  }

  void clearclicksound() {
    FlutterRingtonePlayer.play(fromAsset: 'assets/audio/clear.wav');
  }

  void btnOnClick(String btnVal) {
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-$textToDisplay';
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'X' ||
        btnVal == '÷') {
      firstNum = int.parse(textToDisplay);

      res = textToDisplay.toString() + btnVal.toString();

      operation = btnVal;
    } else if (btnVal == '=') {
      RegExp exp = new RegExp(r"\d+|\+|-|\*|/|=");

      Iterable<Match> matches = exp.allMatches(textToDisplay);
      var list = matches.map((m) => (m.group(0)));
      print(list);

      secondNum = int.parse(list.last!);
      if (operation == '+') {
        res = btnVal.toString() + (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = btnVal.toString() + (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        res = btnVal.toString() + (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '÷') {
        if (firstNum % secondNum == 0) {
          res = btnVal.toString() + (firstNum / secondNum).toString();
          history =
              firstNum.toString() + operation.toString() + secondNum.toString();
        } else {
          var dou1 = firstNum.toDouble();
          var dou2 = secondNum.toDouble();
          res = btnVal.toString() + (dou1 / dou2).toString();
          history = dou1.toString() + operation.toString() + dou2.toString();
        }
      }
    } else {
      res = textToDisplay + btnVal;
      print(res);
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Column(children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(history,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black45,
                      )),
                ),
              ),
              color: Color.fromARGB(255, 211, 247, 247)),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  color: Color.fromARGB(255, 211, 247, 247)),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    textToDisplay,
                    style: TextStyle(fontSize: 48, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 245, 230, 93),
                        Colors.white,
                        Color.fromARGB(255, 230, 143, 245)
                      ])),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 5, right: 5),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      children: [
                        CalculatorButton(
                          text: 'C',
                          fillcolor: Colors.red,
                          callback: btnOnClick,
                          tone: clearclicksound,
                        ),
                        CalculatorButton(
                          text: '<',
                          fillcolor: Colors.red,
                          callback: btnOnClick,
                          tone: clearclicksound,
                        ),
                        CalculatorButton(
                          text: 'AC',
                          fillcolor: Colors.red,
                          callback: btnOnClick,
                          tone: clearclicksound,
                        ),
                        CalculatorButton(
                          text: '÷',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                          tone: operatorclicksound,
                        ),
                        CalculatorButton(
                          text: '7',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: numberclicksound,
                        ),
                        CalculatorButton(
                          text: '8',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: numberclicksound,
                        ),
                        CalculatorButton(
                          text: '9',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: numberclicksound,
                        ),
                        CalculatorButton(
                          text: 'X',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                          tone: operatorclicksound,
                        ),
                        CalculatorButton(
                          text: '4',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: numberclicksound,
                        ),
                        CalculatorButton(
                          text: '5',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: numberclicksound,
                        ),
                        CalculatorButton(
                          text: '6',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: numberclicksound,
                        ),
                        CalculatorButton(
                          text: '-',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                          tone: operatorclicksound,
                        ),
                        CalculatorButton(
                          text: '1',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: numberclicksound,
                        ),
                        CalculatorButton(
                          text: '2',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: numberclicksound,
                        ),
                        CalculatorButton(
                          text: '3',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: numberclicksound,
                        ),
                        CalculatorButton(
                          text: '+',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                          tone: operatorclicksound,
                        ),
                        CalculatorButton(
                          text: '0',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: numberclicksound,
                        ),
                        CalculatorButton(
                          text: '+/-',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: operatorclicksound,
                        ),
                        CalculatorButton(
                          text: '00',
                          fillcolor: Colors.green,
                          callback: btnOnClick,
                          tone: numberclicksound,
                        ),
                        CalculatorButton(
                          text: '=',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                          tone: operatorclicksound,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
