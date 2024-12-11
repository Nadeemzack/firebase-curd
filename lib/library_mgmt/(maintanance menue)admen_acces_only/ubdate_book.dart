import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateBookMoviePage extends StatefulWidget {
  @override
  _UpdateBookMoviePageState createState() => _UpdateBookMoviePageState();
}

class _UpdateBookMoviePageState extends State<UpdateBookMoviePage> {
  final _bookMovieNameController = TextEditingController();
  final _serialNoController = TextEditingController();
  final _statusController = TextEditingController();
  final _dateController = TextEditingController();

  String _selectedType = 'Book';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Book/Movie'),
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
              children: [
                Radio(
                  value: 'Book',
                  groupValue: _selectedType,
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value!;
                    });
                  },
                ),
                Text('Book'),
                Radio(
                  value: 'Movie',
                  groupValue: _selectedType,
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value!;
                    });
                  },
                ),
                Text('Movie'),
              ],
            ),
            TextField(
              controller: _bookMovieNameController,
              decoration: InputDecoration(labelText: 'Book/Movie Name'),
            ),
            // DropdownButtonFormField(
            //   // ... dropdown options for book/movie categories or similar
            // ),
            TextField(
              controller: _serialNoController,
              decoration: InputDecoration(labelText: 'Serial No'),
            ),
            // DropdownButtonFormField(
            //   // ... dropdown options for status (e.g., available, issued, lost)
            // ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
              readOnly: true, // Make the field read-only for calendar selection
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                // Show a date picker to select the date
              },
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
                    // Implement logic to update the book/movie details in the database
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