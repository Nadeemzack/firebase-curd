import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MasterListMembershipsPage extends StatefulWidget {
  @override
  _MasterListMembershipsPageState createState() =>
      _MasterListMembershipsPageState();
}

class _MasterListMembershipsPageState extends State<MasterListMembershipsPage> {
  List<Map<String, dynamic>> _memberships = [
    {
      'Membership Id': '1',
      'Name of Member': 'Member 1',
      'Contact Number': '1234567890',
      'Contact Address': 'Address 1',
      'Aadhar Card No': '123456789012',
      'Start Date of Membership': '2023-11-11',
      'End Date of Membership': '2024-11-11',
      'Status': 'Active',
      'Amount Pending(Fine)': '100'
    },
    // ... other memberships
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master List of Memberships'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Membership Id')),
                  DataColumn(label: Text('Name of Member')),
                  DataColumn(label: Text('Contact Number')),
                  DataColumn(label: Text('Contact Address')),
                  DataColumn(label: Text('Aadhar Card No')),
                  DataColumn(label: Text('Start Date of Membership')),
                  DataColumn(label: Text('End Date of Membership')),
                  DataColumn(label: Text('Status (Active/Inactive)')),
                  DataColumn(label: Text('Amount Pending(Fine)')),
                ],
                rows: _memberships.map((membership) {
                  return DataRow(
                    cells: [
                      DataCell(Text(membership['Membership Id'])),
                      DataCell(Text(membership['Name of Member'])),
                      DataCell(Text(membership['Contact Number'])),
                      DataCell(Text(membership['Contact Address'])),
                      DataCell(Text(membership['Aadhar Card No'])),
                      DataCell(Text(membership['Start Date of Membership'])),
                      DataCell(Text(membership['End Date of Membership'])),
                      DataCell(Text(membership['Status'])),
                      DataCell(Text(membership['Amount Pending(Fine)'])),
                    ],
                  );
                }).toList(),
              ),
            ),
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
                    // Handle Confirm functionality
                    // Implement logic to process any actions related to memberships, e.g., adding, editing, or deleting
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
