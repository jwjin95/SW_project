
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Question_end.dart';
import 'example.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_diary.dart';


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

  List _pages = [_calendar(), writePage()];

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