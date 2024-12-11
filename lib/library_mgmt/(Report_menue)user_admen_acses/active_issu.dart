import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ActiveIssuesPage extends StatefulWidget {
  @override
  _ActiveIssuesPageState createState() => _ActiveIssuesPageState();
}

class _ActiveIssuesPageState extends State<ActiveIssuesPage> {
  // Assuming you have a list of active issues fetched from your database
  List<Map<String, dynamic>> _activeIssues = [
    {'Serial No/Book/Movie': '1', 'Name of Book/Movie': 'Book 1', 'Membership Id': '1', 'Date of Issue': '2023-11-11', 'Date of Return': '2023-11-21'},
    // ... other active issues
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Issues'),
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
                  DataColumn(label: Text('Serial No/Book/Movie')),
                  DataColumn(label: Text('Name of Book/Movie')),
                  DataColumn(label: Text('Membership Id')),
                  DataColumn(label: Text('Date of Issue')),
                  DataColumn(label: Text('Date of Return')),
                ],
                rows: _activeIssues.map((issue) {
                  return DataRow(
                    cells: [
                      DataCell(Text(issue['Serial No/Book/Movie'])),
                      DataCell(Text(issue['Name of Book/Movie'])),
                      DataCell(Text(issue['Membership Id'])),
                      DataCell(Text(issue['Date of Issue'])),
                      DataCell(Text(issue['Date of Return'])),
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