import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'drawer.dart';
import 'chartModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

enum menuItem{
  item1,
  item2
}

class _homeState extends State<home> { 
  int _selectedIndex = 0;
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


  final Screen = [
    homePage(),
    storyPage(),
    callsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("IceTraeee"),
          backgroundColor: Colors.red.shade900,
          actions: <Widget>[
            Padding(padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
            ),
            new PopupMenuButton(
                onSelected: (value) {
                  if (value == menuItem.item1) {
                    Navigator.pop(context);
                    logout();
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: menuItem.item1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Color.fromARGB(255, 16, 29, 37),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Logout'),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: menuItem.item2,
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: Color.fromARGB(255, 16, 29, 37),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Settings'),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ],
        ),
        
        
        drawer: DrawerScreen(),
        body: Screen[_selectedIndex],
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.create, color: Colors.white,),
          backgroundColor: Colors.red.shade900,
        onPressed: (){},
        ),
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Story',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_sharp),
            label: 'Calls',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red.shade900,
        onTap: _onItemTapped,
      ),
      ),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (ctx, i){
      return ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(items[i].profileUrl),
        ),
        title: Text(items[i].name, style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(items[i].message),
        trailing: Text(items[i].time),
      );
    }, 
    separatorBuilder: (ctx, i){
      return Divider();
    }, itemCount: items.length
    );
  }
}

class storyPage extends StatefulWidget {
  const storyPage({Key? key}) : super(key: key);

  @override
  State<storyPage> createState() => _storyPageState();
}

class _storyPageState extends State<storyPage> {

  final List<String> gambar = [
    "me.jpeg",
    "sansa.jpg",
    "anya.jpg",
    "nayeon.jpg",
    "kylie.jpg",
    "drake.jpg",
    "gigi.jpg",
    "lebron.jpeg",
  ];
  
  static const Map<String, Color> colors = {
    '1' : Color(0xFF2DB569),
    '2' : Color(0xFFF38688),
    '3' : Color(0xFF45CAF5),
    '4' : Color(0xFFB19ECB),
    '5' : Color(0xFFF58E4C),
    '6' : Color(0xFF46C1BE),
    '7' : Color(0xFFFFEA0E),
    '8' : Color(0xFFDBE4E9),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Colors.white,
              Colors.red.shade900
            ]
          )
        ),
        child: new PageView.builder(
          controller: new PageController(viewportFraction: 0.8),
          itemCount: gambar.length,
          itemBuilder: (BuildContext context, int i) {
            return new Padding(
              padding: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
              child: new Material(
                elevation: 8.0,
                child: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Hero(
                      tag: gambar[i],
                      child: new Material(
                        child: new InkWell(
                          child: new Flexible(
                            flex: 1,
                            child: Container(
                              color: colors.values.elementAt(i),
                              child: new Image.asset(
                                "assets/images/${gambar[i]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context) =>
                              new halamanDua(
                                gambar: gambar[i],
                                colors:
                                  colors.values.elementAt(i),
                              )
                            )
                          ),
                        ),
                      ),
                    )
                  ]
                ),
              ),
            );
          }),
        );
  }
}

class halamanDua extends StatefulWidget {
  halamanDua({required this.gambar, required this.colors});
  final String gambar;
  final Color colors;

  @override
  State<halamanDua> createState() => _halamanDuaState();
}

class _halamanDuaState extends State<halamanDua> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            gradient: new RadialGradient(
              center: Alignment.center,
              colors: [Colors.black, Colors.white, Colors.red.shade900]
            )
          ),
        ),
        new Center(
          child: new Hero(tag: widget.gambar, child: new ClipOval(
            child: new SizedBox(
              width: 200.0,
              height: 200.0,
              child: new Material(
                child: new InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: new Flexible(flex: 1, child: Container(
                    color: widget.colors,
                    child: new Image.asset(
                      "assets/images/${widget.gambar}",
                      fit: BoxFit.cover,
                    ),
                  )),
                ),
              ),
            ),
          )),
        )
      ],
    );
  }
}

class callsPage extends StatefulWidget {
  const callsPage({Key? key}) : super(key: key);

  @override
  State<callsPage> createState() => _callsPageState();
}

class _callsPageState extends State<callsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Call history is empty!", style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 20,
        fontStyle: FontStyle.italic
      ),),
    );
  }
}