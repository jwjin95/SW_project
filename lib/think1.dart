import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question_end.dart';
import 'dart:math';
import 'package:softwareEngineering/Bubble.dart';
import 'package:softwareEngineering/ThemaColorList.dart';
import 'package:softwareEngineering/ThemaFont.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';


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
    final Map ans = ModalRoute.of(context).settings.arguments;
    return Padding(
      padding: EdgeInsets.all(16.0),

      child: Column(
        children: <Widget>[
          bubble(text : "내일의 나는 어떤 모습이길 \n바라?"),
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