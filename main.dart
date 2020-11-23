import 'package:flutter/material.dart';
import 'package:outline/diary.dart';
import 'package:outline/my_button.dart';
import 'package:outline/Question1_1.dart';


import 'package:outline/think1.dart';
import 'package:outline/think2.dart';
import 'package:outline/think3.dart';
import 'package:outline/think4.dart';
import 'package:outline/think5.dart';
import 'package:outline/think6.dart';
import 'package:outline/think7.dart';
import 'package:outline/think8.dart';
import 'package:outline/think9.dart';
import 'package:outline/think10.dart';
import 'package:outline/think11.dart';
import 'package:outline/think12.dart';
import 'package:outline/think13.dart';

import 'dart:math';

void main() {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Question1_1(),
      title: 'Question',
      routes: {
        '1' : (context) => think1(),
        '2' : (context) => think2(),
        '3' : (context) => think3(),
        '4' : (context) => think4(),
        '5' : (context) => think5(),
        '6' : (context) => think6(),
        '7' : (context) => think7(),
        '8' : (context) => think8(),
        '9' : (context) => think9(),
        '10' : (context) => think10(),
        '11' : (context) => think11(),
        '12' : (context) => think12(),
        '0' : (context) => think13(),
        'diary': (context) => diary(),


      },
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

    );
  }
}


