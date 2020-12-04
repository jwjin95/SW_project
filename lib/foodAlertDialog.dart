
import 'package:flutter/material.dart';

@override
Future<String> foodAlertDialog(BuildContext context, text) async {
  final List foods=[
    ['삼겹살','족발','찜닭','치킨','소고기','돈가스','매운탕','갈비찜','덮밥','볶음밥','국수'],
    ['짜장면','짬뽕','탕수육','마라탕','꿔바로우','마라샹궈','양꼬치','훠궈','맨보샤'],
    ['초밥','돈카츠','우동','샤브샤브','사케동','부타동','가라아게동','스테키동','오마카세','카레'],
    ['파스타','스테이크','이탈리안 피자','타코','또띠아','수프'],
    ['떡볶이','순대','튀김','햄버거','샌드위치','서브웨이','김밥','라면','컵라면','과자']
  ];
  final fSubs=new Map();
  fSubs['한식']=['을','을','을','을','를','를','을','을','을','을','를'];
  fSubs['중식']=['을','을','을','을','를','를','를','를','를'];
  fSubs['일식']=['을','를','을','를','을','을','을','을','를','를'];
  fSubs['양식']=['를','를','를','를','를','를'];
  fSubs['분식']=['를','를','을','를','를','를','을','을','을','를'];

  final foodMap=new Map();
  foodMap['한식']=foods[0];
  foodMap['중식']=foods[1];
  foodMap['일식']=foods[2];
  foodMap['양식']=foods[3];
  foodMap['분식']=foods[4];
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(text),
        content:Container(
          width: double.maxFinite,
          height:200.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: foods.length,
                  itemBuilder: (BuildContext context, int index){
                    return TextButton(
                      child: Text(foodMap[text][index]),
                      onPressed: (){
                        Navigator.pop(context, foodMap[text][index]+fSubs[text][index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  //return result;
}

