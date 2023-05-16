import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbapp/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final TextEditingController fname = TextEditingController();
final TextEditingController lname = TextEditingController();
final TextEditingController email_id = TextEditingController();
final TextEditingController cpassword = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup Page")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Image.asset(
            'baapb.png',
            height: 130,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: fname,
            decoration: InputDecoration(
              hintText: "First Name",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: lname,
            decoration: InputDecoration(
              hintText: "Last Name",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: email_id,
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: cpassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
              color: Colors.black,
              onPressed: () {
                SignUp(context,email_id.text.trim(), cpassword.text.trim());
              },
              child: Text(
                "Sign Up",
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
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }),
                child: Text(
                  'Already Have a Account',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void SignUp(BuildContext context, String email, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Map<String, dynamic> data = {
        "Id": user.user?.uid ?? "",
        "First name": fname.text,
        "Last name": lname.text,
        "Email": email,
        "Password": password,
      };
      await savedata(data).whenComplete(() => {
       context,  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()))
      });
      // log(user.user?.uid.toString() ?? "");
    } on FirebaseAuth catch (e) {
      log(e.toString());
    }
  }

  Future savedata(Map<String, dynamic> map) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(map["id"])
        .set(map);
  }
}
