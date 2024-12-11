import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MasterListBooksPage extends StatefulWidget {
  @override
  _MasterListBooksPageState createState() => _MasterListBooksPageState();
}

class _MasterListBooksPageState extends State<MasterListBooksPage> {
  // Assuming you have a list of books fetched from your database
  List<Map<String, dynamic>> _books = [
    {'Serial No': '1', 'Name of Book': 'Book 1', 'Author Name': 'Author 1', 'Category': 'Category 1', 'Status': 'Available', 'Cost': '100', 'Procurement Date': '2023-11-11'},
    // ... other books
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master List of Books'),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Serial No')),
                  DataColumn(label: Text('Name of Book')),
                  DataColumn(label: Text('Author Name')),
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Cost')),
                  DataColumn(label: Text('Procurement Date')),
                ],
                rows: _books.map((book) {
                  return DataRow(
                    cells: [
                      DataCell(Text(book['Serial No'])),
                      DataCell(Text(book['Name of Book'])),
                      DataCell(Text(book['Author Name'])),
                      DataCell(Text(book['Category'])),
                      DataCell(Text(book['Status'])),
                      DataCell(Text(book['Cost'])),
                      DataCell(Text(book['Procurement Date'])),
                    ],
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle Back navigation
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}