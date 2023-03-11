import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_2/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: Column(children: [
        Text("${FirebaseAuth.instance.currentUser?.email}"),
        ElevatedButton(
            onPressed: () {
              Auth().logout();
            },
            child: const Text("Logout"))
      ]),
    );
  }
}
