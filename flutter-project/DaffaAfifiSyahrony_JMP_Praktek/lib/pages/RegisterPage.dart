import 'package:flutter/material.dart';
import 'package:login_sqflite/hive/database.dart';
import 'LoginPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RegisterPage(),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserHiveDatabase uhd = UserHiveDatabase();

  TextEditingController unameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    uhd.loadDB();
    super.initState();
  }

  void addNewuser() {
    uhd.users.add([
      uhd.users.length + 1,
      unameController.text,
      passwordController.text,
      nameController.text,
      phoneController.text
    ]);
    uhd.updateDB();
    print(uhd.users);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Registrasi berhasil!"))
    );
    unameController.text = '';
    passwordController.text = '';
    nameController.text = '';
    phoneController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 140, 20, 0),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              "Register Page",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.red, fontSize: 24),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: TextField(
              controller: unameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  labelText: "Username"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  labelText: "Password"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  labelText: "Fullname"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  labelText: "Phone"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 110, right: 110),
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                addNewuser();
              },
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 100, right: 100),
            child: TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen())),
                child: Text(
                  "Login Disini",
                  style:
                      TextStyle(fontWeight: FontWeight.w800, color: Colors.red),
                )),
          ),
        ],
      ),
    );
  }
}
