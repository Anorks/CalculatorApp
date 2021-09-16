import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SimpleCalculator(),
  ));
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  get style => null;
  get padding => null;

  String question = "34";
  String answer = "14";

  @override
  Widget build(BuildContext context) {
    TextStyle questionAnswerStlye = TextStyle(
      color: Color(0xffffffff),
      fontSize: 40,
    );
    TextStyle answerQuestionStlye =
        TextStyle(color: Color(0xff526f9f), fontSize: 20);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(top: 100,bottom: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    answer,
                    style: questionAnswerStlye.copyWith(
                        fontSize: 40, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    question,
                    style: answerQuestionStlye.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                calculatorKeys(
                    keyNumber: "CLR",
                    onPress: () {
                      setState(() {
                        answer = "";
                        question = "";
                      });
                    })
              ],
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calculatorKeys(
                            keyNumber: "7",
                            onPress: () {
                              setState(() {
                                question += "7";
                              });
                            }),
                        calculatorKeys(
                            keyNumber: "8",
                            onPress: () {
                              setState(() {
                                question += "8";
                              });
                            }),
                        calculatorKeys(
                            keyNumber: "9",
                            onPress: () {
                              setState(() {
                                question += "9";
                              });
                            }),
                        calculatorSignskeys(
                            sign: "+",
                            onPress: () {
                              setState(() {
                                question += "+";
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calculatorKeys(
                            keyNumber: "4",
                            onPress: () {
                              setState(() {
                                question += "4";
                              });
                            }),
                        calculatorKeys(
                            keyNumber: "5",
                            onPress: () {
                              setState(() {
                                question += "5";
                              });
                            }),
                        calculatorKeys(
                            keyNumber: "6",
                            onPress: () {
                              setState(() {
                                question += "6";
                              });
                            }),
                        calculatorSignskeys(
                            sign: "-",
                            onPress: () {
                              setState(() {
                                question += "-";
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calculatorKeys(
                            keyNumber: "1",
                            onPress: () {
                              setState(() {
                                question += "1";
                              });
                            }),
                        calculatorKeys(
                            keyNumber: "2",
                            onPress: () {
                              setState(() {
                                question += "2";
                              });
                            }),
                        calculatorKeys(
                            keyNumber: "3",
                            onPress: () {
                              setState(() {
                                question += "3";
                              });
                            }),
                        calculatorSignskeys(
                            sign: "x",
                            onPress: () {
                              setState(() {
                                question += "x";
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calculatorKeys(
                            keyNumber: "0",
                            onPress: () {
                              setState(() {
                                question += "0";
                              });
                            }),
                        calculatorKeys(
                            keyNumber: ".",
                            onPress: () {
                              setState(() {
                                question += ".";
                              });
                            }),
                        calculatorKeys(
                            keyNumber: "=",
                            onPress: () {
                              setState(() {
                                calculatorResult();
                              });
                            }),
                        calculatorSignskeys(
                            sign: "/",
                            onPress: () {
                              setState(() {
                                question += "/";
                              });
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1A2640),
            Color(0xff0D1625),
          ],
        )),
      ),
    );
  }

  calculatorKeys({keyNumber, onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 75, width: 75,
        child: Center(
          child: Text(
            keyNumber,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),

        decoration: BoxDecoration(
            color: Color(0xff1d2e48), borderRadius: BorderRadius.circular(20)),
        //margin: EdgeInsets.all(30),
      ),
    );
  }

  calculatorSignskeys({sign, onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 75,
        width: 75,
        child: Center(
          child: Text(
            sign,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xff2966c7), borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  void calculatorResult() {
    String finalUserInput = question;
    finalUserInput = question.replaceAll("x", "*");

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();

    double result = exp.evaluate(EvaluationType.REAL, cm);
    answer = result.toString();
  }
}
