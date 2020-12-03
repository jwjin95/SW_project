import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:softwareEngineering/utilities/constants.dart';
import 'setpassword.dart';
import 'confirm.dart';
import 'package:softwareEngineering/main.dart';
import 'package:softwareEngineering/ThemaColorList.dart';
import 'package:softwareEngineering/ThemaFont.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  String setpassword='';
  LoginScreen(String str){
    setpassword = str;

  }
  @override
  _LoginScreenState createState() => _LoginScreenState(setpassword);
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  String settingpassword='';
  String insertedpassword='';



  _LoginScreenState(String str1){
    settingpassword = str1;

  }


  void _showDialog(BuildContext context) {
    final themaFont curFont=Provider.of<themaFont>(context);
    final mainThema curThema=Provider.of<mainThema>(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Warning!", style: TextStyle(
            color: Color(curThema.getThemaList()['버튼글씨']),
            fontFamily: curFont.getFont(),
          ),),
          content: new Text("비밀번호가 맞지 않습니다.", style: TextStyle(
            color: Color(curThema.getThemaList()['버튼글씨']),
            fontFamily: curFont.getFont(),
          ),),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close", style: TextStyle(
                color: Color(curThema.getThemaList()['버튼글씨']),
                fontFamily: curFont.getFont(),
              ),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
  Widget _buildPasswordTF() {
    final themaFont curFont=Provider.of<themaFont>(context);
    final mainThema curThema=Provider.of<mainThema>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(curThema.getThemaList()['버튼배경색']),),
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Color(curThema.getThemaList()['버튼글씨']),
              fontFamily: curFont.getFont(),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,

                color: Color(curThema.getThemaList()['버튼글씨']),
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
            onSubmitted: (String str){
              insertedpassword = str;

            },
            onChanged: (String str){
              setState(() {
                insertedpassword = str;
              });
            },

          ),



        ),
      ],
    );
  }



  Widget _buildLoginBtn() {
    final themaFont curFont=Provider.of<themaFont>(context);
    final mainThema curThema=Provider.of<mainThema>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: (){
          if (insertedpassword == settingpassword){
            print('complete');

            Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyStatefulWidget()),
            );

          }else {
            _showDialog(context);
            print(settingpassword);
            print(insertedpassword);
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(curThema.getThemaList()['버튼배경색']),

        child: Text(
          '입력',
          style: TextStyle(
            color: Color(curThema.getThemaList()['버튼글씨']),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: curFont.getFont(),
          ),
        ),
      ),
    );
  }


  Widget _buildSignupBtn() {
    final themaFont curFont=Provider.of<themaFont>(context);
    final mainThema curThema=Provider.of<mainThema>(context);
    return GestureDetector(
      onTap: () {

            Navigator.push(
              context, MaterialPageRoute(builder: (context) => confirmpassword(settingpassword)),
            );



      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '비밀번호 재설정',
              style: TextStyle(
                color: Color(curThema.getThemaList()['달력상단']),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: curFont.getFont(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final themaFont curFont=Provider.of<themaFont>(context);
    final mainThema curThema=Provider.of<mainThema>(context);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:  Color(curThema.getThemaList()['어플상하단색']),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 220.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '비밀번호',
                        style: TextStyle(
                          color: Color(curThema.getThemaList()['어플상하단글씨']),
                          fontFamily: curFont.getFont(),
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildLoginBtn(),

                      _buildSignupBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }




}
