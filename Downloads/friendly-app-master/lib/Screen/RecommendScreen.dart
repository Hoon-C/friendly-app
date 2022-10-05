import 'package:flutter/material.dart';
import 'package:ver01_friendlystore/model/model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

import 'package:ver01_friendlystore/Screen/DetailScreen.dart';

class RecommendScreen extends StatefulWidget {
  const RecommendScreen({Key? key}) : super(key: key);

  @override
  State<RecommendScreen> createState() => _RecommendScreen();
}

class _RecommendScreen extends State<RecommendScreen> {
  bool isLoding = true;
  var dataJson;
  late int _length;
  late Model _dataValue;
  List dataName = [];
  List dataImage = [];
  List dataItem = [];
  List dataEffect = [];

  void _dataBase() async {
    var ref = FirebaseDatabase.instance.ref("Info/").orderByChild("name");

    ref.onValue.listen((DatabaseEvent event) {
      dataJson = event.snapshot.value;

      setState(() {
        isLoding = false;
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

      for (int i = 0; i < dataJson.length; i++) {
        _dataValue = convertJson(mapValue: dataJson[i]);
        dataName.add(_dataValue.name);
        dataImage.add(_dataValue.image);
        dataEffect.add(_dataValue.effect);
        dataItem.add(_dataValue);
      }

      _length = dataItem.length;
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
        centerTitle: true,
        title: Text("Recommend",
            style: TextStyle(
                color: Color(0xff555555), fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xffF1EEDE),
        elevation: 2.5,
      ),
      backgroundColor: Color(0xffF1EEDE),
    );
  }
}
