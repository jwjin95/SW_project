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
import 'package:softwareEngineering/Question_end.dart';

class Question7_1 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q7_1 ='';
  Map ans;
  Question7_1(this.ans);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,


      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Question7_1',
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

            child: Text('내일 뭐 할거야?',
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

                q7_1 = str;



              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          MyButton(
            text: Text(
              '공부',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              for(int i=2; i<6; i++) {
                String key = 'q7_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q7_1 = "공부";
              ans['q7_1'] = q7_1;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question7_2(ans)),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '운동',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              for(int i=2; i<6; i++) {
                String key = 'q7_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q7_1 = "운동";
              ans['q7_1'] = q7_1;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question7_3(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '휴식',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              for(int i=2; i<6; i++) {
                String key = 'q7_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q7_1 = "휴식";
              ans['q7_1'] = q7_1;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question7_4(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '친구와 놀기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              for(int i=2; i<6; i++) {
                String key = 'q7_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q7_1 = "친구와 놀기";
              ans['q7_1'] = q7_1;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question7_5(ans)),
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
                for(int i=2; i<6; i++) {
                  String key = 'q7_' + i.toString();
                  if (ans.containsKey(key)) {
                    ans.remove(key);
                  }
                }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
                ans['q7_1'] = q7_1;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Question_end(ans)),
                );

              },
            ),
          ),







        ],
      ),
    );
  }
}