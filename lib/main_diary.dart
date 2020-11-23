import 'package:flutter/material.dart';
import 'package:softwareEngineering/example.dart';
import 'my_button.dart';
import 'Question1_1.dart';
import 'diary.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Container(

            child: Text('To Do',
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

          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '오늘의 일기 조회',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
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
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '오늘의 일기 작성',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
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

          SizedBox(
            height: 10.0,
          ),

          SizedBox(
            height: 10.0,
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
    return MaterialApp(

      home: Question1_1(),
      title: 'Question',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

    );
  }
}


