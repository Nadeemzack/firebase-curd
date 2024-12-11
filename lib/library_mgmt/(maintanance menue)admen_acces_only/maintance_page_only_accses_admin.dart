import 'package:firebase_new/library_mgmt/(maintanance%20menue)admen_acces_only/add_book.dart';
import 'package:firebase_new/library_mgmt/(maintanance%20menue)admen_acces_only/addmember.dart';
import 'package:firebase_new/library_mgmt/(maintanance%20menue)admen_acces_only/ubdate_book.dart';
import 'package:firebase_new/library_mgmt/(maintanance%20menue)admen_acces_only/ubdate_membershpi.dart';
import 'package:firebase_new/library_mgmt/(maintanance%20menue)admen_acces_only/user_mgmt.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MaintenancePage extends StatefulWidget {
  @override
  _MaintenancePageState createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    // Check if the user is an admin
    if (user != null && user.email == 'admin@example.com') {
      return Scaffold(
        appBar: AppBar(
          title: Text('Housekeeping'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                // Handle logout navigation
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Chart navigation
                    },
                    child: Text('Chart'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to appropriate home page based on user role
                      if (FirebaseAuth.instance.currentUser?.email ==
                          'admin@example.com') {
                        Navigator.pushNamed(context, '/adminHomePage');
                      } else {
                        Navigator.pushNamed(context, '/userHomePage');
                      }
                    },
                    child: Text('Home'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddMembershipPage()));
                },
                child: Text('Membership - Add'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateMembershipPage()));
                },
                child: Text('Membership - Update'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddBookMoviePage()));
                },
                child: Text('Books/Movies - Add'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateBookMoviePage()));
                },
                child: Text('Books/Movies - Update'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserManagementPage()));
                },
                child: Text('User Management - Add'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserManagementPage()));
                },
                child: Text('User Management - Update'),
              ),
            ],
          ),
        ),
      );
    } else {
      // Redirect to a restricted access page or show an error message
      return Scaffold(
        appBar: AppBar(
          title: Text('Access Denied'),
        ),
        body: Center(
          child: Text('You are not authorized to access this page.'),
        ),
      );
    }
  }
}
