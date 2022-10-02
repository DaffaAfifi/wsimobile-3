import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawerScreen extends StatefulWidget{
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Daffa Afifi Syahrony"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/me.jpeg")
            ),
            accountEmail: Text("afifidaffa16@gmail.com"),
            ),
          DrawerListTile(
            icondata : Icons.group,
            title : "NewGroup",
            onTilePressed: (){},
          ),
          DrawerListTile(
            icondata : Icons.lock,
            title : "New Secret Group",
            onTilePressed: (){},
          ),
          DrawerListTile(
            icondata : Icons.notifications,
            title : "New Channel Chat",
            onTilePressed: (){},
          ),
          DrawerListTile(
            icondata : Icons.contacts,
            title : "contacts",
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
          )
        ],
      )
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