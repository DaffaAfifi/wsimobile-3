import 'dart:ui';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> agama = [
    "Islam",
    "Kristen Protestan",
    "Kristen Katolik",
    "Hindu",
    "Budha"
  ];

  String _agama = "Islam";

  String _jk = "";

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerMoto = new TextEditingController();

  void _pilihJk(String value){
    setState(() {
      _jk = value;
    });
  }

  void pilihAgama(String value){
    setState(() {
      _agama = value;
    });
  }

  void kirimdata(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Fullname : ${controllerNama.text}"),
            new Text("Password : ${controllerPass.text}"),
            new Text("Moto Hidup : ${controllerMoto.text}"),
            new Text("Jenis Kelamin : ${_jk}"),
            new Text("Agama : ${_agama}"),
            new RaisedButton(
              child: new Text("OK"),
              onPressed: () => Navigator.pop(context),
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Ident"),
        backgroundColor: Colors.teal,
      ),
      body: new ListView(
        children: [
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Fullname",
                    labelText: "Fullname",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    ),
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 20.0),),
                new TextField(
                  controller: controllerPass,
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 20.0),),
                new TextField(
                  controller: controllerMoto,
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Life Moto",
                    labelText: "Life Moto",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                  new Padding(padding: new EdgeInsets.only(top: 20.0),
                ),
                new RadioListTile(
                  value: "Male", 
                  title: new Text("Male"),
                  groupValue: _jk, 
                  onChanged: (String? value){
                    _pilihJk(value!);
                  },
                  activeColor: Colors.blue,
                  subtitle: new Text("Select this if you are a male"), 
                ),
                new RadioListTile(
                  value: "Female", 
                  title: new Text("Female"),
                  groupValue: _jk, 
                  onChanged: (String? value){
                    _pilihJk(value!);
                  },
                  activeColor: Colors.blue,
                  subtitle: new Text("Select this if you are a female"), 
                ),
                  new Padding(padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                      new Text("Religion ", style: TextStyle(fontSize: 18.0, color: Colors.blue),
                    ),
                    new Padding(padding: new EdgeInsets.only(left: 15.0),),
                    DropdownButton(
                      onChanged: (String? value) {
                        pilihAgama(value!);
                      },
                      value: _agama,
                      items: agama.map((String value){
                        return new DropdownMenuItem(value: value, child: new Text(value),);
                      }).toList(),
                    ),
                  ],
                ),
                new RaisedButton(
                  child: new Text("OK"),
                  color: Colors.blue,
                  onPressed: () {
                    kirimdata();
                  }
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}