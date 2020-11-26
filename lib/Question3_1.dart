import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question3_2.dart';
import 'package:softwareEngineering/Question4_1.dart';
import 'package:softwareEngineering/showAlertDialog.dart';

class Question3_1 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();

  String q3_1 ='';
  Map ans;
  Question3_1(this.ans);
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
      //     'Question3_1',
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
          Center(child: Container(
            width: double.infinity,
            height : 160,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 20),

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
            Center(child: Text('오늘 기분이 \n어때?',
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

                q3_1 = str;


              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          MyButton(
            text: Text(
              '즐거움',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              for(int i=2; i<3; i++) {
                String key = 'q3_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q3_1 = "즐거움";
              ans['q3_1'] = q3_1;
              ans['a3']='오늘이 즐거운 하루였다니! 정말 축하해~';
              showAlertDialog(context, ans['a3']);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question3_2(ans)),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '짜증',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              for(int i=2; i<3; i++) {
                String key = 'q3_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q3_1 = "짜증";
              ans['q3_1'] = q3_1;
              ans['a3']='누가 짜증나게 했어! 내가 대신 혼쭐내줄게! 얼른 기분이 풀리면 좋겠다 :)';
              showAlertDialog(context, ans['a3']);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question3_2(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '화남',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              for(int i=2; i<3; i++) {
                String key = 'q3_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q3_1 = "화남";
              ans['q3_1'] = q3_1;
              ans['a3']='ㅠㅠ뭐야 속상해ㅜㅜ어서 기분이 나아졌으면 좋겠다..';
              showAlertDialog(context, ans['a3']);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question3_2(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '설렘',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              for(int i=2; i<3; i++) {
                String key = 'q3_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q3_1 = "설렘";
              ans['q3_1'] = q3_1;
              ans['a3']='설렘이라니...너무 소중한 기분이야!';
              showAlertDialog(context, ans['a3']);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question3_2(ans)),
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
                for(int i=2; i<3; i++) {
                  String key = 'q3_' + i.toString();
                  if (ans.containsKey(key)) {
                    ans.remove(key);
                  }
                }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
                ans['q3_1'] = q3_1;
                ans['a3']='솔직하게 말해줘서 고마워!';
                showAlertDialog(context, ans['a3']);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Question4_1(ans)),
                );

              },
            ),
          ),

        ],
      ),
    );
  }
}