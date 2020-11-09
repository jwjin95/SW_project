import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart';

import 'diary.dart';

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
  DateTime _currentDate2 = DateTime.now();
  static Widget _presentIcon(String day) => Container(
    child: Center(
      child: Text(
        day,
        style: TextStyle(
          color: Color(0xFF9CC3F2),
        ),
      ),
    ),
  );
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
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      weekdayTextStyle: TextStyle( color: Color(0xFF71B1E0)),
      todayButtonColor: Colors.white,
      todayBorderColor: Color(0xFFBCD4E6),
      selectedDayBorderColor: Colors.amber,
      daysHaveCircularBorder: false,
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
      null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _calendarCarouselNoHeader,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(DateFormat('yyyy.MM.dd').format(DateTime.now())),
                new IconButton(icon: new Icon(Icons.fullscreen), tooltip: "상세보기", onPressed: ()=>{
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => diaryView()
                    )
                  )
                }),
              ],
            ),
            new Text("여기에 일기를 표시"
                "\n스크롤로 표시되고 오른쪽 위에 상세보기 누르면 화면 전환")
          ],
        ),
      ),
    );
  }

  Widget markerRepresent(Color color, String data) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.015,
      ),
      title: new Text(
        data,
      ),
    );
  }
}