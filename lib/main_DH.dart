import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline/Q1.dart';
import 'package:outline/Q4.dart';
//constants
const kPrimaryColor = Color(0xff9ce6ff);
const kBorderColor = Color(0xfff2feff);
const kBackgroundWhiteColor = Color(0xffF8F6F5);

const kAmounts = ["50", "100", "250", "500"];


const kTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
);
//
// //constants
// const kPrimaryColor = Color(0xff186049);
// const kBorderColor = Color(0xffE4D5C7);
// const kBackgroundWhiteColor = Color(0xffF8F6F5);
//
// const kAmounts = ["50", "100", "250", "500"];
//
//
// const kTextStyle = TextStyle(
//   fontWeight: FontWeight.bold,
// );
// //

void main(){
  runApp(paymentsApp());
}
class paymentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        sliderTheme: SliderThemeData(
          activeTrackColor: kPrimaryColor,
          thumbColor: kPrimaryColor,
          inactiveTrackColor: Colors.grey.shade200,
        ),

      ),
      home:stf(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CPage()
    );
  }
}