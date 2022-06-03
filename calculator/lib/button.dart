import 'package:flutter/material.dart';

import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_ringtone_player/ios_sounds.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color fillcolor;
  final Function callback;
  final Function tone;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.fillcolor,
    required this.callback,
    required this.tone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: fillcolor,
        ),
        child: Center(
          child: TextButton(
              onPressed: (() {
                callback(text);
                tone();
              }),
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              )),
        ),
      ),
    );
  }
}
