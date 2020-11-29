import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Question_end.dart';
import 'example.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_diary.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  _initNotiSetting();
  runApp(MyApp());}

void _initNotiSetting() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final initSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  final initSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
  );
  final initSettings = InitializationSettings(
    android: initSettingsAndroid,
    iOS: initSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
  );

}//알림 셋팅 initialize

Future _dailyAtTimeNotification(hour, min) async {
  final notiTitle = 'FrienDiary';
  final notiDesc = '일기를 작성해보세요!';

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  var android = AndroidNotificationDetails('id', notiTitle, notiDesc,
      importance: Importance.max, priority: Priority.max);
  var ios = IOSNotificationDetails();
  var detail = NotificationDetails(android: android, iOS: ios);


  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.deleteNotificationChannelGroup('id');

  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    notiTitle,
    notiDesc,
    _setNotiTime(hour, min),
    detail,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
    UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
  );

} //매일 같은 시간 알림 보내는 역할

tz.TZDateTime _setNotiTime(hour, min) {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
  final now = tz.TZDateTime.now(tz.local);
  var scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
      hour, min);

  return scheduledDate;
} //시간 설정 함수

Future cancelNotification() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.deleteNotificationChannelGroup('id');
  await flutterLocalNotificationsPlugin.cancel(0);
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}


/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  var _selected_hour;
  var _selected_min;
  var _cur_alert_time;
  SharedPreferences _alertTime_prefs;


  static const TextStyle optionStyle = TextStyle(fontSize: 25, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand');
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Calendar',
      style: optionStyle,
    ),
    Text(
      'Write',
      style: optionStyle,
    ),
  ];

  List _pages = [_calendar(), writePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getCurAlertTime() {
    var ret = '';
    var hour;
    var min;
    if (_cur_alert_time == null) {
      ret = '현재 설정된 알림이 없습니다.';
    } else {
      var times = _cur_alert_time.split(':');
      hour = int.parse(times[0]);
      min = int.parse(times[1]);
      ret = '현재 설정된 시간: ${hour}:${min}';
    }
    return ret;
  }

  Duration _makeDuration() {
    var ret = Map();
    var cur = DateTime.now();
    var hour = cur.hour;
    var min = cur.minute;

    int parseInt(String s) {
      return int.parse(s);
    }

    if (_cur_alert_time == null) {
      ret['hour'] = hour;
      ret['min'] = min;
    } else {
      var times = _cur_alert_time.split(':');
      ret['hour'] = parseInt(times[0]);
      ret['min'] = parseInt(times[1]);
    }
    return Duration(hours: ret['hour'], minutes: ret['min']);
  }


  @override
  void initState() {
    _selected_hour = DateTime.now().hour;
    _selected_min = DateTime.now().minute;

    _loadAlertTime();
    super.initState();
  }

  void _loadAlertTime() async {
    _alertTime_prefs = await SharedPreferences.getInstance();
    setState(() {
      _cur_alert_time = (_alertTime_prefs.getString('_cur_alertTime') ?? null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _widgetOptions.elementAt(_selectedIndex),
        centerTitle: true,
        backgroundColor: Color(0xFF6397D2),
        elevation: 0.0,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add_alert),
              tooltip: '알림 설정',
              onPressed: () => {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: new Text("알림 설정", style: TextStyle(fontSize: 23)),
                      content: new Text(_getCurAlertTime(), style: TextStyle(fontSize: 15)),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: Text("설정하기"),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xff999999),
                                            width: 0.0,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          CupertinoButton(
                                            child: Text('취소'),
                                            onPressed: () {Navigator.pop(context);},
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 5.0,
                                            ),
                                          ),
                                          CupertinoButton(
                                            child: Text('설정'),
                                            onPressed: () {
                                              _dailyAtTimeNotification(_selected_hour, _selected_min
                                                  );
                                              Navigator.of(context).pop(false);
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) => CupertinoAlertDialog(
                                                    title: new Text("알림 설정 완료!"),
                                                    content: new Text(_cur_alert_time + '에 알림이 전송됩니다.'),
                                                    actions: <Widget>[
                                                      CupertinoDialogAction(
                                                        child: Text("확인"),
                                                        onPressed:() => Navigator.of(context).pop(false),
                                                      ),
                                                    ],
                                                  )
                                              );
                                            },
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 5.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 320.0,
                                      color: Colors.white,
                                      child: CupertinoTimerPicker(
                                        alignment: Alignment.center,
                                        mode: CupertinoTimerPickerMode.hm,
                                        minuteInterval: 1,
                                        initialTimerDuration: _makeDuration(),
                                        onTimerDurationChanged: (Duration changedtimer) {
                                          setState(() {
                                            _selected_hour = changedtimer.inHours;
                                            _selected_min = changedtimer.inMinutes.remainder(60);
                                            _cur_alert_time = '${_selected_hour}:${_selected_min}';
                                            _alertTime_prefs.setString('_cur_alertTime', _cur_alert_time);
                                          });
                                        },

                                        /* the rest of the picker */
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          child: Text("취소"),
                          onPressed: () => {Navigator.of(context).pop(false)},
                        )
                      ],
                    )
                )
              },
            ),
            new IconButton(
              icon: new Icon(Icons.remove_circle_outline),
              tooltip: '알림 제거',
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                          title: new Text("알림 제거", style: TextStyle(fontSize: 23)),
                          content: new Text(_getCurAlertTime(), style: TextStyle(fontSize: 15)),
                          actions: <Widget>[
                          CupertinoDialogAction(
                          isDefaultAction: true,
                          child: Text("제거하기"),
                          onPressed: () {
                            if(_cur_alert_time != null) {
                              _cur_alert_time = null;
                              _alertTime_prefs.setString('_cur_alertTime', _cur_alert_time);
                              cancelNotification();
                              Navigator.of(context).pop(false);
                              showCupertinoDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                        content: new Text('알림이 제거되었습니다.', style: TextStyle(fontSize: 15)),
                                        actions: <Widget> [
                                          CupertinoDialogAction(
                                            child: Text("확인"),
                                            isDefaultAction: true,
                                            onPressed: () {Navigator.of(context).pop(false);},
                                          )
                                        ]
                                    );
                                  }
                              );
                            } else {
                              Navigator.of(context).pop(false);
                              showCupertinoDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      content: new Text('현재 설정된 알림이 없습니다.', style: TextStyle(fontSize: 15)),
                                      actions: <Widget> [
                                        CupertinoDialogAction(
                                            child: Text("확인"),
                                            isDefaultAction: true,
                                            onPressed: () {Navigator.of(context).pop(false);},
                                        )
                                      ]
                                    );
                                  }
                              );
                            }
                          }),
                          CupertinoDialogAction(
                              child: Text('취소'),
                              isDestructiveAction: true,
                              onPressed: () {Navigator.of(context).pop();},
                          )
                          ]
                      );
                    }
                );
              }
            )

          ],
      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_sharp),
            label: 'write',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xFF6397D2),
        selectedItemColor: Color(0xFFFFFFFF),
        onTap: _onItemTapped,
      ),
    );
  }

}

class _calendar extends StatefulWidget{
  @override
  _calendarState createState() => _calendarState();
}

class _calendarState extends State<_calendar>{
  Widget build(BuildContext context){
    return Container(
      width : 350,
      child: CalendarPage2(),
    );
  }
}