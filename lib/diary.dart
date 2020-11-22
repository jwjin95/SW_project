import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:softwareEngineering/example.dart';

class diaryView extends StatelessWidget {
  String tmpStr = '오늘은 다현이와 점심을 먹었다. 강남역에 가서 엽떡을 먹었는데 조금 멀어서 귀찮았지만 맛은 있었다. 오늘 하루는 행복한 하루였다.아주아주아주';
  var ans_list = [];
  diaryView(this.ans_list){
    CalendarPage2State.diary_list[DateTime(2020,11,20)]=ans_list.join(' ');
    CalendarPage2State.diary_list[DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day)]=ans_list.join(' ');
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text("Selected date", style: TextStyle(fontSize: 25, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand'),),
        centerTitle: true,
        backgroundColor: Color(0xFF6397D2),
        elevation: 0.0,
      ),
      body: Center( child : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 25,),
              Container(
                width : 300,
                child : Text(
                this.ans_list.join(" "),
                style: TextStyle(
                  height: 2.0,
                ),),),
              
            ],
          )
        ],
      ),),
    );
  }
}

class todaydiaryView extends StatelessWidget {
  String tmpStr = '오늘은 다현이와 점심을 먹었다. 강남역에 가서 엽떡을 먹었는데 조금 멀어서 귀찮았지만 맛은 있었다. 오늘 하루는 행복한 하루였다.아주아주아주';
  DateTime date;
  String content;
  var diary_list = Map();
  todaydiaryView(DateTime _date, String _content){
    this.date = _date;
    this.content = _content;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text(DateFormat('yyyy.MM.dd').format(date), style: TextStyle(fontSize: 25, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand'),),
        centerTitle: true,
        backgroundColor: Color(0xFF6397D2),
        elevation: 0.0,
      ),
      body: Center( child : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 25,),
              Container(
                width : 300,
                child : Text(
                content != null ? content : "쓰여진 일기가 없습니다",
                style: TextStyle(
                  height: 2.0,
                ),),),
              
            ],
          )
        ],
      ),),
    );
  }
}