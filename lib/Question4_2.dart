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
import 'package:softwareEngineering/Question5_1.dart';
import 'package:softwareEngineering/Question5_2.dart';
import 'package:softwareEngineering/Question6_1.dart';
import 'package:softwareEngineering/Question7_1.dart';
import 'package:softwareEngineering/Question7_2.dart';
import 'package:softwareEngineering/Question7_3.dart';
import 'package:softwareEngineering/Question7_4.dart';

class Question4_2 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q4_2 ='';
  Map ans;
  Question4_2(this.ans);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,


      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Question4_2',
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

            child: Text('맛있었어?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 37,
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

                q4_2 = str;


              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          MyButton(
            text: Text(
              '엄청 맛있었다.',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q4_2 = "엄청 맛있었다.";
              ans['q4_2'] = q4_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_1(ans)),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '꽤 괜찮았다.',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q4_2 = "꽤 괜찮았다.";
              ans['q4_2'] = q4_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_1(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '그냥 그랬다.',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q4_2 = "그냥 그랬다.";
              ans['q4_2'] = q4_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_1(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '좀 별로였다.',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q4_2 = "좀 별로였다.";
              ans['q4_2'] = q4_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_1(ans)),
              );

            },
          ),

          Align(
            alignment: Alignment.centerRight,
            child: OutlineButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text("확인"),
              onPressed: () {
                ans['q4_2'] = q4_2;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Question5_1(ans)),
                );

              },
            ),
          ),

        ],
      ),
    );
  }
}