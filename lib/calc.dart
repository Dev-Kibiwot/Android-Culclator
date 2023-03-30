import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:math_expressions/math_expressions.dart';

class Calc_UI extends StatefulWidget {
  const Calc_UI({super.key});

  @override
  State<Calc_UI> createState() => _Calc_UIState();
}

class _Calc_UIState extends State<Calc_UI> {
  String UserInput = "";
  String Result = "0";

  List<String> buttonList = [
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height/3,
            child:Column(
              children:[
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              child: Text(
                UserInput,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white
              ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              child: Text(
                Result,
              style: const TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
              ]
            )
            ),
            const Divider(
              color: Colors.white,),
              Expanded(
                child: Container(
                 padding: const EdgeInsets.all(20),
                 child: GridView.builder(
                  itemCount: buttonList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: 4,
                    
                    ),
                  itemBuilder: (context, index){
                    return CustomButton(buttonList[index]);
                  }
                  ),
                 )
                )
              ],
              ),
      )
          );
   
  }
  Widget CustomButton(String text){
    return InkWell(
      splashColor: Colors.black54,
      onTap: (){
        setState(() {
          handleButtons(text);
        });
      },
      child: Ink(
       decoration: BoxDecoration(
        color: getBgColors(text),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 0.5,
            offset: const Offset(-3, -3)
          )
        ]
       ),
       child: Center(
        child: Text(text,
        style: TextStyle(
        color: getBgColor(text),
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        ),
       ),
      ),
    );
  }
  getBgColors(String text){
    if(
      text == "/" || 
      text == "*" || 
      text == "+" || 
      text == "-" || 
      text == "C" || 
      text == "(" || 
      text == ")" ){
      return const Color.fromARGB(225, 252, 100, 100);
    }
    return Colors.white;
  }
  getBgColor(String text){
    if(
      text == "AC" ){
      return const Color.fromARGB(225, 252, 100, 100);
    }
    if(
      text == "=" ){
      return const Color.fromARGB(225, 104, 204, 159);
    }
    return Colors.black54;
  }
  handleButtons(String text){
    if(text == "AC"){
      UserInput = "";
      Result = "0";
      return;
    }
    if(text == "C"){
      if(UserInput.isNotEmpty){
        UserInput = UserInput.substring(0, UserInput.length -1);
        return;
      }
      else {
        return  null;
      }
    }

    if(text == "="){
      Result = calculate();
      UserInput = Result;
      if(UserInput.endsWith(".0")){
        UserInput = Result.replaceAll(".0", "");
      }
      if(Result.endsWith(".0")){
        Result = Result.replaceAll(".0", "");
        return;
      }
    }
    UserInput = UserInput + text;
  }

  String calculate(){
    try {
      var exp = Parser().parse(UserInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }
}