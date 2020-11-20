
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Question_end.dart';
import 'example.dart';
import 'package:google_fonts/google_fonts.dart';



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
  int _selectedIndex = 0;
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

  List _pages = [_calendar(), _write()];

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
        backgroundColor: Color(0xFF6397D2),
        elevation: 0.0,
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

class _write extends StatefulWidget{
  @override
  _writeState createState() => _writeState();
}

class _writeState extends State<_write>{

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