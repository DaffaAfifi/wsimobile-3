import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controllers
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passController.text.trim());
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Login gagal!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Halo User!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "Ini halaman login.",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      labelText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: _signIn,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                        ),
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Belum punya akun? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage())),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}