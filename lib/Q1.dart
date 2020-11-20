import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CPage extends StatefulWidget{
  @override
  _CupertinoPageState createState() =>_CupertinoPageState();
}

class _CupertinoPageState extends State<CPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('쿠퍼티노 ui'),
      ),
      body:Column(
        children: <Widget>[
          CupertinoButton(
            child: Text(
              '쿠퍼티노 버튼',
              style: TextStyle(color: Colors.green),
            ))
        ],
      ),
    );
  }
}