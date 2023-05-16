import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class Login1 extends StatefulWidget {
  Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
              controller: emailController,
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
            ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffix: InkWell(
                          onTap: () {
                            toggle.value = !toggle.value;
                          },
                          child: Icon(toggle.value
                              ? Icons.visibility_off
                              : Icons.visibility))),
                  onChanged: ((value) {
                    // log(value);
                  }),
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                authProvider.login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: authProvider.loading
                          ? CircularProgressIndicator()
                          : Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.read_more),
                InkWell(
                  onTap: (() {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => SignUpPage()));
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
}
