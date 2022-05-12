import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: const DicePage(),
      ),
    );
  }
}


class DicePage extends StatefulWidget {
  const DicePage({ Key? key }) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;


  void changeDiceNumber(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
}

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       Expanded(child: Padding(
         padding: const EdgeInsets.all(16.0),
         child: TextButton(child: Image.asset('images/dice$leftDiceNumber.png'), onPressed: (){
             changeDiceNumber();
         },),
       ),),
       //const SizedBox(width: 16,),
       Expanded(child: Padding(
         padding: const EdgeInsets.all(16.0),
         child: TextButton(child: Image.asset('images/dice$rightDiceNumber.png'), onPressed: (){
            changeDiceNumber();
         },),
       ),),
      ],
    );
  }
}