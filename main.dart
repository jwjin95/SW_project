import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'diary.dart';
import 'example.dart';

void main() => runApp(MyApp());

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
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Friendiary 설정',
      style: optionStyle,
    ),
    Text(
      'Calendar',
      style: optionStyle,
    ),
    Text(
      'My page',
      style: optionStyle,
    ),
  ];

  List _pages = [ _settings(), _home(), _mypage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _widgetOptions.elementAt(_selectedIndex),
        centerTitle: true,
        backgroundColor: Color(0xFFD6E2E9),
        elevation: 0.0,
      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My page',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xFFD6E2E9),
        selectedItemColor: Color(0xFF6397D2),
        onTap: _onItemTapped,
      ),
    );
  }

}


// _home(){
//   return Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Text('HOME'),
//   );
//}

class _home extends StatefulWidget{
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<_home>{
  // String tmpStr = '오늘은 다현이와 점심을 먹었다. 강남역에 가서 엽떡을 먹었는데 조금 멀어서 귀찮았지만 맛은 있었다. 오늘 하루는 행복한 하루였다.아주아주아주';
  Widget build(BuildContext context){
    return Container(
      width : 300,
      child: CalendarPage2(),
      // child : Column(
      //   children : [
      //     SizedBox(height: 25,),
      //     Text(
      //       tmpStr,
      //       style: TextStyle(
      //         height: 2.0,
      //         //decoration : TextDecoration.underline,
      //       ),),
      //   ],
      // ),
    );
  }
}

class _settings extends StatefulWidget{
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<_settings>{
  SharedPreferences _prefs;
  String _friendName = 'friendiary';
  String _selectedTime = '';

  @override
  final controlFriendName = TextEditingController();
  final controlSelectedTime = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadValue();
  }

  _loadValue() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      controlFriendName.text = _prefs.getString('friendName') ?? 'friendiary';
      controlSelectedTime.text = (_prefs.getString('selectedTime') ?? ' ');

    });
  }

  Widget build(BuildContext context){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          Row( //name
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text('이름 : '),
              SizedBox(width : 260, height: 40, child : TextField(
                controller: controlFriendName,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:5.0, horizontal: 10.0),
                  border: OutlineInputBorder(),
                ),
              ),
              ),],
          ),
          SizedBox(height: 30,),
          Column(children: [
            Row( //birth
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text('알림 시각 :  '),
                SizedBox(width : 90, height: 40, child : TextFormField(
                  textAlign: TextAlign.center,
                  controller: controlSelectedTime,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                ),
                SizedBox(width: 15,),
                SizedBox(
                  height : 32,
                  child : RaisedButton(
                    onPressed: () {
                      Future<TimeOfDay> selectedTime = showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      selectedTime.then((timeOfDay) {
                        setState(() {
                          _selectedTime = '${timeOfDay.hour}:${timeOfDay.minute}';
                          controlSelectedTime.text = '$_selectedTime';
                        });
                      });
                    },
                    child: Text('시간 선택'),
                    color: Color(0xFFD6E2E9),

                ),
                ),
              ],
            ),
          ]),
          SizedBox(height: 25,),
          SizedBox(
            width : 65,
            height : 32,
            child : RaisedButton(
              onPressed: () {
                _friendName = controlFriendName.text;
                _selectedTime = controlSelectedTime.text;
                _prefs.setString('friendName', _friendName);
                _prefs.setString('selectedTime', _selectedTime);
                showAlertDialog(context);
              },
              child: Text('저장',),
              color: Color(0xFFBCD4E6),
            ),),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}

class _mypage extends StatefulWidget{
  @override
  _mypageState createState() => _mypageState();
}

class _mypageState extends State<_mypage>{

  SharedPreferences _prefs;
  String _name = '';
  String _BYear = '';
  String _BMonth = '';
  String _BDay = '';

  @override
  final controlName = TextEditingController();
  final controlBirthYear = TextEditingController();
  final controlBirthMonth = TextEditingController();
  final controlBirthDay = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadValue();
  }

  _loadValue() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      controlName.text = (_prefs.getString('name') ?? '');
      controlBirthYear.text = (_prefs.getString('BYear') ?? '');
      controlBirthMonth.text = (_prefs.getString('BMonth') ?? '');
      controlBirthDay.text = (_prefs.getString('BDay') ?? '');
    });
  }

  Widget build(BuildContext context){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          Row( //name
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text('이름 : '),
              SizedBox(width : 260, height: 40, child : TextField(
                controller: controlName,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:5.0, horizontal: 10.0),
                  border: OutlineInputBorder(),
                ),
              ),
              ),],
          ),
          SizedBox(height: 30,),
          Column(children: [
            Row( //birth
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text('생일 :  '),
                SizedBox(width : 90, height: 40, child : TextField(
                  textAlign: TextAlign.center,
                  controller: controlBirthYear,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                ),
                Text(' 년  '),
                SizedBox(width : 50, height: 40, child : TextField(
                  textAlign: TextAlign.center,
                  controller: controlBirthMonth,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                ),
                Text(' 월  '),
                SizedBox(width : 50, height: 40, child : TextField(
                  textAlign: TextAlign.center,
                  controller: controlBirthDay,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                ),
                Text(' 일'),
              ],
            ),
          ]),
          SizedBox(height: 25,),
          SizedBox(
            width : 65,
            height : 32,
            child : RaisedButton(
            onPressed: () {
              _name = controlName.text;
              _BYear = controlBirthYear.text;
              _BMonth = controlBirthMonth.text;
              _BDay = controlBirthDay.text;
              _prefs.setString('name', _name);
              _prefs.setString('BYear', _BYear);
              _prefs.setString('BMonth', _BMonth);
              _prefs.setString('BDay', _BDay);
              showAlertDialog(context);
            },
            child: Text('저장',),
            color: Color(0xFFBCD4E6),
          ),),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("확인"),
    onPressed: () { Navigator.pop(context); },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0)
    ),
    content: Text("저장을 완료했습니다."),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}