import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question_end.dart';
import 'dart:math';
import 'package:softwareEngineering/Bubble.dart';
import 'package:softwareEngineering/ThemaColorList.dart';

class think2 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String th2 ='';
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


  static TextStyle optionStyle = TextStyle(fontSize: 25, color: Color(themaColorList[mainThema]['어플상하단글씨']), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand');
  int tmp() {
    return 1;
  }
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


    final Map ans = ModalRoute.of(context).settings.arguments;
    return Padding(
      padding: EdgeInsets.all(16.0),

      child: Column(
        children: <Widget>[
          bubble(text : "내일은 어떤 하루가 됐으면 \n좋겠어?"),
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
                th2 = '내가 바라는 내일 하루: ';
                th2 = th2 + str + "\n";


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
                  ans['th2'] = th2;
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
                  ans['th2'] = th2;
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