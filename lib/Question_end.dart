import 'package:softwareEngineering/my_button.dart';
import 'package:flutter/material.dart';
import 'package:softwareEngineering/diary.dart';
import 'package:softwareEngineering/showAlertDialog.dart';
import 'package:softwareEngineering/Bubble.dart';

class Question_end extends StatelessWidget {
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  Map ans;
  Question_end(this.ans);
  static const TextStyle optionStyle = TextStyle(fontSize: 25, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontFamily: 'Shrikhand');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        title: Text(
          'Write',
          style: optionStyle,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF6397D2),
        elevation: 0.0,
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text(
      //     'End!',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   elevation: 0.2,
      // ),
      body:

      _buildButton(context),

    );
  }

  Widget _buildButton(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(16.0),

      child: Column(
        children: <Widget>[
          // Center(child: Container(
          //
          //   child: Text('끝!!',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 41,
          //       color: Colors.blueAccent,
          //       height:3.5,
          //     ),
          //
          //   ),
          //
          // ),
          //
          // ),
          bubble(text: "오늘도 찾아와서 너의 \n이야기해줘서 고마워!"),

          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '일기 보기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => diaryView(make_diary(ans))),
              );

            },
          ),
          SizedBox(
            height: 10.0,
          ),

          MyButton(
            text: Text(
              '다시 만들기',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));

            },
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(
            text: Text(
              '편집',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){
              print(make_diary(ans));


            },
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }


  make_diary(Map ans){
    var ret = [];
    String tmp = '';
    switch (ans['q1_1']) {
      case '공부':
        tmp = '오늘은 ${ans['q1_2']}에서 ${ans['q1_1']}를 하였다.';
        break;
      case '운동':
        tmp = '오늘은 ${ans['q1_3']}에서 ${ans['q1_1']}을 하였다.';
        break;
      case '휴식':
        tmp = '오늘은 ${ans['q1_4']}를 하며 쉬었다.';
        break;
      case '친구와 놀기':
        if (ans['q1_5'] == '맛집 탐방'){
          tmp = '오늘은 친구와 맛집 탐방을 하였다';
        } else if(ans['q1_5'] == '술 마시기'){
          tmp = '오늘은 친구와 술을 마셨다.';
        } else if (ans['q1_5'] == 'PC방' || ans['q1_5'] == '카페'){
          tmp = '오늘은 친구와 ${ans['q1_5']}에 갔다.';
        } else {
          tmp = '오늘은 친구와 ${ans['q1_5']}를 하며 놀았다.';
        }
        break;
      default:
        tmp='오늘 한 것 : ${ans['q1_1']}';
        break;
    } //Question 1
    ret.add(tmp);

    var music_genre = ['K-POP', 'POP', 'JAZZ', 'CLASSIC'];

    tmp = '';
    String buf ='';
    if (music_genre.contains(ans['q2_1'])) {
      if (ans['q2_1']=='JAZZ'){
        tmp = '그리고 ${ans['q2_1']}를 들었다.';
      }
      else{
        tmp = '그리고${ans['q2_1']}을 들었다.';
      }
      if(ans['q1_1']=='친구와 놀기'&&ans['q2_3']=='친구랑 놀면서'){
        if (ans['q1_5'] == '맛집 탐방'){
          buf = '맛집 탐방 하다가 들은 건지는 비밀이다. ';
        } else if(ans['q1_5'] == '술 마시기'){
          buf = '술마시다가 들은 건지는 비밀이다.';
        } else if (ans['q1_5'] == 'PC방' || ans['q1_5'] == '카페'){
          buf = '${ans['q1_5']}에서 들었는지는 비밀이다.';
        } else {
          buf = '';
        }
      }
      tmp=tmp+'${ans['q2_3']} 들은 건데 $buf이 음악을 들으면';
      if (ans['q2_2'] == '덕질하려고'){
        tmp = tmp + ' 덕질할 수 있어서 좋다.';
      }
      else {
        tmp = tmp + ' ${ans['q2_2']}서 좋다.';
      }
    } else {
      tmp = ans['q2_1'].toString();
    } //Question 2
    ret.add(tmp);

    tmp = '';
    switch (ans['q3_1']) {
      case '즐거움':
        tmp = '나는 오늘 즐거웠다.';
        break;
      case '짜증':
        tmp = '나는 오늘 짜증이 났다.';
        break;
      case '화남':
        tmp = '나는 오늘 화가 났다.';
        break;
      case '설렘':
        tmp = '나는 오늘 설렜다.';
        break;
    } //Question 3
    print("ans q3_2");
    print(ans['q3_2']);
    if (ans['q3_2']=='') {
      tmp+='이유는 말하기가 좀 그렇다..어쨌든';
      switch(ans['q3_1']){
        case '즐거움':
          tmp+= '즐거운 하루였다.';
          break;
        case '짜증':
          tmp += '짜증나는 하루였다.';
          break;
        case '화남':
          tmp += '화나는 하루였다.';
          break;
        case '설렘':
          tmp += '설레이는 하루였다.';
          break;
      }
    }
    else{
      tmp = tmp + ' 그 이유는... ${ans['q3_2']}이다';
    }
    ret.add(tmp);

    tmp = '';
    tmp = '식사로는 ${ans['q4_1']} 먹었는데, ${ans['q4_2']}'; //Question 4

    ret.add(tmp);

    tmp= '';
    switch (ans['q5_1']) {
      case '맑음':
        tmp = '오늘은 맑은 날씨였다.';
        break;
      case '흐림':
        tmp = '오늘은 흐린 날씨였다.';
        break;
      case '비':
        tmp = '오늘은 비가 왔다.';
        break;
      case '눈':
        tmp = '오늘은 눈이 왔다.';
        break;
      default:
        tmp = '오늘은 ${ans['q5_1']} 날 이었다.';
        break;
    } //Question 5
    tmp = tmp + ' 내가 ${ans['q5_2']}하는 날씨이다.';
    if (ans['q5_3']!=''){tmp=tmp+'왜냐하면 ${ans['q5_3']}이다.';}
    ret.add(tmp);

    tmp = '';

    switch(ans['q6_1']){
      case '':
        tmp='하루를 한 문장으로 표현해보려 했는데, 쓸 말이 없다. :)';
        break;
      default:
        tmp = '하루를 한 문장으로 표현하자면 \'${ans['q6_1']}\'한 하루였다.'; //Question 6
    }
    ret.add(tmp);

    tmp = '';
    switch (ans['q7_1']) {
      case '공부':
        tmp = '내일은 ${ans['q7_2']}에서 ${ans['q7_1']}를 할 예정이다.';
        break;
      case '운동':
        tmp = '내일은 ${ans['q7_3']}에서 ${ans['q7_1']}을 할 예정이다.';
        break;
      case '휴식':
        tmp = '내일은 ${ans['q7_4']}를 하며 쉴 예정이다.';
        break;
      case '친구와 놀기':
        if (ans['q7_5'] == '맛집 탐방'){
          tmp = '내일은 친구와 맛집 탐방을 할 예정이다';
        } else if(ans['q7_5'] == '술 마시기'){
          tmp = '내일은 친구와 술을 마실 예정이다.';
        } else if (ans['q7_5'] == 'PC방' || ans['q7_5'] == '카페'){
          tmp = '내일은 친구와 ${ans['q7_5']}에 갈 예정이다.';
        } else {
          tmp = '내일은 친구와 ${ans['q7_5']}를 하며 놀 예정이다.';
        }
        break;
    } //Question 7
    tmp += "\n\n";
    ret.add(tmp);

    String key;
    for (int i =0; i<13 ; i++) {
      key = 'th' + i.toString();
      if (ans.containsKey(key)) {
        if (ans[key] != '') {
          ret.add(ans[key]);
        }
      }
    }
    return ret;
  }
}
