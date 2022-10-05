import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:ver01_friendlystore/model/model.dart';
import 'package:ver01_friendlystore/Screen/DetailScreen.dart';

class BasicSortScreen extends StatefulWidget {
  const BasicSortScreen({Key? key}) : super(key: key);

  @override
  State<BasicSortScreen> createState() => _BasicSortScreen();
}

class _BasicSortScreen extends State<BasicSortScreen> {
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
        title: Text("가나다순",
            style: TextStyle(
                color: Color(0xff555555), fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xffF1EEDE),
        elevation: 2.5,
      ),
      backgroundColor: Color(0xffF1EEDE),
      body: isLoding
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Container(
                    child: Text(
                      "Loding",
                      style: TextStyle(fontSize: 15, color: Color(0xff555555)),
                    ),
                  ),
                  Center(
                    child: CircularProgressIndicator(
                        color: Color(0xffFF6836),
                        semanticsValue: "Loding..",
                        strokeWidth: 7.0),
                  ),
                ])
          : GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 1 / 0.35,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              padding: EdgeInsets.all(10),
              children: SortContainer(_length)),
    );
  }

  SortContainer(int count) {
    return List.generate(count, (index) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => DetailScreen(
                              model: dataItem[index],
                            )),
                  );
                },
                child: Row(children: [
                  Container(
                    width: 102,
                    height: 102,
                    decoration: BoxDecoration(
                      // border: Border.all(width: 2),
                      color: Color(0xffF1EEDE),
                    ),
                    child: Image.network(
                      dataImage[index],
                      width: 102,
                      height: 102,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          height: 32,
                          width: 250,
                          alignment: Alignment.topLeft,
                          child: Text(
                            dataName[index],
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 1,
                            style: TextStyle(
                                color: Color(0xff555555),
                                fontWeight: FontWeight.bold),
                          )
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 2),
                          // ),
                          ),
                      Container(
                          height: 70,
                          width: 250,
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 2),
                          // ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            dataEffect[index],
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 3,
                            style: TextStyle(
                              color: Color(0xff555555),
                            ),
                          )),
                    ],
                  )
                ]))
          ]);
    });
  }
}
