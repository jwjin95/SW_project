import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question5_3.dart';
import 'package:softwareEngineering/showAlertDialog.dart';
import 'package:softwareEngineering/Bubble.dart';
import 'package:softwareEngineering/ThemaColorList.dart';
import 'package:softwareEngineering/ThemaFont.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart'; 

class Question5_2 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q5_2 ='';
  Map ans;
  Question5_2(this.ans);
  
  int tmp() {
    return 1;
  }
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
          bubble(text : "좋아하는 날씨야?"),
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

                q5_2 = str;


              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          MyButton(
            text: Text(
              '매우 좋아',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q5_2 = "매우 좋아";
              ans['q5_2'] = q5_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_3(ans)),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '좋아',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q5_2 = "좋아";
              ans['q5_2'] = q5_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_3(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '좋아하지도 싫어하지도 않아',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q5_2 = "좋아하지도 싫어하지도 않아 ";
              ans['q5_2'] = q5_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_3(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '싫어',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q5_2 = "싫어";
              ans['q5_2'] = q5_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_3(ans)),
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
                  ans['q5_2'] = q5_2;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Question5_3(ans)),
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