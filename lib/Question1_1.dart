import 'package:softwareEngineering/my_button.dart';
import 'package:softwareEngineering/Bubble.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/main.dart';
import 'package:softwareEngineering/Question1_2.dart';
import 'package:softwareEngineering/Question1_3.dart';
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
import 'package:speech_bubble/speech_bubble.dart';
import 'package:bubble/bubble.dart';




class Question1_1 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q1_1 ='';
  var ans = Map();


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
      //     'Question1_1',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   elevation: 0.2,
      // ),
      body: SingleChildScrollView(
      child: _buildButton(context),),

    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),

      child: Column(
        children: <Widget>[
          // Center(child: Container(
          //   width: 500,
          //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          //   child : Bubble(
          //   nip : BubbleNip.leftTop,
          //   style : BubbleStyle(
          //     color: const Color(0xffCAE0F8),
          //     margin: BubbleEdges.only(top: 10),
          //     padding: BubbleEdges.all(20),
          //     alignment: Alignment.center,
          //   ),
          //   child : Center(child: Row(
          //     mainAxisSize: MainAxisSize.max,
          //     children: <Widget>[
          //       Padding(
          //         padding: const EdgeInsets.all(4.0),
          //       ),
          //       Center(child : Text(
          //         '오늘 뭐했어?',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 22,
          //           color: Color(0xff6397D2),
          //           height:1.5,
          //           ),
          //       ),
          //       ),
          //     ],
          //   ),
          // ),),),
          // ),
          bubble(text : "오늘 뭐했어?"),
          Container(
            alignment: Alignment(0.0, 0.0),
            height: 45,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(width: 3, color: Color(0xff99C1DE))),


            child: TextField(
              controller: _tec,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '직접입력',
                hintStyle: TextStyle(color: Colors.grey[300]),

              ),
              onSubmitted: (String str){
                q1_1 = str;
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
                String key = 'q1_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q1_1 = "공부";
              ans['q1_1'] = q1_1;
              ans['a1']= '수고했어 오늘도 :)';
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question1_2(ans)),
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
                String key = 'q1_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q1_1 = "운동";
              ans['q1_1'] = q1_1;
              ans['a1']= '자기관리하는 모습 보기 좋다~!';
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question1_3(ans)),
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
                String key = 'q1_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q1_1 = "휴식";
              ans['q1_1'] = q1_1;
              ans['a1']= '잘했어! 푹 쉬고 리프레쉬하는 시간도 필요하지.';
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question1_4(ans)),
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
                String key = 'q1_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q1_1 = "친구와 놀기";
              ans['q1_1'] = q1_1;
              ans['a1']= '재밌었겠다! 좋은 추억이 될 거야!';
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question1_5(ans)),
              );

            },
          ),
          SizedBox(
            height: 20.0,
          ),

          Align(
            alignment: Alignment.centerRight,
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Color(0xff99C1DE),width: 3),
              ),

              child: Text("넘어가기"),
              onPressed: () {
                for(int i=2; i<6; i++) {
                  String key = 'q1_' + i.toString();
                  if (ans.containsKey(key)) {
                    ans.remove(key);
                  }
                }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
                ans['q1_1'] = q1_1;
                ans['a1']='오~그렇구나!';
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