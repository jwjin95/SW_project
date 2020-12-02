import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:softwareEngineering/example.dart';

class diaryView extends StatelessWidget {
  String tmpStr = '오늘은 다현이와 점심을 먹었다. 강남역에 가서 엽떡을 먹었는데 조금 멀어서 귀찮았지만 맛은 있었다. 오늘 하루는 행복한 하루였다.아주아주아주';
  var ans_list = [];
  diaryView(this.ans_list){
    CalendarPage2State.diary_list[DateTime(2020,11,20)]=ans_list.join('');
    CalendarPage2State.diary_list[DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day)]=ans_list.join('');
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text(DateFormat('yyyy.MM.dd').format(DateTime.now()), style: TextStyle(fontSize: 25, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand'),),
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
                this.ans_list.join(""),
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
  TextEditingController _tec = TextEditingController();
  todaydiaryView(DateTime _date, String _content){
    this.date = _date;
    this.content = _content != null ? _content : "작성된 일기가 없습니다.";
    _tec = TextEditingController(text: content);
  }
  static const TextStyle optionStyle = TextStyle(fontSize: 25, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text(DateFormat('yyyy.MM.dd').format(date), style: TextStyle(fontSize: 25, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand'),),
        centerTitle: true,
        backgroundColor: Color(0xFF6397D2),
        elevation: 0.0,

        actions: <Widget> [
          new Padding(
              padding: EdgeInsets.only(right : 10),
              child : IconButton(
            icon: new Text("저장", style: TextStyle(fontWeight: FontWeight.w700),),
            onPressed: () => {
              CalendarPage2State.diary_list[date]=_tec.text,
              showAlertDialog(context)
              },
          )),
        ]
      ),
      body: SingleChildScrollView(
        child : Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width : 400,
                padding: EdgeInsets.all(20),
                child : TextField(
                  // textAlignVertical: TextAlignVertical.top,
                  controller: _tec,
                  maxLines: null,
                  decoration: InputDecoration(border: InputBorder.none,
                  hintStyle: optionStyle),
                style: TextStyle(
                  height: 2.0,
                ),),),
              
            ],
          )
      ),
    );
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Friendiary'),
          content: Text("저장이 완료되었습니다."),
          actions: <Widget>[
            FlatButton(
              child: Text('확인', style: TextStyle(color: Color(0xff6397D2), fontWeight: FontWeight.w700),),
              onPressed: () {
                Navigator.pop(context, "OK");
              },
            ),

          ],
        );
      },
    );
  }


}