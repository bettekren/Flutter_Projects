import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guess_game/ResultPage.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  var tfGuess = TextEditingController(); //TextField üzerinden verileri al.
  int randomNumber = 0;
  int remainderLive = 5;
  String guidance = "";
  //Tahmini arttır azalt şeklinde geri bildirimlerde bulun/yönlendirici

  @override
  void initState() {
    super.initState();
    randomNumber = Random().nextInt(101);//0-100 arasında random sayılar üretir.
    print("Random Number:$randomNumber");
  }
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenWidth = screenInfo.size.width;
    final double screenHeight = screenInfo.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Guess Screen"),
        backgroundColor: Color.fromARGB(255, 72, 181, 199),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Remaining lives:$remainderLive", style: TextStyle(color: Color.fromARGB(255, 72, 181, 199), fontSize: 30),),
            Text("Help:$guidance",style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold, fontSize: 15),),
            Text("Guessing Game", style: TextStyle(color: Colors.green, fontSize: 25),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: tfGuess,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                 labelText: "Your Guessing:",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide(color: Colors.blue), // Odaklandığında kenarlık rengi
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide(color: Colors.green), // Etkin olduğunda kenarlık rengi
                  ),
                ),



              ),
            ),
            SizedBox(
              width: screenWidth/2 ,
              height: screenHeight/15 ,
              child: ElevatedButton(
                child: Text("Guess it!",style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                      255, 59, 188, 210)),
                ),
                onPressed: (){
                setState(() {
                  //günceller ekrandaki bilgiyi
                  remainderLive = remainderLive - 1;
                });
                
                int guess = int.parse(tfGuess.text);
                if(guess == randomNumber){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(result: true,)));
                  return;
                }
                if(guess > randomNumber){
                  setState(() {
                    guidance = "Decrease your guess!";
                  });

                }

                if(guess < randomNumber){
                  setState(() {
                    guidance = "Increase your guess!";
                  });

                }
                if(remainderLive == 0){
                  //Sonuç ekranına verş transferi etmemiz gerek verileri güncellememiz gerek

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(result: false,) ));
                }
                tfGuess.text = "";
                






                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
