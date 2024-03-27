import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guess_game/main.dart';

class ResultPage extends StatefulWidget {
  bool result;
  ResultPage({required this.result});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String isWon = "";
  var randomNum = Random();
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenWidth = screenInfo.size.width;
    final double screenHeight = screenInfo.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Aşağıda widgetlar ile dinamik bir ekran oldu.
            widget.result ? Text("You Won!!!", style: TextStyle(fontSize: 30),) : Text("You Failed!!!", style: TextStyle(fontSize: 30),),
            widget.result ? Image.asset("images/happy_image.png", color: Colors.pinkAccent,) : Image.asset("images/sad_image.png", color: Colors.pinkAccent,),


            SizedBox(
              width: screenWidth/2 ,
              height: screenHeight/15 ,
              child: ElevatedButton(
                child: Text("Try Again",style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                      255, 220, 79, 110)),
                ),
                onPressed: (){
                  Navigator.pop(context);
                  setState(() {



                  });
                },
              ),
            ),
          ],

        ),
      ),

    );
  }
}
