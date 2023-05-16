import 'dart:developer';
import 'dart:html';

import 'package:fbapp/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  //

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login page')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset(
              'baapb.png',
              height: 130,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Email",
              ),
              onChanged: ((value) {
                // log(value);
              }),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
              ),
              onChanged: ((value) {
                // log(value);
              }),
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
                color: Colors.black,
                onPressed: () {
                  Login(email.text.trim(), password.text.trim());

                  print('wrong input');
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.read_more),
                InkWell(
                  onTap: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  }),
                  child: Text(
                    'Create your account',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void Login(String email, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log(user.user?.uid.toString() ?? "");
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }
}
