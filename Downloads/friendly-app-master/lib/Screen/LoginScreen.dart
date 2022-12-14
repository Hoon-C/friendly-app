import 'dart:convert';
//import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ver01_friendlystore/model/user.dart';
import 'package:ver01_friendlystore/model/login.dart';
import 'package:ver01_friendlystore/main.dart';
import 'package:ver01_friendlystore/Screen/MainScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController checkphoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController loginController = TextEditingController();

  var uid = "";

  bool isLoading = true;

  final firestore = FirebaseFirestore.instance;

  static final storage = FlutterSecureStorage();

  @override
  void dispose() {
    phoneController.dispose();
    codeController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      isLoading = false;
    });
    return GestureDetector(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        // appBar: AppBar(
        //   title: Text("SignPage", style: TextStyle(color: Color(0xff555555))),
        //   backgroundColor: Color(0xffFFDFCD),
        //   centerTitle: true,
        //   elevation: 2.5,
        // ),
        backgroundColor: Color(0xffFFDFCD),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        'images/logo.png',
                        width: 250,
                        height: 70,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _pinInput(),
                            const SizedBox(
                              height: 10,
                            ),
                            _nameInput(),
                            const SizedBox(
                              height: 10,
                            ),
                            _phoneInput(),
                            const SizedBox(
                              height: 10,
                            ),
                            _checkphoneInput(),
                            const SizedBox(
                              height: 10,
                            ),
                            _registerBtn(),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: _formKey2,
                        child: Column(
                          children: [
                            _informationLogin(),
                            const SizedBox(
                              height: 30,
                            ),
                            _loginInput(),
                            const SizedBox(
                              height: 10,
                            ),
                            _loginBtn()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  TextFormField _pinInput() {
    return TextFormField(
      validator: ((String? value) {
        if (value!.isEmpty) {
          return "??? ????????? ??????????????????.";
        }

        if (uid == "!") {
          return "?????? ?????????????????? ??? ???????????????.";
        }

        if (uid == "") {
          return "??? ????????? ???????????? ????????????.";
        }

        return null;
      }),
      controller: codeController,
      maxLines: 1,
      decoration: InputDecoration(
        labelText: "??? ??????",
        hintText: "??? ????????? ???????????????",
        prefixIcon: const Icon(Icons.pin),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 5),
        ),
      ),
    );
  }

  TextFormField _nameInput() {
    return TextFormField(
      controller: nameController,
      maxLines: 1,
      validator: ((String? value) {
        if (value!.isEmpty) {
          return "????????? ??????????????????.";
        }
        return null;
      }),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "??????",
        hintText: "????????? ??????????????????",
        prefixIcon: const Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  TextFormField _phoneInput() {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      validator: ((String? value) {
        if (value!.isEmpty) {
          return "??????????????? ??????????????????.";
        }
        return null;
      }),
      decoration: InputDecoration(
        labelText: "????????????",
        hintText: "??????????????? ??????????????????",
        prefixIcon: const Icon(Icons.phone),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  TextFormField _checkphoneInput() {
    return TextFormField(
      controller: checkphoneController,
      validator: (((value) {
        if (uid == 'k') {
          return "??????????????? ??????????????????.";
        }
        return null;
      })),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: "???????????? ??????",
        hintText: "??????????????? ?????? ?????? ??????????????????",
        prefixIcon: const Icon(Icons.phone),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  ElevatedButton _registerBtn() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          null;
        }
        _checkPin(codeController.text);
      },
      child: const Text(
        "??????",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Row _informationLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "?????? ???????????? ????????? ??????????????? ??????????????????.",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ],
    );
  }

  TextFormField _loginInput() {
    return TextFormField(
      controller: loginController,
      validator: (((String? value) {
        if (value!.isEmpty) {
          return "??????????????? ??????????????????.";
        }
        if (uid == "false") {
          return "????????? ??????????????? ????????????.";
        }
        return null;
      })),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: "????????????",
        hintText: "??????????????? ??????????????????",
        prefixIcon: const Icon(Icons.phone),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  ElevatedButton _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey2.currentState!.validate()) {
          null;
        }
        _checkNumner(loginController.text);
      },
      child: const Text(
        "?????????",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _checkNumner(String number) async {
    bool isThen = false;
    final userRef = firestore.collection('users');
    await userRef
        .where("number", isEqualTo: int.parse(number))
        .get()
        .then((num) {
      QuerySnapshot<Map<String, dynamic>> login = num;

      if (login.docs[0]["number"] == int.parse(number)) {
        isThen = true;
        User user = User(
            uid: login.docs[0]["uid"],
            name: login.docs[0]["name"],
            number: login.docs[0]["number"]);
        //storage.write(key: 'login', value: user.toJson().toString());
        Navigator.popAndPushNamed(context, '/main', arguments: user);
      }
    }).onError((error, stackTrace) {
      if (isThen == false) {
        setState(() {
          uid = "false";
          _formKey2.currentState!.validate();
        });
      }
    });
  }

  Widget _numberCheckPop(BuildContext context) {
    return new AlertDialog(
      title: const Text("Error"),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("???????????? ?????? ???????????? ?????????. \n ??????????????? ?????? ??????????????????"),
        ],
      ),
    );
  }

  void _checkPin(String code) {
    if (checkphoneController.text == phoneController.text) {
      final d = firestore.collection('users').doc(code);
      d.get().then((value) async {
        print(value.data());
        if (value.data() == null) {
          // ?????? ?????????
          setState(() {
            uid = "";
            _formKey.currentState!.validate();
          });
        } else {
          if (value.data()!.isNotEmpty) {
            // ????????? ????????????.
            uid = "!";
            setState(() {
              _formKey.currentState!.validate();
            });
          } else {
            // ?????? ??????????????? ?????????
            uid = code;
            if (_formKey.currentState!.validate()) {
              await firestore.collection('users').doc(code).set({
                'name': nameController.text,
                'number': int.parse(phoneController.text),
                'uid': code,
              }).then(
                (value) async {
                  User user = User(
                    name: nameController.text,
                    number: int.parse(phoneController.text),
                    uid: code,
                  );
                  storage.write(key: 'login', value: user.toJson().toString());

                  moveMain(user);
                },
              );
            }
          }
        }
      });
    } else {
      uid = "k";
      setState(() {
        _formKey.currentState!.validate();
      });
    }
  }

  void moveMain(User user) {
    Navigator.popAndPushNamed(context, '/main', arguments: user);
  }
}
