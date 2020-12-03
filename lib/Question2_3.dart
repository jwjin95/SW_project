import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question2_2.dart';
import 'package:softwareEngineering/showAlertDialog.dart';
import 'package:softwareEngineering/Bubble.dart';
import 'package:softwareEngineering/ThemaColorList.dart';
import 'package:softwareEngineering/ThemaFont.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';    


class Question2_3 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q2_3 ='';
  Map ans;
  String buf='';
  var doingSth=['공부','운동','휴식','친구와 놀기'];
  Question2_3(this.ans);
  

  @override


  Widget build(BuildContext context) {
    final themaFont curFont=Provider.of<themaFont>(context);
    final mainThema curThema=Provider.of<mainThema>(context);
    TextStyle optionStyle = TextStyle(fontSize: 25, color: Color(curThema.getThemaList()['어플상하단글씨']), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand');
    return Scaffold(
      backgroundColor: Color(curThema.getThemaList()['배경색']),

      resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        title: Text(
          'Write',
          style: optionStyle,
        ),
        centerTitle: true,
        backgroundColor: Color(curThema.getThemaList()['어플상하단색']),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: _buildButton(context),),

    );
  }

  Widget _buildButton(BuildContext context) {
    final themaFont curFont=Provider.of<themaFont>(context);
    final mainThema curThema=Provider.of<mainThema>(context);
    return Padding(
      padding: EdgeInsets.all(16.0),

      child: Column(
        children: <Widget>[
          bubble(text : "뭐 하면서 듣게 된거야?"),
          Container(
            alignment: Alignment(0.0, 0.0),
            height: 45,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: new BoxDecoration(
                color: Color(curThema.getThemaList()['배경색']),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(width: 3, color: Color(curThema.getThemaList()['버튼테두리']))),


            child: TextField(
              controller: _tec,
              style: TextStyle(color: Color(curThema.getThemaList()['버튼글씨'])),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '직접입력',
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
              style: TextStyle(color: Color(curThema.getThemaList()['버튼글씨']), fontSize: 17, fontWeight: FontWeight.bold,),
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
              style: TextStyle(color: Color(curThema.getThemaList()['버튼글씨']), fontSize: 17, fontWeight: FontWeight.bold,),
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
              style: TextStyle(color: Color(curThema.getThemaList()['버튼글씨']), fontSize: 17, fontWeight: FontWeight.bold,),
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
              style: TextStyle(color: Color(curThema.getThemaList()['버튼글씨']), fontSize: 17, fontWeight: FontWeight.bold,),
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
              style: TextStyle(color: Color(curThema.getThemaList()['버튼글씨']), fontSize: 17, fontWeight: FontWeight.bold,),
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
              style: TextStyle(color: Color(curThema.getThemaList()['버튼글씨']), fontSize: 17, fontWeight: FontWeight.bold,),
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
              style: TextStyle(color: Color(curThema.getThemaList()['버튼글씨']), fontSize: 17, fontWeight: FontWeight.bold,),
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

                  ans['q2_3'] = q2_3;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Question2_2(ans)),
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