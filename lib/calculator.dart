import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";
  var print = "";

  Widget btn(var textt) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        color: Color(0xff006c75),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
          onPressed: () {
            setState(() {
              result = result + textt;
              print = print + textt;
            });
          },
          child: Text(textt,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    );
  }

  Widget sym(var textt) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        color: Color(0xff4d1a7f),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
          onPressed: () {
            setState(() {
              result = result + textt;
              print = print + textt;
            });
          },
          child: Text(textt,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    );
  }

  clear() {
    setState(() {
      result = "";
      print = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff8C8C8C),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Calculator",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                height: 180,
                width: 359,
                // padding: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Color(0xffBFBFBF),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      print,
                      style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                height: 60,
                width: 350,
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Color(0xffBFBFBF),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      btn("1"),
                      SizedBox(width: 10),
                      btn("2"),
                      SizedBox(width: 10),
                      btn("3"),
                      SizedBox(width: 40),
                      sym("+"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      btn("4"),
                      SizedBox(width: 10),
                      btn("5"),
                      SizedBox(width: 10),
                      btn("6"),
                      SizedBox(width: 40),
                      sym("-"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      btn("7"),
                      SizedBox(width: 10),
                      btn("8"),
                      SizedBox(width: 10),
                      btn("9"),
                      SizedBox(width: 40),
                      sym("*"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      btn("0"),
                      SizedBox(width: 10),
                      btn("00"),
                      SizedBox(width: 10),
                      btn("."),
                      SizedBox(width: 40),
                      sym("/"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color(0xff800b0b),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextButton(
                                onPressed: clear,
                                child: Text("Clear",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                        Container(
                          width: 70,
                          decoration: BoxDecoration(
                            color: Color(0xff047e25),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextButton(
                              onPressed: output,
                              child: Text(
                                "=",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        ),
                        SizedBox(width: 40),
                        sym("%"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
