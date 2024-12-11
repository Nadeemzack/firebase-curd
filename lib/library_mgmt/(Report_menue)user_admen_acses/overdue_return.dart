import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OverdueReturnsPage extends StatefulWidget {
  @override
  _OverdueReturnsPageState createState() => _OverdueReturnsPageState();
}

class _OverdueReturnsPageState extends State<OverdueReturnsPage> {
  // Assuming you have a list of overdue returns fetched from your database
  List<Map<String, dynamic>> _overdueReturns = [
    {'Serial No': '1', 'Name of Book': 'Book 1', 'Membership Id': '1', 'Date of Issue': '2023-11-11', 'Date of Return': '2023-11-21', 'Fine': '100'},
    // ... other overdue returns
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overdue Returns'),
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
                  DataColumn(label: Text('Membership Id')),
                  DataColumn(label: Text('Date of Issue')),
                  DataColumn(label: Text('Date of Return')),
                  DataColumn(label: Text('Fine Calculations')),
                ],
                rows: _overdueReturns.map((overdueReturn) {
                  return DataRow(
                    cells: [
                      DataCell(Text(overdueReturn['Serial No'])),
                      DataCell(Text(overdueReturn['Name of Book'])),
                      DataCell(Text(overdueReturn['Membership Id'])),
                      DataCell(Text(overdueReturn['Date of Issue'])),
                      DataCell(Text(overdueReturn['Date of Return'])),
                      DataCell(Text(overdueReturn['Fine Calculations'])),
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