import 'package:fbapp/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("learning app")),
      body: Column(
        children: [
          Text(FirebaseAuth.instance.currentUser?.email.toString() ?? ""),
          // Text(FirebaseAuth.instance.currentUser?.uid.toString() ?? ""),
          //  Text(FirebaseAuth.instance.currentUser?.displayName.toString() ?? ""),
            //  Text(FirebaseAuth.instance.currentUser?.updatePassword.toString() ?? ""),
        ],
      ),
    );
  }
}
