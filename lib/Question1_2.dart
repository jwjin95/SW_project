import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question2_1.dart';


class Question1_2 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q1_2 ='';
  Map ans;
  Question1_2(this.ans);
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
      //     'Question1_2',
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

            child: Text('어디서 공부했어?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 41,
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

                q1_2 = str;


              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          MyButton(
            text: Text(
              '집',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q1_2 = "집";
              ans['q1_2'] = q1_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_1(ans)),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '학교',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q1_2 = "학교";
              ans['q1_2'] = q1_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_1(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '도서관',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q1_2 = "도서관";
              ans['q1_2'] = q1_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_1(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '카페',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              q1_2 = "카페";
              ans['q1_2'] = q1_2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question2_1(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          Align(
            alignment: Alignment.centerRight,
            child: OutlineButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text("확인"),
              onPressed: () {

                ans['q1_2'] = q1_2;
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