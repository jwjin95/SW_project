import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question5_2.dart';
class Question5_1 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q5_1 ='';
  Map ans;
  Question5_1(this.ans);
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
      //     'Question5_1',
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
      padding: EdgeInsets.all(16.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Container(

            child: Text('오늘 날씨는 어땠어?',
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

                q5_1 = str;



              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          MyButton(
            text: Text(
              '맑음',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q5_1 = "맑음";
              ans['q5_1'] = q5_1;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_2(ans)),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '흐림',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q5_1 = "흐림";
              ans['q5_1'] = q5_1;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_2(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '비',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q5_1 = "비";
              ans['q5_1'] = q5_1;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_2(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '눈',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q5_1 = "눈";
              ans['q5_1'] = q5_1;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question5_2(ans)),
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

                ans['q5_1'] = q5_1;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Question5_2(ans)),
                );

              },
            ),
          ),

        ],
      ),
    );
  }
}