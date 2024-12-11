import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddMembershipPage extends StatefulWidget {
  @override
  _AddMembershipPageState createState() => _AddMembershipPageState();
}

class _AddMembershipPageState extends State<AddMembershipPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _contactNameController = TextEditingController();
  final _contactAddressController = TextEditingController();
  final _aadhaarCardNoController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  String _selectedMembershipDuration = 'six months';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Membership'),
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
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _contactNameController,
              decoration: InputDecoration(labelText: 'Contact Name'),
            ),
            TextField(
              controller: _contactAddressController,
              decoration: InputDecoration(labelText: 'Contact Address'),
            ),
            TextField(
              controller: _aadhaarCardNoController,
              decoration: InputDecoration(labelText: 'Aadhaar Card No'),
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
                  groupValue: _selectedMembershipDuration,
                  onChanged: (value) {
                    setState(() {
                      _selectedMembershipDuration = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('One Year'),
                  value: 'one year',
                  groupValue: _selectedMembershipDuration,
                  onChanged: (value) {
                    setState(() {
                      _selectedMembershipDuration = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Two Years'),
                  value: 'two years',
                  groupValue: _selectedMembershipDuration,
                  onChanged: (value) {
                    setState(() {
                      _selectedMembershipDuration = value!;
                    });
                  },
                ),
              ],
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
                    // Implement logic to add the membership to the database
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