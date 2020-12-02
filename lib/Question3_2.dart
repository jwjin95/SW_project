import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question4_1.dart';
import 'package:softwareEngineering/showAlertDialog.dart';
import 'package:softwareEngineering/Bubble.dart';
import 'package:softwareEngineering/ThemaColorList.dart';


class Question3_2 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q3_2 ='';
  Map ans;
  Question3_2(this.ans);
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
          bubble(text : "그 이유는 뭐야?"),
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

                q3_2 = str;



              },
            ),
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

                  ans['q3_2'] = q3_2;

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