import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question2_2.dart';
import 'package:softwareEngineering/showAlertDialog.dart';

class Question2_3 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q2_3 ='';
  Map ans;
  String buf='';
  var doingSth=['공부','운동','휴식','친구와 놀기'];
  Question2_3(this.ans);
  static const TextStyle optionStyle = TextStyle(fontSize: 25, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand');

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      
      appBar: AppBar(
        title: Text(
          'Write',
          style: optionStyle,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF6397D2),
        elevation: 0.0,
      ),

      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text(
      //     'Question2_3',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   elevation: 0.2,
      // ),
      body:

      _buildButton(context),

    );
  }

  Widget _buildButton(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Center(child: Container(
            width: double.infinity,
            height : 160,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 10),

            decoration: BoxDecoration(
              color: const Color(0xffCAE0F8),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 13,
                  offset: Offset(4, 5), // changes position of shadow
                ),
              ],
            ),
            child:
            Center(child: Text('뭐 하면서\n 듣게 된거야?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Color(0xff6397D2),
                height:1.5,
              ),
            ),
            ),),
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
                hintText: '직접입력 ("~하면서" 로 입력해주세요 :) )',
                hintStyle: TextStyle(color: Colors.grey[300]),

              ),

              onSubmitted: (String str){

                q2_3 = str;
              },
            ),
          ),
          SizedBox(
            height: 5.0,
          ),

          MyButton(
            text: Text(
              '공부하면서 들었어',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q2_3 = "공부하면서";
              ans['q2_3'] = q2_3;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_2(ans)),
              );
            },
          ),SizedBox(
            height: 5.0,
          ),

          MyButton(
            text: Text(
              '운동하면서 들었어',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q2_3 = "운동하면서";
              ans['q2_3'] = q2_3;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_2(ans)),
              );
            },
          ),SizedBox(
            height: 5.0,
          ),

          MyButton(
            text: Text(
              '친구랑 놀면서 들었어',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q2_3 = "친구랑 놀면서";
              ans['q2_3'] = q2_3;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_2(ans)),
              );
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          
          MyButton(
            text: Text(
              '지하철에서 들었어',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q2_3 = "지하철타고 이동하면서";
              ans['q2_3'] = q2_3;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_2(ans)),
              );
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          MyButton(
            text: Text(
              '버스에서 들었어',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q2_3 = "버스타고 이동하면서";
              ans['q2_3'] = q2_3;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_2(ans)),
              );

            },
          ),
          SizedBox(
            height: 5.0,
          ),

          MyButton(
            text: Text(
              '그냥 쉬는 시간에 들었어',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q2_3 = "쉬는 시간에";
              ans['q2_3'] = q2_3;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_2(ans)),
              );

            },
          ),
          SizedBox(
            height: 5.0,
          ),
          MyButton(
            text: Text(
              '기억이 잘 안 난다',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q2_3 = "어쩌다 들은 건지 기억이 잘 안 나지만 아무튼";
              ans['q2_3'] = q2_3;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_2(ans)),
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

                ans['q2_3'] = q2_3;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Question2_2(ans)),
                );

              },
            ),
          ),

        ],
      ),
    );
  }
}