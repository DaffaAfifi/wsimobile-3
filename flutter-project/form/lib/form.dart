import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    title: "Belajar Form Flutter",
    home: BelajarForm(),
  ));
}

class BelajarForm extends StatefulWidget {
  const BelajarForm({Key? key}) : super(key: key);

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formkey = GlobalKey<FormState>();
  double nilaiSLider = 1;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Form Flutter"),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Daffa Afifi Syahrony",
                  labelText: "Fullname",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)
                  ),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Name musn't be empty";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    labelText: "Password",
                    icon: Icon(Icons.security),
                    border: OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Password musn't be empty";
                    }
                    return null;
                  },
                ),
              ),
              CheckboxListTile(
                title: Text("Belajar Dasar Flutter"),
                subtitle: Text("Dart, widget, http"),
                value: nilaiCheckBox,
                activeColor: Colors.deepPurpleAccent, 
                onChanged: (value) {
                  setState(() {
                    nilaiCheckBox = value!;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Backend Programming"),
                subtitle: Text("Dart NodeJs, PHP, Java, dll"),
                value: nilaiSwitch,
                activeTrackColor: Colors.pink,
                activeColor: Colors.red, 
                onChanged: (value) {
                  setState(() {
                    nilaiSwitch = value;
                  });
                },
              ),
              Slider(
                value: nilaiSLider,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    nilaiSLider = value;
                  });
                },
              ),
              RaisedButton(
                child: Text("Submit", style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                  if(_formkey.currentState!.validate()){}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}