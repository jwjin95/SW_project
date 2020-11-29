import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question4_1.dart';
import 'package:softwareEngineering/showAlertDialog.dart';
import 'package:softwareEngineering/Bubble.dart';


class Question3_2 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q3_2 ='';
  Map ans;
  Question3_2(this.ans);
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
      //     'Question3_2',
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
          //   Center(child: Text('그 이유는 뭐야?',
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
          bubble(text : "그 이유는 뭐야?"),

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