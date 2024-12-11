import 'package:firebase_new/library_mgmt/(trasaction)%20user_admen%20accses/book_available.dart';
import 'package:firebase_new/library_mgmt/(trasaction)%20user_admen%20accses/book_issu.dart';
import 'package:firebase_new/library_mgmt/(trasaction)%20user_admen%20accses/pay_fine.dart';
import 'package:firebase_new/library_mgmt/(trasaction)%20user_admen%20accses/return_book_available.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
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
                // Handle "Is book available?" functionality
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Book_available()));
              },
              child: Text('Is book available?'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Book_issu()));
              },
              child: Text('Issue book?'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Book_return()));
              },
              child: Text('Return book?'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Pay_fine()));
              },
              child: Text('Pay Fine?'),
            ),
          ],
        ),
      ),
    );
  }
}
