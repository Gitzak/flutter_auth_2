import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_2/screens/registration_screen.dart';
import 'package:flutter_auth_2/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void login() async {
    Auth auth = Auth();
    try {
      await auth.signInWithEmailAndPassword(
        email: _emailCtrl.text,
        password: _passCtrl.text,
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen Page')),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _emailCtrl,
              decoration: const InputDecoration(
                label: Text("Email"),
              ),
            ),
            TextField(
              controller: _passCtrl,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text("Password"),
              ),
            ),
            ElevatedButton(
              onPressed: login,
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationScreen()));
              },
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
