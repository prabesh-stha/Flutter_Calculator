import 'package:flutter/material.dart';
import 'package:flutter_calculator/button_screen.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
         Expanded(child:  Container(),),
          const SizedBox(height: 20,),
          Expanded(child: Column(children: _calculatorButton(),))

        ],
      )
    );
  }
}


List<Widget> _calculatorButton() {
  final buttonLayout = [
    ["C","%","/"],
    ["7","8","9","X"],
    ["4","5","6","-"],
    ["1","2","3","+"],
    ["0",".","="]
  ];

  List<Widget> row = [];

  for(int i=0;i<buttonLayout.length;i++){
    if(i==0){
      row.add(Row(
        children: [
          ButtonScreen(button: "C", buttonColor: ButtonColor.yellow, span: 2, onPressed: (){}),
          ButtonScreen(button: "%", buttonColor: ButtonColor.yellow, onPressed: (){}),
          ButtonScreen(button: "/", buttonColor: ButtonColor.yellow, onPressed: (){})
        ],
      ));
    }else if(i == buttonLayout.length -1){
      row.add(Row(
        children: [
          ButtonScreen(button: "0", buttonColor: ButtonColor.gray, span: 2, onPressed: (){}),
          ButtonScreen(button: ".", buttonColor: ButtonColor.gray, onPressed: (){}),
          ButtonScreen(button: "=", buttonColor: ButtonColor.yellow, onPressed: (){})
        ],
      ));
    }else{
      row.add(Row(
        children: buttonLayout[i].map((button){
            return ButtonScreen(button: button, buttonColor: ButtonColor.gray, onPressed: (){});
          }).toList()
      ));
    }
  }

  return row;
}