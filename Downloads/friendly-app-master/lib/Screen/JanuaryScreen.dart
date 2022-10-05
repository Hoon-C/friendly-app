import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ver01_friendlystore/Screen/DetailScreen.dart';
import 'package:ver01_friendlystore/model/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

class JanuaryScreen extends StatefulWidget {
  const JanuaryScreen({Key? key}) : super(key: key);

  @override
  State<JanuaryScreen> createState() => _JanuaryScreenState();
}

class _JanuaryScreenState extends State<JanuaryScreen> {
  var dataJson;
  late Model _dataValue;
  late int _length; // late 오류.
  bool isLoading = true;
  List dataItem = [];
  List _image = [];

  void _dataBase() {
    var ref = FirebaseDatabase.instance
        .ref("Info/")
        .orderByChild("season")
        .equalTo("january-fruit");

    ref.onValue.listen((DatabaseEvent event) {
      dataJson = event.snapshot.value;
      print(dataJson);
      _length = dataJson.length;
      setState(() {
        isLoading = false;
      });
      convertJson({required mapValue}) {
        return Model(
            idx: mapValue['idx'],
            name: mapValue['name'],
            image: mapValue['image'],
            kcal: mapValue['kcal'],
            info: mapValue['info'],
            effect: mapValue['effect'],
            tip: mapValue['tip'],
            keep: mapValue['keep'],
            youtube01: mapValue['youtube01'],
            youtube02: mapValue['youtube02'],
            youtube03: mapValue['youtube03'],
            season: mapValue['season']);
      }

      List dataMap = dataJson.keys.toList();
      print(dataMap);
      for (int i = 0; i < dataMap.length; i++) {
        _dataValue = convertJson(mapValue: dataJson[dataMap[i]]); //() [] 차이점??
        dataItem.add(_dataValue);
        _image.add(_dataValue.image);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _dataBase();
  }

  void dispose() {
    super.dispose();
  }

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
          title: Text(
            "January",
            style: TextStyle(color: Color(0xff555555)),
          ),
          backgroundColor: Color(0xffF1EEDE),
          centerTitle: true,
          elevation: 2.5,
        ),
        backgroundColor: Color(0xffF1EEDE),
        body: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Container(
                      child: Text(
                        "Loding",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff555555)),
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(
                          color: Color(0xffFF6836),
                          semanticsValue: "Loding..",
                          strokeWidth: 7.0),
                    ),
                  ])
            : SingleChildScrollView(
                padding: EdgeInsets.all(7),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        height: 16,
                        child: Image.asset(
                          "images/fruitsIcon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3,
                        padding: EdgeInsets.all(10),
                        children: VegeContainer(_length)),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        height: 16,
                        child: Image.asset(
                          "images/vegetableIcon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3,
                        padding: EdgeInsets.all(10),
                        children: VegeContainer(_length)),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        height: 16,
                        child: Image.asset(
                          "images/seafoodIcon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3,
                        padding: EdgeInsets.all(10),
                        children: VegeContainer(_length)),
                  ],
                ),
              )

        // Container(
        //   child: GridView.count(
        //       crossAxisCount: 3,
        //       mainAxisSpacing: 3,
        //       crossAxisSpacing: 3,
        //       padding: EdgeInsets.all(10),
        //       children: VegeContainer(_length)),
        // )
        );
  }

  VegeContainer(int count) {
    return List.generate(count, (index) {
      return TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => DetailScreen(
                        model: dataItem[index],
                      )),
            );
          },
          child: Container(
            width: 102,
            height: 102,
            decoration: BoxDecoration(
              //border: Border.all(width: 2),
              color: Color(0xffF1EEDE),
            ),
            child: Image.network(
              _image[index],
              width: 102,
              height: 102,
              fit: BoxFit.contain,
            ),
          ));
    });
  }
}
