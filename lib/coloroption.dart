import 'dart:math';
import 'package:flutter/material.dart';

class ColorOption extends StatelessWidget {
  final rgb;
  final Function optionChoosenHandler;

  ColorOption(this.rgb, this.optionChoosenHandler);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => optionChoosenHandler(rgb['r'], rgb['g'], rgb['b']),
      child: Container(
        margin: EdgeInsets.all(5),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(rgb['r'], rgb['g'], rgb['b'], 1),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
