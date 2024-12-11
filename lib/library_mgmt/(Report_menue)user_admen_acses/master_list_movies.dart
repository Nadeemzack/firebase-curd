import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MasterListMoviesPage extends StatefulWidget {
  @override
  _MasterListMoviesPageState createState() => _MasterListMoviesPageState();
}

class _MasterListMoviesPageState extends State<MasterListMoviesPage> {
  // Assuming you have a list of movies fetched from your database
  List<Map<String, dynamic>> _movies = [
    {'Serial No': '1', 'Name of Movie': 'Movie 1', 'Author Name': 'Director 1', 'Category': 'Category 1', 'Status': 'Available', 'Cost': '100', 'Procurement Date': '2023-11-11'},
    // ... other movies
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master List of Movies'),
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
                  DataColumn(label: Text('Name of Movie')),
                  DataColumn(label: Text('Author Name')),
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Cost')),
                  DataColumn(label: Text('Procurement Date')),
                ],
                rows: _movies.map((movie) {
                  return DataRow(
                    cells: [
                      DataCell(Text(movie['Serial No'])),
                      DataCell(Text(movie['Name of Movie'])),
                      DataCell(Text(movie['Author Name'])),
                      DataCell(Text(movie['Category'])),
                      DataCell(Text(movie['Status'])),
                      DataCell(Text(movie['Cost'])),
                      DataCell(Text(movie['Procurement Date'])),
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