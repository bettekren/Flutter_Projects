import 'package:flutter/material.dart';
import 'package:guess_game/GuessPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GUESSING GAME'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenWidth = screenInfo.size.width;
    final double screenHeight = screenInfo.size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(
            255, 220, 79, 110),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            
            Text("Guessing Game", style: TextStyle(fontSize: 30),),
            Image.asset("images/dice.png"),

            SizedBox(
              width: screenWidth/2 ,
              height: screenHeight/15 ,
              child: ElevatedButton(
                child: Text("Start The Game",style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                      255, 220, 79, 110)),
                ),
                onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => GuessPage()));
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
