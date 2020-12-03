import 'package:softwareEngineering/Question1_1.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/ThemaColorList.dart';
import 'main.dart';
import 'package:softwareEngineering/ThemaColorList.dart';
import 'package:softwareEngineering/ThemaFont.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';


class MyButton extends StatelessWidget {
  MyButton({ this.text, this.color, this.radius, this.onPressed});
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {

    final themaFont curFont=Provider.of<themaFont>(context);
    final mainThema curThema=Provider.of<mainThema>(context);

    return ButtonTheme(
      height: 45.0,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            text,

          ],
        ),
        color: Color(curThema.getThemaList()['버튼배경색']),
        onPressed: onPressed,

      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        side: BorderSide(color: Color(curThema.getThemaList()['버튼테두리']),width: 3),
      ),
    );
  }
}