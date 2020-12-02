import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question3_2.dart';
import 'package:softwareEngineering/Question4_1.dart';
import 'package:softwareEngineering/showAlertDialog.dart';
import 'package:softwareEngineering/Bubble.dart';
import 'package:softwareEngineering/ThemaColorList.dart';

class Question3_1 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();

  String q3_1 ='';
  Map ans;
  Question3_1(this.ans);
  static TextStyle optionStyle = TextStyle(fontSize: 25, color: Color(themaColorList[mainThema]['어플상하단글씨']), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand');

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(themaColorList[mainThema]['배경색']),

      resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        title: Text(
          'Write',
          style: optionStyle,
        ),
        centerTitle: true,
        backgroundColor: Color(themaColorList[mainThema]['어플상하단색']),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: _buildButton(context),),

    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),

      child: Column(
        children: <Widget>[
          bubble(text : "오늘 기분은 어때?"),
          Container(
            alignment: Alignment(0.0, 0.0),
            height: 45,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: new BoxDecoration(
                color: Color(themaColorList[mainThema]['배경색']),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(width: 3, color: Color(themaColorList[mainThema]['버튼테두리']))),


            child: TextField(
              controller: _tec,
              style: TextStyle(color: Color(themaColorList[mainThema]['버튼글씨'])),
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
            ],

          ),

        ],
      ),
    );
  }
}