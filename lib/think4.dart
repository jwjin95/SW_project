import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/main.dart';
import 'package:softwareEngineering/Question1_2.dart';
import 'package:softwareEngineering/Question1_3.dart';
import 'package:softwareEngineering/Question1_4.dart';
import 'package:softwareEngineering/Question1_4.dart';
import 'package:softwareEngineering/Question1_5.dart';
import 'package:softwareEngineering/Question2_1.dart';
import 'package:softwareEngineering/Question2_2.dart';
import 'package:softwareEngineering/Question3_1.dart';
import 'package:softwareEngineering/Question3_2.dart';
import 'package:softwareEngineering/Question4_1.dart';
import 'package:softwareEngineering/Question4_2.dart';

import 'package:softwareEngineering/Question5_1.dart';
import 'package:softwareEngineering/Question5_2.dart';
import 'package:softwareEngineering/Question6_1.dart';
import 'package:softwareEngineering/Question7_1.dart';
import 'package:softwareEngineering/Question7_2.dart';
import 'package:softwareEngineering/Question7_3.dart';
import 'package:softwareEngineering/Question7_4.dart';
import 'package:softwareEngineering/diary.dart';

import 'package:softwareEngineering/think1.dart';
import 'package:softwareEngineering/think2.dart';
import 'package:softwareEngineering/think3.dart';
import 'package:softwareEngineering/think4.dart';
import 'package:softwareEngineering/think5.dart';
import 'package:softwareEngineering/think6.dart';
import 'package:softwareEngineering/think7.dart';
import 'package:softwareEngineering/think8.dart';
import 'package:softwareEngineering/think9.dart';
import 'package:softwareEngineering/think10.dart';
import 'package:softwareEngineering/think11.dart';
import 'package:softwareEngineering/think12.dart';
import 'package:softwareEngineering/think13.dart';


import 'dart:math';
class think4 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String th4 ='';
  String randompage='';
  Future gen() async{

    Random random = new Random();
    int ran = random.nextInt(13);
    String page = ran.toString() ;
    randompage = page;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,


      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'think4',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body:

      _buildButton(context),

    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Container(

            child: Text('2년뒤 나는 어떤 모습이기를 바라나요?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Colors.blueAccent,
                height:3.5,
              ),

            ),



          ),

          ),

          SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment(0.0, 0.0),
            height: 45,
            margin: EdgeInsets.only(left: 30, right: 30, top: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1, color: Colors.black12)),

            child: TextField(
              controller: _tec,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '직접입력',
                hintStyle: TextStyle(color: Colors.grey[300]),

              ),

              onSubmitted: (String str){

                th4 = str;


              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          Align(
            alignment: Alignment.centerRight,
            child: OutlineButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text("확인"),
              onPressed: () {
                gen();
                Navigator.pushNamed(context, randompage );

              },
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: OutlineButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text("그만"),
              onPressed: () {

                Navigator.pushNamed(context, 'diary');

              },
            ),
          ),

        ],
      ),
    );
  }
}