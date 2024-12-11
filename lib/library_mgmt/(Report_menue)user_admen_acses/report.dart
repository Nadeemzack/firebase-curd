import 'package:firebase_new/library_mgmt/(Report_menue)user_admen_acses/active_issu.dart';
import 'package:firebase_new/library_mgmt/(Report_menue)user_admen_acses/issu_reuest.dart';
import 'package:firebase_new/library_mgmt/(Report_menue)user_admen_acses/master_list_books.dart';
import 'package:firebase_new/library_mgmt/(Report_menue)user_admen_acses/master_list_memebersshpi.dart';
import 'package:firebase_new/library_mgmt/(Report_menue)user_admen_acses/master_list_movies.dart';
import 'package:firebase_new/library_mgmt/(Report_menue)user_admen_acses/overdue_return.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
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
                 
                  },
                  child: const Text('Chart'),
                ),
                ElevatedButton(
                  onPressed: () {
               
                    if (FirebaseAuth.instance.currentUser?.email ==
                        'admin@example.com') {
                      Navigator.pushNamed(context, '/adminHomePage');
                    } else {
                      Navigator.pushNamed(context, '/userHomePage');
                    }
                  },
                  child: const Text('Home'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Available Reports',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MasterListBooksPage()));
              },
              child: const Text('Master List of Books'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MasterListMoviesPage()));
              },
              child: const Text('Master List of Movies'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MasterListMembershipsPage()));
              },
              child: const Text('Master List of Memberships'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                MaterialPageRoute(builder: (context) => ActiveIssuesPage());
              },
              child: const Text('Active Issues'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                MaterialPageRoute(builder: (context) => OverdueReturnsPage());
              },
              child: const Text('Overdue Returns'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                MaterialPageRoute(builder: (context) => IssueRequestsPage());
              },
              child: const Text('Pending Issue Requests'),
            ),
          ],
        ),
      ),
    );
  }
}
