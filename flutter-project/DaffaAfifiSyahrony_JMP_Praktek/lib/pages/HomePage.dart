import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_sqflite/hive/database.dart';
import '../drawer/Drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Home"),
          backgroundColor: Colors.red,
        ),
        drawer: DrawerScreen(),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserHiveDatabase uhd = UserHiveDatabase();
  var text = "Nama";

void _getUsername(){
  setState(() {
    text = uhd.users[uhd.userId! - 1][3];
  });
}

  @override
  void initState() {
    uhd.loadDB();
    _getUsername();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Selamat Datang",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.red
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}