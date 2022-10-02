import 'package:flutter/material.dart';
import 'drawer.dart';
import 'chartModel.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
            )
          ],
        ),
        drawer: DrawerScreen(),
        body: homePage(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.create, color: Colors.white,),
          backgroundColor: Colors.red.shade900,
        onPressed: (){},
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