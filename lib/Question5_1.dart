import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question5_2.dart';
import 'package:softwareEngineering/showAlertDialog.dart';
import 'package:softwareEngineering/Bubble.dart';

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
          //   Center(child: Text('오늘 날씨는 \n어땠어?',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 32,
          //       color: Color(0xff6397D2),
          //       height:1.5,
          //     ),
          //   ),
          //   ),),
          // ),
          bubble(text : "오늘 날씨는 어땠어?"),
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
          SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: OutlineButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text("넘어가기"),
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