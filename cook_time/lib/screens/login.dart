import 'package:cook_time/future.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  double opacity = 0;
  static final loginController = TextEditingController();
  static final passwordController = TextEditingController();

  callback(double newOpacity) {
    setState(() {
      opacity = newOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 80, 129),
        centerTitle: true,
        title: Text(
          "Welcome to Cook Time",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.blue[900],
            Color(0xFF2962FF),
            Color(0xFF2962FF),
            Colors.blue[600],
            Colors.blue[500],
            Colors.blue[400],
            Color(0xFFFFFFFF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.6, 0.6, 0.7, 0.8, 0.9, 1.0],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Usuario o contraseña incorrecta",
                style: TextStyle(color: Colors.red.withOpacity(opacity)),
              ),
              TextField(
                  style: TextStyle(color: Colors.white),
                  controller: loginController,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ))),
              SizedBox(height: 10),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.lock_open,
                      color: Colors.white,
                    )),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    textColor: Colors.white,
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      newsfeed(loginController.text.toString(),
                              passwordController.text.toString())
                          .then(
                        (loginResponse) => {
                          if (loginResponse != null)
                            {
                              userForEveryone = loginController.text.toString(),
                              passwordForEveryone =
                                  passwordController.text.toString(),
                              Navigator.pushNamed(context, '/screens')
                            }
                          else
                            {callback(1)}
                        },
                      );
                    },
                    child: Text("Login", style: TextStyle(fontSize: 20.0)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
