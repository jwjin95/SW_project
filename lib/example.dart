import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:softwareEngineering/diary.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart';

import 'Question_end.dart';

class CalendarPage2 extends StatefulWidget {

  @override
  _CalendarPage2State createState() => new _CalendarPage2State();
}

List<DateTime> presentDates = [
  DateTime(2020, 11, 9),
  DateTime(2020, 11, 10),
];
// List<DateTime> absentDates = [
//   DateTime(2020, 11, 11),
//   DateTime(2020, 11, 12),
// ];

class _CalendarPage2State extends State<CalendarPage2> {
  var ans_list = [];
  DateTime _currentDate = DateTime.now();
  DateTime _targetDate = DateTime.now();
  static Widget _presentIcon(String day) => Container(
    child: Center(
      child: Text(
        day,
        style: TextStyle(
          color: Color(0xff153F85),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );


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

  var len = 2;
  double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        presentDates[i],
        new Event(
          date: presentDates[i],
          title: 'Event 5',
          icon: _presentIcon(
            presentDates[i].day.toString(),
          ),
        ),
      );
    }

    // for (int i = 0; i < len; i++) {
    //   _markedDateMap.add(
    //     absentDates[i],
    //     new Event(
    //       date: absentDates[i],
    //       title: 'Event 5',
    //       icon: _absentIcon(
    //         absentDates[i].day.toString(),
    //       ),
    //     ),
    //   );
    // }
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.5,
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
      headerTextStyle: TextStyle(fontSize: 22.0, color: Color(0xFF4D70AA), fontWeight: FontWeight.w900),
      headerText: DateFormat('y.MM').format(_targetDate),
      iconColor: Color(0xFF4D70AA),
      selectedDateTime: _currentDate,
      weekdayTextStyle: TextStyle( fontSize: 15.0, color: Color(0xFF4D70AA)),
      todayButtonColor: Colors.white,
      todayBorderColor: Color(0xFF6397D2),
      todayTextStyle: TextStyle(color: Color(0xFF6397D2)),
      selectedDayButtonColor: Color(0xFF6397D2),
      selectedDayBorderColor: Color(0xFFFFFFFF),
      selectedDayTextStyle: TextStyle(color: Colors.white),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _calendarCarouselNoHeader,
            // Container(width: 400, height: 1, color: Color(0xFFBCD4E6),),
            // Container(height: 3,),
            Container(
              margin: EdgeInsets.only(left: 13, bottom: 5,),
              child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(DateFormat('yyyy.MM.dd').format(_currentDate), style: TextStyle(color: Color(0xFF06397D2)),),
                new FlatButton(child:const Text("상세보기", style: TextStyle(color: Color(0xFF6397D2),),), onPressed: ()=>{
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => diaryView(ans_list)
                    )
                  )
                }),
              ],
            ),),
            new Text("여기에 일기를 표시"
                "\n스크롤로 표시되고 오른쪽 위에 상세보기 누르면 화면 전환")
          ],
        ),
      ),
    );
  }
}
