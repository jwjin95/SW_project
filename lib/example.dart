import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:softwareEngineering/diary.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart';

import 'Question_end.dart';
import 'package:softwareEngineering/ThemaColorList.dart';
import 'package:softwareEngineering/ThemaFont.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';


class CalendarPage2 extends StatefulWidget {

  @override
  CalendarPage2State createState() => new CalendarPage2State();
}

List<DateTime> presentDates = [];

class CalendarPage2State extends State<CalendarPage2> {



  var ans_list = [];
  static var diary_list = Map();

  DateTime _currentDate = DateTime.now();
  DateTime _targetDate = DateTime.now();


  void refresh(DateTime date){
    _currentDate = date;
    _targetDate = date;
  }

  static Widget _absentIcon(String day) => Container(
    child: Center(
      child: Text(
        day,
      ),
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  CalendarCarousel _calendarCarouselNoHeader;

  double cHeight;

  @override
  Widget build(BuildContext context) {
    final curFont=Provider.of<themaFont>(context);
    final curThema=Provider.of<mainThema>(context);

    Widget _presentIcon(String day) => Container(
      //color: Color(curThema.getThemaList()['배경색']),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: Color(curThema.getThemaList()['달력일기쓴날']),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    cHeight = MediaQuery.of(context).size.height;

    var lastdate = DateTime(_currentDate.year,_currentDate.month+1,0).day;

    for (int i = 1; i < lastdate+1; i++) {
      if(diary_list[ DateTime(_currentDate.year, _currentDate.month, i)] != null){
          _markedDateMap.add(
          DateTime(_currentDate.year, _currentDate.month, i),
          new Event(
            date: DateTime(_currentDate.year, _currentDate.month, i),
            title: 'Event 5',
            icon: _presentIcon(i.toString()),
          ),
        );}
    }
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.52,
      // weekendTextStyle: TextStyle(
      //   color: Colors.black,
      // ),
      onLeftArrowPressed: () {
        setState(() {
          if(_targetDate.month != 1) {
            _targetDate = DateTime(_targetDate.year, _targetDate.month - 1);
          }else{
            _targetDate = DateTime(_targetDate.year-1, _targetDate.month + 11);
          }
      });},
      onRightArrowPressed: () {
        setState(() {
          if(_targetDate.month != 12) {
            _targetDate = DateTime(_targetDate.year, _targetDate.month + 1);
          }else{
            _targetDate = DateTime(_targetDate.year+1, _targetDate.month - 11);
          }
        });},
      weekDayBackgroundColor: Color(curThema.getThemaList()['배경색']),
      headerTextStyle: TextStyle(fontSize: 22.0, color: Color(curThema.getThemaList()['달력상단']), fontWeight: FontWeight.w900,fontFamily: curFont.getFont(),),
      headerText: DateFormat('y.MM').format(_targetDate),
      iconColor: Color(curThema.getThemaList()['달력상단']),
      selectedDateTime: _currentDate,
      weekdayTextStyle: TextStyle( fontSize: 15.0, color: Color(curThema.getThemaList()['달력요일글씨']),fontFamily: curFont.getFont(),),
      todayButtonColor: Color(curThema.getThemaList()['배경색']),
      todayBorderColor: Color(curThema.getThemaList()['TODAY']),
      todayTextStyle: TextStyle(color: Color(curThema.getThemaList()['TODAY']),fontFamily: curFont.getFont(),),
      selectedDayButtonColor: Color(curThema.getThemaList()['SELECTED']),
      selectedDayBorderColor: Color(curThema.getThemaList()['배경색']),
      daysTextStyle: TextStyle(color: Colors.black, fontFamily: curFont.getFont(),),
      selectedDayTextStyle: TextStyle(color: Color(curThema.getThemaList()['선택글씨']),fontFamily: curFont.getFont(),),
      daysHaveCircularBorder: true,
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
      null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      onDayPressed: (DateTime date, List<Event> events){
        this.setState(() => refresh(date));
      },
    );

    return new Scaffold(
      backgroundColor:Color(curThema.getThemaList()['배경색']),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _calendarCarouselNoHeader,
            // Container(width: 400, height: 1, color: Color(0xFFBCD4E6),),
            // Container(height: 3,),
            Container(
              color: Color(curThema.getThemaList()['배경색']),
              margin: EdgeInsets.only(left: 13, bottom: 5,),
              child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(DateFormat('yyyy.MM.dd').format(_currentDate), style: TextStyle(color: Color(curThema.getThemaList()['달력하단날짜'])),),
                new FlatButton(child: Text("상세보기", style: TextStyle(color: Color(curThema.getThemaList()['상세보기']),),), onPressed: ()=>{
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => todaydiaryView(_currentDate, diary_list[_currentDate])
                    )
                  )
                }),
              ],
            ),),
            new Text(diary_list[_currentDate]!=null ? diary_list[_currentDate] : "작성된 일기가 없습니다.")
          ],
        ),
      ),
    );
  }
}
