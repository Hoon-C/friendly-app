import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ver01_friendlystore/model/model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.model, Key? key}) : super(key: key);
  final model;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String _name = "";
  Model models = Model();

  // YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId: 'vknCMbnfZYU',
  //   flags: YoutubePlayerFlags(
  //     autoPlay: false,
  //     mute: true,
  //   ),
  // );

  @override
  void initState() {
    super.initState();
    initModel();
  }

  initModel() {
    setState(() {
      models = widget.model;
    });
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
          title: Text("DICTIONARY",
              style: TextStyle(
                  color: Color(0xff555555), fontWeight: FontWeight.normal)),
          backgroundColor: Color(0xffF1EEDE),
          elevation: 2.5,
        ),
        backgroundColor: Color(0xffF1EEDE),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 220,
                    padding: EdgeInsets.all(0),
                    //decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Image.network(models.image!, fit: BoxFit.contain),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    height: 38,
                    width: 120,
                    //decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Text(
                      models.name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff111111), fontSize: 28),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: 38,
                    //decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Image.asset("images/likeImage.png",
                        width: 28, height: 28, fit: BoxFit.contain),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 110,
                    alignment: Alignment.topCenter,
                    //decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Image.asset(
                      "images/infoIcon.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    // height: 110,
                    width: 230,
                    //decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Text(models.info!,
                        maxLines: 10,
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Color(0xff111111), fontSize: 15)),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 110,
                    alignment: Alignment.topCenter,
                    //decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Image.asset(
                      "images/keepIcon.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    // height: 110,
                    width: 230,
                    //decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Text(models.keep!,
                        maxLines: 10,
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Color(0xff111111), fontSize: 15)),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 110,
                    alignment: Alignment.topCenter,
                    //decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Image.asset(
                      "images/youtubeIcon.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                      width: 230,
                      child: Column(
                        children: [
                          // YoutubePlayer(
                          //   controller: _controller,
                          //   showVideoProgressIndicator: false,
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // YoutubePlayer(
                          //   controller: _controller,
                          //   showVideoProgressIndicator: true,
                          //   liveUIColor: Colors.red,
                          // ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
