import 'package:final_color_guess/randomrgb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'coloroptions.dart';

Color backgroundcolor = Colors.white;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color Guessing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Color Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();

  int randomR;
  int randomG;
  int randomB;

  int totalScore = 0;
  int questionCount = 0;

  void newGame() {
    setState(() {
      randomR = random.nextInt(256);
      randomG = random.nextInt(256);
      randomB = random.nextInt(256);
    });
  }

  void theme(){
    setState(() {
      if(backgroundcolor==Colors.white && rgbtext==Colors.black){
        backgroundcolor = Colors.black;
        rgbtext = Colors.white;
      }else if(backgroundcolor == Colors.black && rgbtext==Colors.white){
        backgroundcolor = Colors.white;
        rgbtext = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    randomR = random.nextInt(256);
    randomG = random.nextInt(256);
    randomB = random.nextInt(256);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        child: Icon(Icons.invert_colors),
        onPressed: (){
          theme();
        },
      ),
      backgroundColor: backgroundcolor,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            RGB(randomR, randomG, randomB),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: FlatButton(
                onPressed: () {
                  newGame();
                },
                child: Text(
                  'New Game',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            ColorOptions(randomR, randomG, randomB),
          ],
        ));
  }
}
