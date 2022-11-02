import 'package:flutter/material.dart';
import '../pages/LoginPage.dart';
import '../pages/HomePage.dart';
import '../pages/DahsboardPage.dart';
import '../pages/ProfilePage.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: Text(""),
            ),
          DrawerListTile(
            icondata : Icons.home,
            title : "Home",
            onTilePressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())),
          ),
          DrawerListTile(
            icondata : Icons.person,
            title : "Profile",
            onTilePressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen())),
          ),
          DrawerListTile(
            icondata : Icons.dashboard,
            title : "Dashboard",
            onTilePressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen())),
          ),
          DrawerListTile(
            icondata: Icons.logout, 
            title: "Logout", 
            onTilePressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget{
  final IconData icondata;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile({Key? key, required this.icondata, required this.title, required this.onTilePressed})
  :super(key: key);
  @override
  Widget build(BuildContext context){
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(icondata),
      title: Text(title, style: TextStyle(fontSize: 14),),
    );
  }
}