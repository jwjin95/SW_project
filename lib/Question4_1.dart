import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/Question4_2.dart';
import 'package:softwareEngineering/Question5_1.dart';
import 'package:softwareEngineering/showAlertDialog.dart';
import 'package:softwareEngineering/Bubble.dart';
import 'package:softwareEngineering/foodAlertDialog.dart';
class Question4_1 extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q4_1 ='';
  String buffer='';
  Map ans;
  Question4_1(this.ans);
  static const TextStyle optionStyle = TextStyle(fontSize: 25, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand');
  int tmp() {
    return 1;
  }
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
      //     'Question4_1',
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
          //   Center(child: Text('오늘 뭐 먹었어?',
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
          bubble(text : "오늘 뭐 먹었어?"),
          SizedBox(
            height: 10.0,
          ),
          new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
              new Radio(
                value: 0,
                groupValue:0,
              ),
              new Text(
                '아침',
              ),
              new Radio(
                value: 1,
                groupValue: 1,

              ),
              new Text(
                '점심'
              ),
              new Radio(
                value: 2,
                groupValue: 2,
              ),
              new Text(
                '저녁',
              ),
            ],
          ),

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

                q4_1 = str;


              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),


          MyButton(
            text: Text(
              '한식',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: () async {
              for(int i=2; i<3; i++) {
                String key = 'q4_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q4_1 = "한식";
              buffer=await foodAlertDialog(context, q4_1);
              ans['q4_1'] = q4_1;
              if (buffer !=null){
                ans['q4_1'] =buffer;
              }
              else{
                ans['q4_1']+='을';
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question4_2(ans)),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '중식',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: () async {
              for(int i=2; i<3; i++) {
                String key = 'q4_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q4_1 = "중식";
              buffer=await foodAlertDialog(context, q4_1);
              ans['q4_1'] = q4_1;

              if (buffer !=null){
                ans['q4_1'] =buffer;
              }
              else{
                ans['q4_1']+='을';
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question4_2(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '일식',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: () async {
              for(int i=2; i<3; i++) {
                String key = 'q4_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q4_1 = "일식";
              buffer=await foodAlertDialog(context, q4_1);
              ans['q4_1'] = q4_1;

              if (buffer !=null){
                ans['q4_1'] =buffer;
              }
              else{
                ans['q4_1']+='을';
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question4_2(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '양식',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: () async {
              for(int i=2; i<3; i++) {
                String key = 'q4_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q4_1 = "양식";
              buffer=await foodAlertDialog(context, q4_1);
              ans['q4_1'] = q4_1;

              if (buffer !=null){
                ans['q4_1'] =buffer;
              }
              else{
                ans['q4_1']+='을';
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question4_2(ans)),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '분식',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: () async{
              for(int i=2; i<3; i++) {
                String key = 'q4_' + i.toString();
                if (ans.containsKey(key)) {
                  ans.remove(key);
                }
              }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
              q4_1 = "분식";
              buffer=await foodAlertDialog(context, q4_1);
              ans['q4_1'] = q4_1;

              if (buffer !=null){
                ans['q4_1'] =buffer;
              }
              else{
                ans['q4_1']+='을';
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Question4_2(ans)),
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
                  for(int i=2; i<6; i++) {
                    String key = 'q1_' + i.toString();
                    if (ans.containsKey(key)) {
                      ans.remove(key);
                    }
                  }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
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
                  for(int i=2; i<6; i++) {
                    String key = 'q1_' + i.toString();
                    if (ans.containsKey(key)) {
                      ans.remove(key);
                    }
                  }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
                  Navigator.pushNamed(context, 'main');
                },
              ),
              OutlineButton(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text("넘어가기"),
                onPressed: () {
                  for(int i=2; i<3; i++) {
                    String key = 'q4_' + i.toString();
                    if (ans.containsKey(key)) {
                      ans.remove(key);
                    }
                  }//이전화면으로 돌아가 다시 선택하는 경우 dict에서 key를 제거
                  ans['q4_1'] = q4_1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Question5_1(ans)),
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