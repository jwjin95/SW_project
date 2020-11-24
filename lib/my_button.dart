import 'package:softwareEngineering/Question1_1.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({ this.text, this.color, this.radius, this.onPressed});



  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45.0,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            text,

          ],
        ),
        color: Color(0xffFAFAFA),
        onPressed: onPressed,

      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        side: BorderSide(color: Color(0xff99C1DE),width: 3),
      ),
    );
  }
}