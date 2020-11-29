import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question7_2.dart';
import 'package:softwareEngineering/Question7_3.dart';
import 'package:softwareEngineering/Question7_4.dart';
import 'package:softwareEngineering/Question7_5.dart';
import 'package:softwareEngineering/Question_end.dart';
import 'package:softwareEngineering/showAlertDialog.dart';
import 'dart:math';
import 'package:softwareEngineering/Bubble.dart';

class Question7_1 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q7_1 ='';
  Map ans;
  String randompage='';
  Question7_1(this.ans);
  static const TextStyle optionStyle = TextStyle(fontSize: 25, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand');
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
      //     'Question7_1',
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
          //   width: double.infinity,
          //   height : 160,
          //   alignment: Alignment.center,
          //   padding: const EdgeInsets.all(20),
          //   margin: const EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 20),
          //
          //   decoration: BoxDecoration(
          //     color: const Color(0xffCAE0F8),
          //     borderRadius: BorderRadius.circular(12),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.withOpacity(0.3),
          //         spreadRadius: 2,
          //         blurRadius: 13,
          //         offset: Offset(4, 5), // changes position of shadow
          //       ),
          //     ],
          //   ),
          //   child:
          //   Center(child: Text('내일 뭐 할거야?',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 26,
          //       color: Color(0xff6397D2),
          //       height:1.5,
          //     ),
          //   ),
          //   ),),
          // ),
          bubble(text : "내일 뭐 할거야?"),

          SizedBox(
            height: 10.0,
          ),
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
              ans['a7']='너의 목표대로 이루어지길..!';
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
              ans['a7']='건강해지는 거야!';
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
              ans['a7']='좋아 내일 하루는 릴렉스';
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
              ans['a7']='내일 좋은 시간 보내!';
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question7_5(ans)),
              );

            },
          ),
          SizedBox(
            height: 20.0,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Color(0xff99C1DE),width: 3),
                ),

                child: Text("이전질문"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Color(0xff99C1DE),width: 3),
                ),

                child: Text("홈으로"),
                onPressed: () {
                  Navigator.pushNamed(context, 'main');
                },
              ),
              OutlineButton(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text("넘어가기"),
                onPressed: () {
                  ans['q7_1'] = q7_1;
                  ans['a7']='너의 목표대로 이루어지길..!';
                  gen();
                  Navigator.pushNamed(context, randompage ,
                      arguments: ans);

                },
              ),
            ],

          ),

        ],
      ),
    );
  }
}