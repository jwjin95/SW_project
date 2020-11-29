import 'package:softwareEngineering/Question1_1.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class bubble extends StatelessWidget {
  bubble({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child : Flexible(child : Bubble(
        nip : BubbleNip.leftTop,
        style : BubbleStyle(
          color: const Color(0xffCAE0F8),
          margin: BubbleEdges.only(top: 10),
          padding: BubbleEdges.all(20),
          alignment: Alignment.center,
          elevation: .8,
        ),
        child : Center(child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
            ),
            Text(
              text,
              overflow: TextOverflow.visible,
              // textAlign: TextAlign.center,
              maxLines : 2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xff6397D2),
                height:1.5,
              ),
            ),
          ],
        ),
        ),),),),
    );
  }
}