import 'package:flutter/material.dart';
import 'package:icetraee/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  bool isLoggedIn = true;
  String name = '';

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', '');

    setState(() {
      name = '';
      isLoggedIn = false;
      Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Daffa Afifi Syahrony"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/me.jpeg")
            ),
            accountEmail: Text("afifidaffa16@gmail.com"),
              decoration: BoxDecoration(color: Color(0xFFB71C1C),)
            ),
          DrawerListTile(
            icondata : Icons.contacts,
            title : "Contacts",
            onTilePressed: (){},
          ),
          DrawerListTile(
            icondata : Icons.bookmark_border,
            title : "Saved message",
            onTilePressed: (){},
          ),
          DrawerListTile(
            icondata : Icons.phone,
            title : "Calls",
            onTilePressed: (){},
          ),
          DrawerListTile(
            icondata: Icons.logout, 
            title: "Log Out", 
            onTilePressed: (){
                Navigator.pop(context);
                logout();
            },
          ),
        ],
      ),
    );
  }
  getdataSharedPref() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String data = preferences.getString("Username").toString();
    print("data dari sharedpref $data");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("data dari sharedpref $data"))
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
      title: Text(title, style: TextStyle(fontSize: 16),),
    );
  }
}