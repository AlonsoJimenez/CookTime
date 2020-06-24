import 'package:flutter/material.dart';

void main() => runApp(login());

class login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Cook Time",
      home: Scaffold(appBar: AppBar(
        title: Text("Welcome to Cook Time"),
      ),
      body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [
        Color(0xFF2962FF),
        Color(0xFF2962FF),
        Color(0xFFFFFFFF),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.1, 0.5, 0.9],)), child: Center(
      child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          TextField(obscureText: false, decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Email', prefixIcon: Icon(Icons.email, color: Colors.white,))),
          SizedBox(height: 10),
          TextField(obscureText: true, decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Password', prefixIcon: Icon(Icons.lock, color: Colors.white,)),),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
             FlatButton(textColor: Colors.white, splashColor: Colors.blueAccent,onPressed: () {
              /*...*/
            },
            child: Text("Create an account",style: TextStyle(fontSize: 20.0),),),
            FlatButton(color: Colors.blue, textColor: Colors.white, padding: EdgeInsets.all(8.0),splashColor: Colors.blueAccent,onPressed: () {
              /*...*/
            },
            child: Text("Login",style: TextStyle(fontSize: 20.0)),)
          ],
          ),
          ],
          ),
        ) ,)
      
      ),
      );
  }
}

