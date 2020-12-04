import 'package:flutter/material.dart';
import 'dart:async';
import 'package:softwareEngineering/ThemaColorList.dart';
import 'package:softwareEngineering/ThemaFont.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

Timer t;
@override
void showAlertDialog(BuildContext context, text) async {
  final themaFont curFont=Provider.of<themaFont>(context);
  String result = await showDialog(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      t = Timer(Duration(milliseconds: 1500), () {
        Navigator.of(context).pop();
      });
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
        ),
        content: Text(text, style: TextStyle(color: Colors.black, fontFamily: curFont.getFont(),),),
      );
    },
  );


}

@override
void dispose() {
  t.cancel();
}


