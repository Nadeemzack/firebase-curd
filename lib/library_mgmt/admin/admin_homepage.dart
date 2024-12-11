import 'package:firebase_new/library_mgmt/(Report_menue)user_admen_acses/report.dart';
import 'package:firebase_new/library_mgmt/(maintanance%20menue)admen_acces_only/maintance_page_only_accses_admin.dart';
import 'package:firebase_new/library_mgmt/(trasaction)%20user_admen%20accses/transaction.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home Page'),
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
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MaintenancePage()));
                  },
                  child: Text('Maintenance'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReportsPage()));
                  },
                  child: Text('Reports'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Transactions navigation
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionsPage()));
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(100),
                  2: FixedColumnWidth(150),
                },
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Code No From'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Code No To'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Category'),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('SC(B/M)000001'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('SC(B/M)00000'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Science'),
                      ),
                    ),
                  ]),
                  // ... other table rows ...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
