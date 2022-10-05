import 'package:flutter/material.dart';
import 'package:ver01_friendlystore/Screen/JanuaryScreen.dart';

class SeasonScreen extends StatelessWidget {
  const SeasonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xff555555),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("SeasonPage"),
        backgroundColor: Colors.amber[600],
        centerTitle: true,
        elevation: 0.5,
      ),
      backgroundColor: Colors.amber[700],
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => JanuaryScreen()),
                );
              },
              child: Image.asset(
                'images/January.jpg',
                width: 120,
                height: 100,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              'images/Fabruary.jpg',
              width: 120,
              height: 100,
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              'images/March.jpg',
              width: 120,
              height: 100,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'images/April.jpg',
              width: 120,
              height: 100,
            ),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              'images/May.jpg',
              width: 120,
              height: 100,
            ),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              'images/June.jpg',
              width: 120,
              height: 100,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'images/July.jpg',
              width: 120,
              height: 100,
            ),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              'images/August.jpg',
              width: 120,
              height: 100,
            ),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              'images/September.jpg',
              width: 120,
              height: 100,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'images/October.jpg',
              width: 120,
              height: 100,
            ),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              'images/November.jpg',
              width: 120,
              height: 100,
            ),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              'images/December.jpg',
              width: 120,
              height: 100,
            ),
          ]),
          Image.asset(
            'images/Etc.jpg',
            width: 180,
            height: 120,
          )
        ],
      )),
    );
  }
}
