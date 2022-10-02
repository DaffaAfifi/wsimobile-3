import 'package:flutter/material.dart';
import 'main.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
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
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Row(
            children: <Widget>[
              const Text("Create your ", 
              style: TextStyle(
                fontSize: 25, 
                fontWeight: FontWeight.w500),),
              const Text("account", 
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: const Text("Full Name",
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
                labelText: 'Input your fullname...',),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
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
                labelText: 'Input your username...',),
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
                labelText: 'Input your password...',),
            ),
          ),
          Container(
            height: 85,
            padding: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              child: const Text("Register", style: TextStyle(fontSize: 15),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Already have an account?", style: TextStyle(fontSize: 14),),
              TextButton(
                child: const Text("Sign in", style: TextStyle(fontSize: 14),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                },
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