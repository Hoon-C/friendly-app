import 'package:flutter/material.dart';
import 'package:ver01_friendlystore/Screen/LoginScreen.dart';
import 'Screen/MainScreen.dart';
import 'Screen/LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FriendlyApp());
}

class FriendlyApp extends StatelessWidget {
  const FriendlyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'FriendlyApp',
      color: Color(0xffF1EEDE),
      home: LoginScreen(
          // uid: "",
          // name: "",
          // number: 0,
          ),
      routes: {
        '/main': (context) =>
            MainScreen(user: User(uid: "", name: "", number: 0)),
      },
    );
  }
}
