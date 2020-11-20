import 'package:flutter/material.dart';
class diaryView extends StatelessWidget {
  String tmpStr = '오늘은 다현이와 점심을 먹었다. 강남역에 가서 엽떡을 먹었는데 조금 멀어서 귀찮았지만 맛은 있었다. 오늘 하루는 행복한 하루였다.아주아주아주';
  var ans_list = [];
  diaryView(this.ans_list);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text("Selected date", style: TextStyle(fontSize: 25, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand'),),
        centerTitle: true,
        backgroundColor: Color(0xFF6397D2),
        elevation: 0.0,
      ),
      body: Center( child : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 25,),
              Container(
                width : 300,
                child : Text(
                //tmpStr,
                ans_list.join(' '),
                style: TextStyle(
                  height: 2.0,
                ),),),
              //SizedBox(height:200, width: 200, child:Image.asset("images/라면.png"))
            ],
          )
        ],
      ),),
    );
  }
}