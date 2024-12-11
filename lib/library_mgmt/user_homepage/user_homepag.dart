import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout logic here
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
                    // Handle Reports navigation
                  },
                  child: Text('Reports'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Transactions navigation
                  },
                  child: Text('Transactions'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Back navigation
                  },
                  child: Text('Back'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Product Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with actual data count
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Code No From: SC(B/M)000001'),
                    subtitle: Text('Code No To: SC(B/M)000000'),
                    trailing: Text('Category: Science'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}