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
import 'package:softwareEngineering/Question4_1.dart';
import 'package:softwareEngineering/Question5_1.dart';
import 'package:softwareEngineering/Question5_2.dart';
import 'package:softwareEngineering/Question6_1.dart';
import 'package:softwareEngineering/Question7_1.dart';
import 'package:softwareEngineering/Question7_2.dart';
import 'package:softwareEngineering/Question7_3.dart';
import 'package:softwareEngineering/Question7_4.dart';
import 'package:softwareEngineering/Question7_5.dart';

class Question1_5 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q1_5 ='';
  Map ans;
  Question1_5(this.ans);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,


      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Question1_5',
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

            child: Text('뭐하고 놀았어?',
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

                q1_5 = str;


              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          MyButton(
            text: Text(
              'PC방',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q1_5 = "PC방";
              ans['q1_5'] = q1_5;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_1(ans)),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '카페',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q1_5 = "카페";
              ans['q1_5'] = q1_5;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_1(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '맛집 탐방',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q1_5 = "맛집 탐방";
              ans['q1_5'] = q1_5;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_1(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '술 마시기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q1_5 = "술 마시기";
              ans['q1_5'] = q1_5;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_1(ans)),
              );

            },
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

                ans['q1_5'] = q1_5;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Question2_1(ans)),
                );

              },
            ),
          ),


        ],
      ),
    );
  }
}