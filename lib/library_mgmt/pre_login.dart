import 'package:firebase_new/library_mgmt/admin/LOginScreenAdmin.dart';
import 'package:firebase_new/library_mgmt/login_screen.dart';
import 'package:firebase_new/library_mgmt/user/user_login.dart';
import 'package:firebase_new/library_mgmt/user_login.dart';
import 'package:flutter/material.dart';

class PreLogin extends StatelessWidget {
  const PreLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 150,
                width: 100,
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreenAdmin(),
                              ));
                        },
                        icon: Icon(
                          Icons.admin_panel_settings,
                          size: 100,
                        )),
                    Text("Admen Login")
                  ],
                )),
            SizedBox(
                height: 150,
                width: 100,
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreenUser()));
                        },
                        icon: Icon(
                          Icons.person,
                          size: 90,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("User Login"),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
