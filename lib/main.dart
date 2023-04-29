import 'package:flutter/material.dart';
import 'package:kalkulator_ohio/calcubuttons.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Kulbet',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String screenText = '';
  String tempText = '';
  String operator = '';
  String msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  screenText,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: <Widget>[
              CalculatorButton(
                bgColor: Theme.of(context).primaryColorLight,
                fgColor: Theme.of(context).primaryColorDark,
                text: 'C',
                onTap: () {
                  clearScreen();
                },
              ),
              CalculatorButton(
                bgColor: Theme.of(context).primaryColorLight,
                fgColor: Theme.of(context).primaryColorDark,
                text: '+/-',
                onTap: () {
                  setState(() {
                    if (screenText[0] == '-') {
                      screenText = screenText.replaceAll('-', '');
                    } else {
                      screenText = "-$screenText";
                    }
                  });
                },
              ),
              CalculatorButton(
                bgColor: Theme.of(context).primaryColorLight,
                fgColor: Theme.of(context).primaryColorDark,
                text: '%',
                onTap: () {
                  setState(() {
                    tempText = screenText;
                    operator = '%';
                  });

                  emptyScreen();
                },
              ),
              CalculatorButton.icon(
                bgColor: Theme.of(context).primaryColorDark,
                fgColor: Theme.of(context).primaryColorLight,
                text: 'Backspace',
                icon: Icons.backspace,
                onTap: () {
                  backSpace();
                },
              ),
              CalculatorButton(
                bgColor: Colors.white,
                fgColor: Theme.of(context).primaryColorDark,
                text: '7',
                onTap: () {
                  pressNumber(7);
                },
              ),
              CalculatorButton(
                bgColor: Colors.white,
                fgColor: Theme.of(context).primaryColorDark,
                text: '8',
                onTap: () {
                  pressNumber(8);
                },
              ),
              CalculatorButton(
                bgColor: Colors.white,
                fgColor: Theme.of(context).primaryColorDark,
                text: '9',
                onTap: () {
                  pressNumber(9);
                },
              ),
              CalculatorButton(
                bgColor: Theme.of(context).primaryColorDark,
                fgColor: Theme.of(context).primaryColorLight,
                text: '/',
                onTap: () {
                  setState(() {
                    tempText = screenText;
                    operator = '/';
                  });

                  emptyScreen();
                },
              ),
              CalculatorButton(
                bgColor: Colors.white,
                fgColor: Theme.of(context).primaryColorDark,
                text: '4',
                onTap: () {
                  pressNumber(4);
                },
              ),
              CalculatorButton(
                bgColor: Colors.white,
                fgColor: Theme.of(context).primaryColorDark,
                text: '5',
                onTap: () {
                  pressNumber(5);
                },
              ),
              CalculatorButton(
                bgColor: Colors.white,
                fgColor: Theme.of(context).primaryColorDark,
                text: '6',
                onTap: () {
                  pressNumber(6);
                },
              ),
              CalculatorButton(
                bgColor: Theme.of(context).primaryColorDark,
                fgColor: Theme.of(context).primaryColorLight,
                text: 'x',
                onTap: () {
                  setState(() {
                    tempText = screenText;
                    operator = 'x';
                  });

                  emptyScreen();
                },
              ),
              CalculatorButton(
                bgColor: Colors.white,
                fgColor: Theme.of(context).primaryColorDark,
                text: '1',
                onTap: () {
                  pressNumber(1);
                },
              ),
              CalculatorButton(
                bgColor: Colors.white,
                fgColor: Theme.of(context).primaryColorDark,
                text: '2',
                onTap: () {
                  pressNumber(2);
                },
              ),
              CalculatorButton(
                bgColor: Colors.white,
                fgColor: Theme.of(context).primaryColorDark,
                text: '3',
                onTap: () {
                  pressNumber(3);
                },
              ),
              CalculatorButton(
                bgColor: Theme.of(context).primaryColorDark,
                fgColor: Theme.of(context).primaryColorLight,
                text: '-',
                onTap: () {
                  setState(() {
                    tempText = screenText;
                    operator = '-';
                  });

                  emptyScreen();
                },
              ),
              CalculatorButton(
                bgColor: Colors.white,
                fgColor: Theme.of(context).primaryColorDark,
                text: '0',
                onTap: () {
                  pressNumber(0);
                },
              ),
              CalculatorButton(
                bgColor: Colors.white,
                fgColor: Theme.of(context).primaryColorDark,
                text: '.',
                onTap: () {
                  setState(() {
                    if (!screenText.contains('.')) {
                      screenText = '$screenText.';
                    }
                  });
                },
              ),
              CalculatorButton(
                bgColor: Theme.of(context).primaryColorLight,
                fgColor: Theme.of(context).primaryColorDark,
                text: '=',
                onTap: () {
                  setState(() {
                    switch (operator) {
                      case '%':
                        {
                          screenText = (double.parse(tempText) %
                                  double.parse(screenText))
                              .toString();
                        }
                        break;
                      case 'x':
                        {
                          screenText = (double.parse(tempText) *
                                  double.parse(screenText))
                              .toString();
                        }
                        break;
                      case '/':
                        {
                          screenText = (double.parse(tempText) /
                                  double.parse(screenText))
                              .toString();
                        }
                        break;
                      case '+':
                        {
                          screenText = (double.parse(tempText) +
                                  double.parse(screenText))
                              .toString();
                        }
                        break;
                      case '-':
                        {
                          screenText = (double.parse(tempText) -
                                  double.parse(screenText))
                              .toString();
                        }
                        break;
                    }
                  });
                },
              ),
              CalculatorButton(
                bgColor: Theme.of(context).primaryColorDark,
                fgColor: Theme.of(context).primaryColorLight,
                text: '+',
                onTap: () {
                  setState(() {
                    tempText = screenText;
                    operator = '+';
                  });

                  emptyScreen();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void pressNumber(int number) {
    setState(() {
      if (screenText == '0') {
        screenText = '$number';
      } else {
        screenText = '$screenText$number';
      }
    });
  }

  void backSpace() {
    setState(() {
      if (screenText == '0' || screenText == '' || screenText.length == 1) {
        screenText = '0';
      } else {
        screenText = screenText.substring(0, screenText.length - 1);
      }
    });
  }

  void clearScreen() {
    setState(() {
      screenText = '0';
    });
  }

  void emptyScreen() {
    setState(() {
      screenText = '';
    });
  }
}
