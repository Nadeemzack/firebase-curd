import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Book_available extends StatefulWidget {
  @override
  _Book_availableState createState() => _Book_availableState();
}

class _Book_availableState extends State<Book_available> {
  final _bookNameController = TextEditingController();
  final _authorController = TextEditingController();

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
                // Implement logic to check book availability based on entered details
                // and display the result to the user
              },
              child: Text('Is book available?'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _bookNameController,
              decoration: InputDecoration(labelText: 'Enter Book Name'),
            ),
            // DropdownButtonFormField(
            //   // ... dropdown options for book categories or similar
            // ),
            SizedBox(height: 16.0),
            TextField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Enter Author'),
            ),
            // DropdownButtonFormField(
            //   // ... dropdown options for author names or similar
            // ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Back navigation
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Search functionality
                    // Implement logic to search for books based on entered details
                    // and display the results to the user
                  },
                  child: Text('Search'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
