import 'package:flutter/material.dart';
import 'register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

void main(List<String> args) {
  runApp(login());
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoggedIn = false;
  String name = '';

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('username');

    if (userId != null && userId == 'Admin') {
      setState(() {
        isLoggedIn = true;
        name = userId;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                image: new DecorationImage(image: ExactAssetImage('assets/images/logo.jpg'),
                fit: BoxFit.fitHeight,
                alignment: Alignment.topLeft),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: const Text("Proceed with your",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: const Text("Login",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: const Text("Username",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your username...',),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: const Text("Password",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password...',),
              ),
            ),
            Container(
              height: 85,
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                child: const Text("Login", style: TextStyle(fontSize: 15),),
                onPressed: (){
                  String uname = nameController.text;
                  String pass = passwordController.text;
                  if(uname == "Admin" && pass == "Admin"){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Selamat Datang Admin"))
                    );
                    addStringToSF(uname);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Username atau password salah"))
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Does not have account?", style: TextStyle(fontSize: 14),),
                TextButton(
                  child: const Text("Sign up", style: TextStyle(fontSize: 14),),
                  onPressed: ()=>
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>register())),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.red.shade900),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}

addStringToSF(String value) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', value);
}

getStringValueSF() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('username');
  return userId;
}
