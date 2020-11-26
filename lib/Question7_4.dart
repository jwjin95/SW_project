import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question_end.dart';
import 'package:softwareEngineering/showAlertDialog.dart';
import 'dart:math';

class Question7_4 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q7_4 ='';
  Map ans;
  Question7_4(this.ans);

  String randompage='';

  Future gen() async{
    Random random = new Random();
    int ran = random.nextInt(13);
    String page = ran.toString() ;
    randompage = page;
  }
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
      //     'Question7_4',
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
            Center(child: Text('뭐하고 쉴거야?',
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

                q7_4 = str;



              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          MyButton(
            text: Text(
              '휴대폰 보기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q7_4 = "휴대폰 보기";
              ans['q7_4'] = q7_4;
              showAlertDialog(context, ans['a7']);
              gen();
              Navigator.pushNamed(context, randompage,
              arguments: ans);
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '영화보기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q7_4 = "영화보기";
              ans['q7_4'] = q7_4;
              showAlertDialog(context, ans['a7']);
              gen();
              Navigator.pushNamed(context, randompage,
                  arguments: ans );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '종일 누워있기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q7_4 = "종일 누워있기";
              ans['q7_4'] = q7_4;
              showAlertDialog(context, ans['a7']);
              gen();
              Navigator.pushNamed(context, randompage,
                  arguments: ans );

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              'TV보기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              q7_4 = "TV보기";
              ans['q7_4'] = q7_4;
              showAlertDialog(context, ans['a7']);
              gen();
              Navigator.pushNamed(context, randompage,
                  arguments: ans );

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
                ans['q7_4'] = q7_4;
                showAlertDialog(context, ans['a7']);
                gen();
                Navigator.pushNamed(context, randompage ,
                    arguments: ans);

              },
            ),
          ),



        ],
      ),
    );
  }
}