import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(login());

// ignore: camel_case_types
class login extends StatelessWidget {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Future<http.Response> fetchUser(String username, String password) {
    return http.get("http://10.0.2.2:9080/CookTimeServer/rest/login?username=" +
        username +
        "&password=" +
        password);
  }

  Widget popUpProblem(BuildContext context, String problem) {
    return AlertDialog(
      title: Text(problem),
      shape: CircleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Cook Time",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Welcome to Cook Time"),
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
              stops: [0.1, 0.3, 0.4, 0.6, 0.7, 0.8, 0.99],
            )),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.lock,
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
                        onPressed: () {},
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
                          fetchUser(
                                  loginController.text, passwordController.text)
                              .then((value) {
                            if (value.statusCode == 200) {
                            } else {
                              showDialog(
                                  context: context,
                                  builder: popUpProblem(
                                      context, "Invalid user or password"));
                            }
                            ;
                          });
                        },
                        child: Text("Login", style: TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
