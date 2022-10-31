import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
    const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // controllers
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    try {
      if (_passController.text.trim() == _confirmPassController.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passController.text.trim());
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Format email atau password salah!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
                    "Ini halaman register.",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    obscureText: true,
                    controller: _confirmPassController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      labelText: 'Confirm Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: _signUp,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Sign Up",
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
                      "Sudah punya akun? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage())),
                      child: const Text(
                        "Login",
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
