import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Book_issu extends StatefulWidget {
  @override
  _Book_issuState createState() => _Book_issuState();
}

class _Book_issuState extends State<Book_issu> {
  final _bookNameController = TextEditingController();
  final _authorController = TextEditingController();
  final _issueDateController = TextEditingController();
  final _returnDateController = TextEditingController();
  final _remarksController = TextEditingController();

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
                    if (FirebaseAuth.instance.currentUser?.email == 'admin@example.com') {
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
            TextField(
              controller: _issueDateController,
              decoration: InputDecoration(labelText: 'Issue Date'),
              readOnly: true, // Make the field read-only for calendar selection
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                // Show a date picker to select the issue date
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _returnDateController,
              decoration: InputDecoration(labelText: 'Return Date'),
              readOnly: true, // Make the field read-only for calendar selection
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                // Show a date picker to select the return date
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _remarksController,
              decoration: InputDecoration(labelText: 'Remarks (Optional)'),
              maxLines: 3, // Allow multiple lines for remarks
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Cancel functionality
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Confirm functionality
                    // Implement logic to process the book issue or return based on the entered details
                    // and display a confirmation message to the user
                  },
                  child: Text('Confirm'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}