import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ver01_friendlystore/Screen/BasicSortScreen.dart';
import 'package:ver01_friendlystore/Screen/SeasonScreen.dart';
import 'package:ver01_friendlystore/Screen/LikeScreen.dart';
import 'package:ver01_friendlystore/Screen/LoginScreen.dart';
import 'package:ver01_friendlystore/Screen/DetailScreen.dart';
import 'package:ver01_friendlystore/Screen/RecommendScreen.dart';
import 'package:ver01_friendlystore/model/model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/user.dart';

class MainScreen extends StatefulWidget {
  User user;

  MainScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  static final storage = FlutterSecureStorage();
  var searchName;
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadId();
    });
  }

  void _search(String searchText) async {
    var dataValue;
    Model dataItem;

    var ref = await FirebaseDatabase.instance
        .ref("Info/")
        .orderByChild("name")
        .equalTo("${searchText}");

    ref.onValue.listen((DatabaseEvent event) {
      dataValue = event.snapshot.value;
      convertName({required dataMap}) {
        return Model(
            idx: dataMap['idx'],
            name: dataMap['name'],
            image: dataMap['image'],
            kcal: dataMap['kcal'],
            info: dataMap['info'],
            effect: dataMap['effect'],
            tip: dataMap['tip'],
            keep: dataMap['keep'],
            youtube01: dataMap['youtube01'],
            youtube02: dataMap['youtube02'],
            youtube03: dataMap['youtube03'],
            season: dataMap['season']);
      }

      var key = dataValue.keys.first;
      dataItem = convertName(dataMap: dataValue['${key}']);
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => DetailScreen(
                  model: dataItem,
                )),
      );
    });
  }

  _loadId() async {
    var userInfo = await storage.read(key: 'login');
    if (userInfo != null) {
      var uid = userInfo.split("uid: ")[1];
      var name = userInfo.split("name: ")[1];
      var number = userInfo.split("number: ")[1];

      setState(() {
        widget.user.uid = uid.split(",")[0];
        widget.user.name = uid.split(",")[0];
        widget.user.number = int.parse(number.split("}")[0]);
      });
    } else {
      if (!mounted) return;
      Navigator.popAndPushNamed(context, '/Screen/LoginScreen');
    }
  }

// 검색 눌렀을때 유지 폼 모형
// 키보드 한글 타입
// name 필드값 전체 검색
// january--> idx 디테일 스크린으로 넘겨 받아서 사용 법
// "season" idx 0,1 equalsTo 문제
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("");
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text("Home",
                //         style: TextStyle(
                //           color: Colors.black,
                //         )),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) => LikeScreen()),
                        );
                      },
                      child: Image.asset(
                        'images/likeImage.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ],
            ),
            backgroundColor: Color(0xffF1EEDE),
            elevation: 2.5,
          ),
          backgroundColor: Color(0xffF1EEDE),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  Image.asset(
                    'images/logo.png',
                    width: 250,
                    height: 70,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[search()],
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            null;
                          }
                          _search(searchController.text);
                        },
                        child: Image.asset(
                          'images/searchIcon.png',
                          width: 52,
                          height: 52,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SeasonScreen()),
                            );
                          },
                          child: Image.asset('images/card01.png',
                              width: 102, height: 102, fit: BoxFit.contain)),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    BasicSortScreen()),
                          );
                        },
                        child: Image.asset('images/card02.png',
                            width: 102, height: 102, fit: BoxFit.contain),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RecommendScreen()),
                          );
                        },
                        child: Image.asset('images/card03.png',
                            width: 102, height: 102, fit: BoxFit.contain),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5,
                  ),
                  TextButton(
                    onPressed: _launchURL,
                    child: Image.asset('images/banner.png',
                        width: 390, height: 135, fit: BoxFit.contain),
                  )
                ],
              ),
            ),
          )),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse('https://smartstore.naver.com/friendly_store');
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  TextFormField search() {
    return TextFormField(
        controller: searchController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        cursorHeight: 10,
        validator: ((String? value) {
          if (value!.isEmpty) {
            return "검색어를 입력해주세요.";
          }
          return null;
        }),
        decoration: InputDecoration(
          isDense: true,
          hintText: "검색어를 입력해주세요.",
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color(0xffFF6836), width: 1)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color(0xffFF6836), width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color(0xffFF6836), width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color(0xffFF6836), width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color(0xffFF6836), width: 1)),
        ));
  }
}
