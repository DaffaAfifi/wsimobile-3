import 'package:flutter/material.dart';
import 'page/dashboard.dart';
import 'page/chat.dart';
import 'page/profile.dart';
import 'page/setting.dart';


class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  int currentTab = 0;
  final List<Widget> screens = [
    Dashboard(),
    Chat(),
    Setting(),
    Profile()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen, 
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentScreen = Dashboard();
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.dashboard, color: currentTab == 0 ? Colors.blue : Colors.grey,
                    ),
                    Text("Dahsboard", style: TextStyle(color: currentTab == 0 ? Colors.blue : Colors.grey)),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentScreen = Chat();
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat, color: currentTab == 1 ? Colors.blue : Colors.grey,
                    ),
                    Text("Chat", style: TextStyle(color: currentTab == 1 ? Colors.blue : Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentScreen = Profile();
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle, color: currentTab == 2 ? Colors.blue : Colors.grey,
                    ),
                    Text("Profile", style: TextStyle(color: currentTab == 2 ? Colors.blue : Colors.grey)),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentScreen = Setting();
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings, color: currentTab == 3 ? Colors.blue : Colors.grey,
                    ),
                    Text("Settings", style: TextStyle(color: currentTab == 3 ? Colors.blue : Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          ],
        ),
        ),
      ),
    );
  }
}