import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_new/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen1 extends StatefulWidget {
  const Homescreen1({super.key});

  @override
  State<Homescreen1> createState() => _Homescreen1State();
}

class _Homescreen1State extends State<Homescreen1> {
  void logout() async {
    print(User);
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => const Loginpage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
            onPressed: () {
              logout();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Container(
            height: 100,
            width: 100,
            color: Colors.amber,
            child: Text("hellow my self mohammada nadeem ")),
      ),
    );
  }
}
