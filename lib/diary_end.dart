import 'package:flutter/material.dart';
import 'package:softwareEngineering/ThemaColorList.dart';
import 'main.dart';
import 'package:softwareEngineering/ThemaColorList.dart';
import 'package:softwareEngineering/ThemaFont.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class diary_end extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  String q1_1 ='';
  @override
  Widget build(BuildContext context) {
    final curFont=Provider.of<themaFont>(context);
    final curThema=Provider.of<mainThema>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,


      appBar: AppBar(
        backgroundColor: Color(curThema.getThemaList()['배경색']),
        title: Text(
          'diary',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body:

      _buildButton(context),

    );
  }

  Widget _buildButton(BuildContext context) {
    final curFont=Provider.of<themaFont>(context);
    final curThema=Provider.of<mainThema>(context);

    return Padding(
      padding: EdgeInsets.all(16.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Container(

            child: Text('끝!!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 41,
                color: Color(curThema.getThemaList()['대화창말풍선']),
                height:3.5,
              ),

            ),



          ),

          ),

          SizedBox(
            height: 10.0,
          ),






        ],
      ),
    );
  }
}