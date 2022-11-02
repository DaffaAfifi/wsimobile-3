import 'package:flutter/material.dart';
import 'package:login_sqflite/hive/database.dart';
import 'RegisterPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'HomePage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final box = Hive.box("users");
  UserHiveDatabase uhd = UserHiveDatabase();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
// userId
  @override
  initState() {
    box.get("user") == null ?  uhd.createInit() : uhd.loadDB();
    super.initState();
  }

  _signIn() {
    print(uhd.users);
    for (var i = 0; i < uhd.users.length; i++) {
      if (uhd.users[i][1] == usernameController.text.trim() &&
          uhd.users[i][2] == passwordController.text.trim()) {
        setState(() {
          uhd.userId = uhd.users[i][0];
        });
        uhd.updateDB();
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Username atau Password Salah")));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 200, 20, 0),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              "Login Page",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.red, fontSize: 24),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: TextField(
              controller: usernameController,
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
            padding: EdgeInsets.only(top: 20, left: 110, right: 110),
            height: 50,
            child: ElevatedButton(
              onPressed: _signIn,
              child: Text(
                "Sign In",
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
                    MaterialPageRoute(builder: (context) => RegisterScreen())),
                child: Text(
                  "Register Disini",
                  style:
                      TextStyle(fontWeight: FontWeight.w800, color: Colors.red),
                )),
          ),
        ],
      ),
    );
  }
}
