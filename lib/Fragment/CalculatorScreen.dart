import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _output = '';
  List<String> _history = [];

  void _handleButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        _output = _calculateResult();
        _history.add('$_input = $_output');
      } else if (buttonText == 'AC') {
        _input = '';
        _output = '';
      } else if (buttonText == '√') {
        _input = _calculateSquareRoot();
      } else if (buttonText == 'sin') {
        _input = 'sin($_input)';
      } else if (buttonText == 'cos') {
        _input = 'cos($_input)';
      } else if (buttonText == 'tan') {
        _input = 'tan($_input)';
      } else if (buttonText == '*') {
        _input += '*';
      } else if (buttonText == '/') {
        _input += '/';
      } else if (buttonText == 'C-F') {
        _input = _convertTemperature(_input, true);
      } else if (buttonText == 'F-C') {
        _input = _convertTemperature(_input, false);
      } else if (buttonText == 'Kg-lb') {
        _input = _convertWeight(_input, true);
      } else if (buttonText == 'lb-Kg') {
        _input = _convertWeight(_input, false);
      } else {
        _input += buttonText;
      }
    });
  }

  String _calculateResult() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_input);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      if (result.isNaN) {
        return 'Error';
      }
      return result.toStringAsFixed(2);
    } catch (e) {
      return 'Error';
    }
  }

  String _calculateSquareRoot() {
    try {
      Parser p = Parser();
      Expression exp = p.parse('sqrt($_input)');
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      if (result.isNaN) {
        return 'Error';
      }
      return result.toStringAsFixed(2);
    } catch (e) {
      return 'Error';
    }
  }

  String _convertTemperature(String value, bool toFahrenheit) {
    try {
      double inputValue = double.parse(value);
      if (toFahrenheit) {
        double fahrenheitValue = (inputValue * 9 / 5) + 32;
        return fahrenheitValue.toStringAsFixed(2);
      } else {
        double celsiusValue = (inputValue - 32) * 5 / 9;
        return celsiusValue.toStringAsFixed(2);
      }
    } catch (e) {
      return 'Error';
    }
  }

  String _convertWeight(String value, bool toPounds) {
    try {
      double inputValue = double.parse(value);
      if (toPounds) {
        double poundsValue = inputValue * 2.20462;
        return poundsValue.toStringAsFixed(2);
      } else {
        double kilogramsValue = inputValue / 2.20462;
        return kilogramsValue.toStringAsFixed(2);
      }
    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.bottomRight,
              child: Text(
                _input,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  _buildButtonRow(['AC', 'sin', 'cos']),
                  _buildButtonRow(['√', 'tan', '/']),
                  _buildButtonRow(['7', '8', '9', '*']),
                  _buildButtonRow(['4', '5', '6', '-']),
                  _buildButtonRow(['1', '2', '3', '+']),
                  _buildButtonRow(['0', '.', '=', 'C-F']), // Corrected labels
                  _buildButtonRow(['F-C', 'Kg-lb', 'lb-Kg']), // Corrected labels
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'History',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _history.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            _history[index],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttonLabels) {
    return Expanded(
      child: Row(
        children: buttonLabels
            .map((label) => Expanded(child: _buildButton(label)))
            .toList(),
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () => _handleButtonPressed(buttonText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white54),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    ),
  );
}
