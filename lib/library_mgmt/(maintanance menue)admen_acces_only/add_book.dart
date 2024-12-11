import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddBookMoviePage extends StatefulWidget {
  @override
  _AddBookMoviePageState createState() => _AddBookMoviePageState();
}

class _AddBookMoviePageState extends State<AddBookMoviePage> {
  final _bookMovieNameController = TextEditingController();
  final _dateOfProcurementController = TextEditingController();
  final _quantityCopiesController = TextEditingController();

  String _selectedType = 'Book';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book/Movie'),
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
            TextField(
              controller: _dateOfProcurementController,
              decoration: InputDecoration(labelText: 'Date of Procurement'),
              readOnly: true, // Make the field read-only for calendar selection
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                // Show a date picker to select the date of procurement
              },
            ),
            TextField(
              controller: _quantityCopiesController,
              decoration: InputDecoration(labelText: 'Quantity/Copies (Default: 1)'),
              keyboardType: TextInputType.number,
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
                    // Implement logic to add the book/movie to the database
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