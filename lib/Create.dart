import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateEmail extends StatefulWidget {
  const CreateEmail({super.key});

  @override
  State<CreateEmail> createState() => _CreateEmailState();
}

class _CreateEmailState extends State<CreateEmail> {
  TextEditingController emailcontoller = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  Future<void> create() async {
    String email = emailcontoller.text.trim();
    String pass = password.text.trim();
    String cpass = cpassword.text.trim();

    if (email == "" || pass == "" || cpass == "") {
      print('please fill the form');

      //log("jjddj" as num);
    } else if (cpass != pass) {
      print("password is not match");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        if (userCredential.user != null) {
          Navigator.pop(context);
        }

        print("lets create account");
      } on FirebaseAuthException catch (ex) {
        print("$ex");
      }
    }
  }

  int f = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          TextField(
            controller: emailcontoller,
            decoration: const InputDecoration(
                label: Text("Email address"), fillColor: Colors.blue),
          ),
          TextField(
            controller: password,
            decoration: const InputDecoration(label: Text("password")),
          ),
          TextField(
            decoration: const InputDecoration(label: Text("Confirm password")),
            controller: cpassword,
          ),
          ElevatedButton(
              onPressed: () {
                create();
                if (f == 1) {
                  const snackdemo = SnackBar(
                    content: Text('Account is created'),
                    backgroundColor: Colors.green,
                    elevation: 10,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(5),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                }
              },
              child: const Text(
                "save",
              ))
        ],
      )),
    );
  }
}
/*
class snackBarDemo extends StatelessWidget {
  const snackBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        const snackdemo = SnackBar(
          content: Text('Hii this is GFG\'s SnackBar'),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);

        // 'showSnackBar' is deprecated and shouldn't be used.
        //Use ScaffoldMessenger.showSnackBar.
        // Scaffold.of(context).showSnackBar(snackdemo);
      },
      child: const Text('Click Here'),
    );
  }
}
*/

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("welcome");
  }
}
