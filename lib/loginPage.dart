import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_new/Create.dart';
import 'package:firebase_new/homescreen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future<void> login() async {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();

    if (email == "" || password == "") {
      print("fill the details");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (userCredential.user != null) {
          if (!mounted) return;
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => const Homescreen1()));
        }
      } on FirebaseAuthException catch (ex) {
        print("$ex");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextField(
              decoration: const InputDecoration(label: Text("Email")),
              controller: emailcontroller,
              
              ),
          TextField(
            controller: passwordcontroller,
            decoration: const InputDecoration(label: Text("Password")),
          ),
          ElevatedButton(
            onPressed: () {
              login();
            },
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateEmail()),
              );
            },
            child: const Text('Create Account'),
          ),
        ],
      ),
    );
  }
}
