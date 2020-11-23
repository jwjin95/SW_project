import 'package:outline/my_button.dart';
import 'package:flutter/material.dart';
import 'package:outline/main.dart';
import 'package:outline/Question1_2.dart';
import 'package:outline/Question1_3.dart';
import 'package:outline/Question1_4.dart';
import 'package:outline/Question1_4.dart';
import 'package:outline/Question1_5.dart';
import 'package:outline/Question2_1.dart';
import 'package:outline/Question2_2.dart';
import 'package:outline/Question3_1.dart';
import 'package:outline/Question4_1.dart';
import 'package:outline/Question5_1.dart';
import 'package:outline/Question5_2.dart';
import 'package:outline/Question6_1.dart';
import 'package:outline/Question7_1.dart';
import 'package:outline/Question7_2.dart';
import 'package:outline/Question7_3.dart';
import 'package:outline/Question7_4.dart';
import 'package:outline/Question7_5.dart';
import 'package:outline/diary.dart';
import 'dart:math';
class Question7_4 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q7_4 ='';
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
          'Question7_4',
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

            child: Text('뭐하고 쉴거야?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 41,
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

                q7_4 = str;


              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          MyButton(
            text: Text(
              '휴대폰 보기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q7_4 = "휴대폰 보기";
              gen();
              Navigator.pushNamed(context, randompage );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '영화보기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q7_4 = "영화보기";
              gen();
              Navigator.pushNamed(context, randompage );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '종일 누워있기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q7_4 = "종일 누워있기";
              gen();
              Navigator.pushNamed(context, randompage );

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              'TV보기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q7_4 = "TV보기";
              gen();
              Navigator.pushNamed(context, randompage );

            },
          ),


        ],
      ),
    );
  }
}