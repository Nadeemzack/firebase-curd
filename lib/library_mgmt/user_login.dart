import 'package:flutter/material.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User Login"),
      ),
      body: Center(
        child: Container(
          height: 400,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 250),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("User Id"),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: ' username',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 250),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      const Text("Password"),
                      Container(
                        height: 50,
                        width: 200,
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  // ignore: sort_child_properties_last
                  child: const Text("LOGIN"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    foregroundColor: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
