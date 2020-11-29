import 'package:flutter/material.dart';
import 'package:softwareEngineering/example.dart';
import 'my_button.dart';
import 'Question1_1.dart';
import 'diary.dart';
import 'package:softwareEngineering/think1.dart';
import 'package:softwareEngineering/think2.dart';
import 'package:softwareEngineering/think3.dart';
import 'package:softwareEngineering/think4.dart';
import 'package:softwareEngineering/think5.dart';
import 'package:softwareEngineering/think6.dart';
import 'package:softwareEngineering/think7.dart';
import 'package:softwareEngineering/think8.dart';
import 'package:softwareEngineering/think9.dart';
import 'package:softwareEngineering/think10.dart';
import 'package:softwareEngineering/think11.dart';
import 'package:softwareEngineering/think12.dart';
import 'package:softwareEngineering/think13.dart';
import 'package:softwareEngineering/diary_end.dart';
import 'package:softwareEngineering/Bubble.dart';

class writePage extends StatelessWidget {
  TextEditingController _tec = TextEditingController();

  var ans = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomPadding: false,

      // appBar: AppBar(

      //   backgroundColor: Colors.blue,
      //   title: Text(
      //     'Question1_1',
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
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Center(child: Container(
          //   width: double.infinity,
          //   height : 160,
          //   alignment: Alignment.center,
          //   padding: const EdgeInsets.all(20),
          //   margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
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
          //   Center(child: Text('오늘의 일기를 작성해볼까?',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 32,
          //       color: Color(0xff6397D2),
          //       height:1.5,
          //     ),
          //   ),
          // ),),
          // ),
          bubble(text : "오늘의 일기를 작성해볼까?"),


          MyButton(
            text: Text(
              '오늘의 일기 작성',
              style: TextStyle(color: Color(0xff6397D2), fontSize: 17, fontWeight: FontWeight.bold,),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => qna()),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '오늘의 일기 조회',
              style: TextStyle(color: Color(0xff6397D2), fontSize: 17, fontWeight: FontWeight.bold,),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    todaydiaryView(DateTime.now(),
                        CalendarPage2State.diary_list[DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day)])),
              );
            },
          ),

        ],
      ),
    );
  }
}

class qna extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    Map ans;
    return MaterialApp(

      home: Question1_1(),
      title: 'Question',
      routes: {
        '1' : (context) => think1(),
        '2' : (context) => think2(),
        '3' : (context) => think3(),
        '4' : (context) => think4(),
        '5' : (context) => think5(),
        '6' : (context) => think6(),
        '7' : (context) => think7(),
        '8' : (context) => think8(),
        '9' : (context) => think9(),
        '10' : (context) => think10(),
        '11' : (context) => think11(),
        '12' : (context) => think12(),
        '0' : (context) => think13(),
        'diary': (context) => diary_end(),
      },
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

    );
  }
}





