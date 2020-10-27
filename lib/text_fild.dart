import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFild extends StatelessWidget {
  const MyTextFild({
    Key key,
    @required this.myController,
    @required this.myHight,
    @required this.myHintText,
    @required this.myFillColor,
  }) : super(key: key);

  final TextEditingController myController;
  final double myHight;
  final String myHintText;
  final Color myFillColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          filled: true,
          hintStyle: TextStyle(
              color: Colors.black,
              fontSize: myHight * 5,
              fontWeight: FontWeight.bold),
          hintText: myHintText,
          fillColor: myFillColor),
    );
  }
}
