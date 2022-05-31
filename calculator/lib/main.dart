import 'package:calculator/button.dart';
import 'package:flutter/material.dart';

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
  double firstNum = 0;
  double secondNum = 0;
  String history = '';
  String textToDisplay = '';
  String res = '';
  String operation = '';
  String display = '';

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
      firstNum = double.parse(textToDisplay);
      res = textToDisplay + btnVal;
      operation = btnVal;
      res = '';
    } else if (btnVal == '=') {
      secondNum = double.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '÷') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
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
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(history,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black45,
                      )),
                ),
              ),
              color: Colors.white),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  textToDisplay,
                  style: TextStyle(fontSize: 48, color: Colors.black),
                ),
              ),
            ),
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.blueGrey[200],
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
                            callback: btnOnClick),
                        CalculatorButton(
                          text: '<',
                          fillcolor: Colors.red,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: 'AC',
                          fillcolor: Colors.red,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '÷',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '7',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '8',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '9',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: 'X',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '4',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '5',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '6',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '-',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '1',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '2',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '3',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '+',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '0',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '+/-',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '00',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '=',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
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
