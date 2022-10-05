import 'package:flutter/material.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xff555555),
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text("Like",
            style: TextStyle(
                color: Color(0xff555555), fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xffF1EEDE),
        elevation: 2.5,
      ),
      backgroundColor: Color(0xffF1EEDE),
      body: Center(
          child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Image.asset(
                    'images/horseradish.png',
                    width: 50,
                    height: 50,
                  ),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white38),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: RichText(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          text:
                              ' 이름 : 냉이\n 냉이는 위 점막과 간장의 기능을 개선하기 위한 민간약으로도 오래전부터 이어져왔다. 눈의 충혈과 통증의 완화, 설사, 복통, 고열등을 억제')),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Image.asset(
                    'images/raspberry.png',
                    width: 50,
                    height: 50,
                  ),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white38),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: RichText(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          text:
                              ' 이름 : 산딸기\n 일반 영양소 이외에 플라보노이드,안토시아닌,페놀산 등의 기능성 성분을 함유하고 있는데, 뛰어난 항산화작용은 여러가지 만성 질환의 예방에 효과적이다.')),
                )
              ],
            )
          ],
        ),
      ])),
    );
  }
}
