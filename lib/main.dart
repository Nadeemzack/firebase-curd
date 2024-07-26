

import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_new/phono_varification.dart';

import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //  it can used to insert the data {

  /*
  Map<String, dynamic> newuser = {
    "name": "numan",
    "email": "nummut@gmail.com",
    "phone": "12344556767667"
  };
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection("users").doc("personal-info").set(newuser);
  //  }

  */ //-----------------------------------------------------

  // it can fetch the all collection data{

  /*
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection("users").get();
  for (var doc in snapshot.docs) {
    print(doc.data().toString());
  }

  */
//}
  ////-----------------------------------------------------
  ///
  /*
// it can used to fetch the particular id documents {
  DocumentSnapshot snapshot2 = await FirebaseFirestore.instance
      .collection("users")
      .doc("1ygUDzP6NLUOGPmQ1Tyc")
      .get();
  print("its my data  ${snapshot2.data()}");

  // 
  */

  // updated the data of users colections
/*
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //firestore.collection("info").doc("personal-info").set(newuser);
  await firestore
      .collection("users")
      .doc("personal-info")
      .update({"email": "munnu@gmail.com"});
  print("updated data");

  */

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Datainput());
  }
}

/*
class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  const AddUser(this.fullName, this.company, this.age, {super.key});

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': fullName, // John Doe
            'company': company, // Stokes and Sons
            'age': age // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}


*/
