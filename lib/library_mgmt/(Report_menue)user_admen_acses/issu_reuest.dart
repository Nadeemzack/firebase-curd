import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class IssueRequestsPage extends StatefulWidget {
  @override
  _IssueRequestsPageState createState() => _IssueRequestsPageState();
}

class _IssueRequestsPageState extends State<IssueRequestsPage> {
  // Assuming you have a list of issue requests fetched from your database
  List<Map<String, dynamic>> _issueRequests = [
    {'Membership Id': '1', 'Name of Book/Movie': 'Book 1', 'Requested Date': '2023-11-11', 'Request Fulfilled Date': '2023-11-12'},
    // ... other issue requests
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issue Requests'),
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
                  DataColumn(label: Text('Membership Id')),
                  DataColumn(label: Text('Name of Book/Movie')),
                  DataColumn(label: Text('Requested Date')),
                  DataColumn(label: Text('Request Fulfilled Date')),
                ],
                rows: _issueRequests.map((issueRequest) {
                  return DataRow(
                    cells: [
                      DataCell(Text(issueRequest['Membership Id'])),
                      DataCell(Text(issueRequest['Name of Book/Movie'])),
                      DataCell(Text(issueRequest['Requested Date'])),
                      DataCell(Text(issueRequest['Request Fulfilled Date'])),
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