import 'package:flutter/material.dart';

class diaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('오늘의 일기')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          new Text("일기의 제목"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text("라면 먹고싶다"),
              SizedBox(height:200, width: 200, child:Image.asset("images/라면.png"))
            ],
          )
        ],
      )
    );
  }
}