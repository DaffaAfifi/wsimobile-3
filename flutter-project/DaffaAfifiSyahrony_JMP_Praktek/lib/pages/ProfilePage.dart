import 'package:flutter/material.dart';
import 'package:login_sqflite/hive/database.dart';
import 'package:login_sqflite/pages/HomePage.dart';
import '../drawer/Drawer.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Colors.red,
        ),
        drawer: DrawerScreen(),
        body: ProfilePage(),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserHiveDatabase uhd = UserHiveDatabase();
  TextEditingController unameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    uhd.loadDB();
    getUser();
    super.initState();
  }

  void getUser() {
    setState(() {
      unameController.text = uhd.users[uhd.userId! - 1][1];
      nameController.text = uhd.users[uhd.userId! - 1][3];
      phoneController.text = uhd.users[uhd.userId! - 1][4];
    });
  }

  void setUser() {
    print("${uhd.users} ${uhd.userId}");
    uhd.users[uhd.userId! - 1][1] = unameController.text;
    uhd.users[uhd.userId! - 1][3] = nameController.text;
    uhd.users[uhd.userId! - 1][4] = phoneController.text;
    uhd.updateDB();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Data berhasil di update!"))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Edit your profile!",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22, color: Colors.red),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              "Username",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: unameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Fullname",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Phone",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 30),
            child: TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 110, right: 110),
            height: 50,
            child: ElevatedButton(
              onPressed: (){
                setUser();
              },
              child: Text(
                "Update",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
