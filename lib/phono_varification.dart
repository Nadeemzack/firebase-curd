import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Datainput extends StatefulWidget {
  const Datainput({super.key});

  @override
  State<Datainput> createState() => _DatainputState();
}

class _DatainputState extends State<Datainput> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  void delete(String a) {
    FirebaseFirestore.instance.collection("users").doc(a).delete();
  }

  void insert() {
    String name1 = namecontroller.text.trim();
    String email1 = emailcontroller.text.trim();

    namecontroller.clear();
    emailcontroller.clear();
    Map<String, dynamic> details = {"name": name1, "Mail": email1};
    if (name1 == "" || email1 == "") {
      print("fill the fields");
    } else {
      FirebaseFirestore.instance.collection("users").add(details);
      print("value are inserted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
            child: Column(
          children: [
            TextField(
              controller: namecontroller,
              decoration: const InputDecoration(label: Text("name")),
            ),
            TextField(
              controller: emailcontroller,
              decoration: const InputDecoration(label: Text("Email")),
            ),
            TextButton(
                onPressed: () {
                  insert();
                },
                child: const Text("insert")),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (context, snapshot) {  
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Expanded(
                          child: ListView.builder(
                        itemBuilder: (context, index) {
                          //Map user = {};
                          Map user = snapshot.data!.docs[index].data()
                              as Map<String, dynamic>;
                          return ListTile(
                            trailing: IconButton(
                                onPressed: () {
                                  var s = snapshot.data!.docs[index];
                                  FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(s.id)
                                      .delete();
                                  print("delete item and id is  ${s.id}");
                                },
                                icon: const Icon(Icons.delete)),
                            title: Text(
                              " Your name  ${user["name"]}",
                            ),
                            subtitle: Text(user["Mail"]),
                          );
                        },
                        itemCount: snapshot.data!.docs.length,
                      ));
                    } else {
                      return const Center(child: CircleAvatar());
                    }
                  } else {
                    return const Text("eror");
                  }
                })
          ],
        )),
      ),
    );
  }
}
