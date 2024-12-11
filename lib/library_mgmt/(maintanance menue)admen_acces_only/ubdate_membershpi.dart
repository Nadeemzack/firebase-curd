import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateMembershipPage extends StatefulWidget {
  @override
  _UpdateMembershipPageState createState() => _UpdateMembershipPageState();
}

class _UpdateMembershipPageState extends State<UpdateMembershipPage> {
  final _membershipNumberController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  String _selectedMembershipExtension = 'six months';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Membership'),
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
            TextField(
              controller: _membershipNumberController,
              decoration: InputDecoration(labelText: 'Membership Number'),
            ),
            TextField(
              controller: _startDateController,
              decoration: InputDecoration(labelText: 'Start Date'),
              readOnly: true, // Make the field read-only for calendar selection
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                // Show a date picker to select the start date
              },
            ),
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(labelText: 'End Date'),
              readOnly: true, // Make the field read-only for calendar selection
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                // Show a date picker to select the end date
              },
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Six Months'),
                  value: 'six months',
                  groupValue: _selectedMembershipExtension,
                  onChanged: (value) {
                    setState(() {
                      _selectedMembershipExtension = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('One Year'),
                  value: 'one year',
                  groupValue: _selectedMembershipExtension,
                  onChanged: (value) {
                    setState(() {
                      _selectedMembershipExtension = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Two Years'),
                  value: 'two years',
                  groupValue: _selectedMembershipExtension,
                  onChanged: (value) {
                    setState(() {
                      _selectedMembershipExtension = value!;
                    });
                  },
                ),
              ],
            ),
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
                    // Implement logic to update the membership details in the database
                    // and display a confirmation message to the user
                  },
                  child: Text('Confirm'),
                ),
              ],
            ),
            CheckboxListTile(
              title: Text('Membership Remove'),
              value: false, // Initially set to false
              onChanged: (value) {
                // Implement logic to handle membership removal
              },
            ),
          ],
        ),
      ),
    );
  }
}