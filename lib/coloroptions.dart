import 'dart:math';
import 'package:flutter/material.dart';
import 'coloroption.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ColorOptions extends StatelessWidget {
  final int randomR;
  final int randomG;
  final int randomB;
  bool checkbox=false;

  ColorOptions(this.randomR, this.randomG, this.randomB);

  void answerChooseHandler(int r, int g, int b) {
    if (r == randomR && g == randomG && b == randomB) {
      Fluttertoast.showToast(
          msg: "Yeah, You got it!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 30.0
      );
      print('right');
    } else {
      checkbox = true;
        Fluttertoast.showToast(
            msg: "Wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 20.0
        );

      print('wrong');
    }
  }

  @override
  Widget build(BuildContext context) {

    List<int> optionList = [0, 1, 2, 3, 4,5];

    Random random = Random();

    int answer = random.nextInt(6);

    optionList.remove(answer);

    // optionList = [0, 1, 3]

    var randomOptions = {
      answer: {'r': randomR, 'g': randomG, 'b': randomB},
      optionList[0]: {
              'r': random.nextInt(256),
              'g': random.nextInt(256),
              'b': random.nextInt(256)
            },
      optionList[1]: {
        'r': random.nextInt(256),
        'g': random.nextInt(256),
        'b': random.nextInt(256)
      },
      optionList[2]: {
        'r': random.nextInt(256),
        'g': random.nextInt(256),
        'b': random.nextInt(256)
      },
      optionList[3]: {
        'r': random.nextInt(256),
        'g': random.nextInt(256),
        'b': random.nextInt(256)
      },
      optionList[4]: {
        'r': random.nextInt(256),
        'g': random.nextInt(256),
        'b': random.nextInt(256)
      },
    };

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorOption(randomOptions[0], answerChooseHandler),
            ColorOption(randomOptions[1], answerChooseHandler),
            ColorOption(randomOptions[2], answerChooseHandler),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorOption(randomOptions[3], answerChooseHandler),
            ColorOption(randomOptions[4], answerChooseHandler),
            ColorOption(randomOptions[5], answerChooseHandler),
          ],
        ),
      ],
    );
  }
}
