import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:softwareEngineering/example.dart';
import 'package:softwareEngineering/ThemaColorList.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:softwareEngineering/ThemaFont.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';


class diaryView extends StatelessWidget {
  String tmpStr = '오늘은 다현이와 점심을 먹었다. 강남역에 가서 엽떡을 먹었는데 조금 멀어서 귀찮았지만 맛은 있었다. 오늘 하루는 행복한 하루였다.아주아주아주';
  var ans_list = [];
  diaryView(this.ans_list){
    CalendarPage2State.diary_list[DateTime(2020,11,20)]=ans_list.join('');
    CalendarPage2State.diary_list[DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day)]=ans_list.join('');
  }
  @override
  Widget build(BuildContext context) {
    final curFont=Provider.of<themaFont>(context);
    final curThema=Provider.of<mainThema>(context);


    return Scaffold(
      backgroundColor: Color(curThema.getThemaList()['배경색']),
      appBar:AppBar(
        title: Text(DateFormat('yyyy.MM.dd').format(DateTime.now()), style: TextStyle(fontSize: 25, color: Color(curThema.getThemaList()['어플상하단글씨']), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand'),),
        centerTitle: true,
        backgroundColor: Color(curThema.getThemaList()['어플상하단색']),
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


class todaydiaryView extends StatefulWidget {
  DateTime date;
  String content;
  TextEditingController _tec = TextEditingController();
  todaydiaryView(DateTime _date, String _content){
    this.date = _date;
    this.content = _content != null ? _content : "작성된 일기가 없습니다.";
    _tec = TextEditingController(text: content);
  }  
  @override
  viewerState createState() => new viewerState(date, content); 
}

class viewerState extends State<todaydiaryView> {

  DateTime date;
  String content;
  var diary_list = Map();
  PickedFile _image;
  TextEditingController _tec = TextEditingController();

  viewerState(DateTime _date, String _content){
    this.date = _date;
    this.content = _content != null ? _content : "작성된 일기가 없습니다.";
    _tec = TextEditingController(text: content);
  }

  @override
  Widget build(BuildContext context) {
    final curFont=Provider.of<themaFont>(context);
    final curThema=Provider.of<mainThema>(context);

    TextStyle optionStyle = TextStyle(fontSize: 25, color: Color(curThema.getThemaList()['어플상하단글씨']), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand');

    return Scaffold(
      backgroundColor: Color(curThema.getThemaList()['배경색']),
      appBar:AppBar(
        title: Text(DateFormat('yyyy.MM.dd').format(date), style: TextStyle(fontSize: 25, color: Color(curThema.getThemaList()['어플상하단글씨']), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand'),),
        centerTitle: true,
        backgroundColor: Color(curThema.getThemaList()['어플상하단색']),
        elevation: 0.0,

        actions: <Widget> [
          new Padding(
              padding: EdgeInsets.only(right : 10),
              child : IconButton(
            icon: new Text("저장", style: TextStyle(fontWeight: FontWeight.w700, color: Color(curThema.getThemaList()['어플상하단글씨'])), ),
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
                ),
                ),
                
              ),
              Container(
                width:300,
                height: 300,
                padding: EdgeInsets.all(20),
                child : CalendarPage2State.image_list[date] == null ? null : Image.file(File(CalendarPage2State.image_list[date].path)), 
              ),
            ],
          )
      ),
      floatingActionButton: _buildFloatingActionButton(Color(curThema.getThemaList()['어플상하단색'])),
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
  Widget _buildFloatingActionButton(Color color) {
    return FloatingActionButton(
      child: Icon(Icons.add_a_photo),
      backgroundColor: color,
      onPressed: () {
        _getImage();
      },
    );
  }

  Future _getImage() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    _image = pickedImage;
    CalendarPage2State.image_list[date] = pickedImage;
    setState(() {});
  }

}