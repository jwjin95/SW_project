import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question_end.dart';
import 'dart:math';
import 'package:softwareEngineering/Bubble.dart';

class think1 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String th1 ='';
  String randompage='';

  Future gen(Map ans) async{
    Random random = new Random();
    String page;
    int ran;
    do {
    ran = random.nextInt(13);
    page = ran.toString() ;}
    while(ans.containsKey('th' + page));
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
      body:

      _buildButton(context),

    );
  }

  Widget _buildButton(BuildContext context) {

    final Map ans = ModalRoute.of(context).settings.arguments;

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
          //   Center(child: Text('내일의 나는 어떤 \n모습이길 바라나요?',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 26,
          //       color: Color(0xff6397D2),
          //       height:1.5,
          //     ),
          //   ),
          //   ),),
          // ),
          bubble(text : "내일의 나는 어떤 모습이길 \n바라?"),
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

                th1 = '내가 바라는 내일의 나의 모습: ';
                th1 = th1 + str + "\n";

              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlineButton(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text("그만두기"),
                onPressed: () {
                  ans['th1'] = th1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Question_end(ans)),
                  );
                },
              ),
              OutlineButton(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text("넘어가기"),
                onPressed: () {
                  ans['th1'] = th1;
                  gen(ans);
                  Navigator.pushNamed(context, randompage,
                      arguments: ans);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}