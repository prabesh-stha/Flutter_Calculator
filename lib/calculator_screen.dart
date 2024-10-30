
import 'package:flutter/material.dart';
import 'package:flutter_calculator/button_screen.dart';



class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  //Input that we enter 
  String _input = "";
  //To store the operators
  String _operator = "";
  //To store the value after the pressing operator
  double? _firstOperand;
  //Output displayed in the display
  String _display = "0";

//Function to format the output according;
  String _formatResult(double result) {

    //if it is the whole number then displays the integer
  if (result == result.toInt()) {
    return result.toInt().toString();
  } else {
    return result.toStringAsFixed(2); // else display the ouput in decimal upto 2 after dot
  }
}

//function that handle what should happen after pressing the buttons
void _buttonPressed(String button){
  if(button == "C"){
    _clear();
  }
  else if(button == "%"){
    percentile();
  }
  else if(button == "/" || button == "X" || button == "-" || button == "+"){
    setOperator(button);
  }else if(button == "="){
    calculate();
  }else{
    setInput(button);
  }

}

//Function to calculate the output
void calculate(){
  if(_firstOperand != null && _operator.isNotEmpty && _input.isNotEmpty){
    double? secondOperand = double.tryParse(_input);
    if(secondOperand == null) return;
  double result;
  switch(_operator){
    case "+":
      result = _firstOperand! + secondOperand;
      break;
    case "-":
      result = _firstOperand! - secondOperand;
      break;
    case "X":
      result = _firstOperand! * secondOperand;
      break;
    case "/":
      result = _firstOperand! / secondOperand;
      break;
    default:
      result = 0;
  }

  setState(() {
    _display = _formatResult(result);
    _input = _display;
    _firstOperand = null;
    _operator = "";
  });
  }
}

//Function to store the value we pressed and display to the screen
void setInput(String value){
  if(_input == "0" && value == "0") return;
  _input += value;
  setState(() {
    _display = _input;
  });
}

//Function to store the operator after pressing the operator button
void setOperator(String button){
  if(_input.isNotEmpty){
    setState(() {
    _firstOperand = double.tryParse(_input);
    _input = "";
    _operator = button;
    });
  }
  
}

//Function to calculate percentage;
void percentile(){
  _firstOperand = double.tryParse(_input);
  if(_firstOperand != null){
    double result = _firstOperand! / 100;
    setState(() {
      _display = _formatResult(result);
      _input = _display;
      _firstOperand = null;
    });
  }
}

//Function to clear the display 
  void _clear(){
    setState(() {
      _input = "";
      _operator = "";
      _firstOperand = null;
      _display = "0";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
      children: [
          const Spacer(),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              _display,
              style: const TextStyle(fontSize: 48),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: _calculatorButton(),
            ),
          ),
        ],
      )
    );
  }
  
List<Widget> _calculatorButton() {
  final buttonLayout = [
    ["C","%","/"],
    ["7","8","9","X"],
    ["4","5","6","-"],
    ["1","2","3","+"],
    ["0",".","="]
  ];

 return buttonLayout.map((row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: row.map((button) {
        final buttonColor = _getButtonColor(button);

        final span = button == "0" || button == "C" ? 2 : 1;
        return ButtonScreen(
          button: button,
          buttonColor: buttonColor,
          span: span,
          onPressed: () => _buttonPressed(button),
        );
      }).toList(),
    );
  }).toList();
}
ButtonColor _getButtonColor(String button) {
  if (button == "C" || button == "=" || button == "%" || button == "/" || button == "X" || button == "-" || button == "+") {
    return ButtonColor.yellow;
  } else {
    return ButtonColor.black;
  }
}
}