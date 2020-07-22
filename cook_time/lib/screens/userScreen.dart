import 'dart:convert';
import 'dart:io';

import 'package:cook_time/future.dart';
import 'package:cook_time/logic/base64.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/screens/login.dart';
import 'package:flutter/material.dart';

import '../objects.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 50,
          ),
          AspectRatio(
            aspectRatio: 2,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                margin: EdgeInsets.all(SizeConfig.fixAllHor * 0.2),
                padding: EdgeInsets.all(SizeConfig.fixAllHor * 0.2),
                child: FutureBuilder<User>(
                  future: profile(userForEveryone, passwordForEveryone),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return userTop(snapshot.data);
                    } else if (snapshot.hasError) {
                      return Text("Error loading info");
                    }
                    return CircularProgressIndicator();
                  },
                )),
          ),
          SizedBox(
            height: 110,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                margin: EdgeInsets.all(SizeConfig.fixAllHor * 0.2),
                padding: EdgeInsets.all(SizeConfig.fixAllHor * 0.2),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      disabledColor: Colors.blueGrey,
                      disabledTextColor: Colors.black,
                      color: Colors.white,
                      textColor: Colors.black,
                      elevation: 5.0,
                      onPressed: () {
                        Navigator.pushNamed(context, '/editUser');
                      },
                      child: Text("Editar Perfil"),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Row userTop(User profileInfo) {
    return Row(children: [
      Column(
        children: [
          Container(
            height: SizeConfig.fixAllVer * 1.6,
            width: SizeConfig.fixAllHor * 4,
            color: Colors.blue,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.memory(base64Decode(profileInfo.imageBytes)),
            ),
          ),
          Text(
            profileInfo.name,
            textScaleFactor: SizeConfig.fixLil * 3,
            style: TextStyle(color: Colors.deepPurple),
          )
        ],
      ),
      Column(
        children: [
          Row(
            children: [
              Container(
                width: SizeConfig.fixAllHor * 0.5,
              ),
              Column(
                children: [
                  Text(profileInfo.followers != null
                      ? profileInfo.followers.length.toString()
                      : "0"),
                  Text("Seguidores"),
                ],
              ),
              Container(
                width: SizeConfig.fixAllHor * 1,
              ),
              Column(
                children: [
                  Text(profileInfo.following != null
                      ? profileInfo.following.length.toString()
                      : "0"),
                  Text("Siguiendo"),
                ],
              ),
            ],
          ),
          Container(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              disabledColor: Colors.blueGrey,
              disabledTextColor: Colors.black,
              color: Colors.white,
              textColor: Colors.black,
              elevation: 5.0,
              onPressed: () {
                Navigator.pushNamed(context, '/recipe');
              },
              child: Text("Nueva Receta"),
            ),
          ),
          Container(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              disabledColor: Colors.blueGrey,
              disabledTextColor: Colors.black,
              color: Colors.white,
              textColor: Colors.black,
              elevation: 5.0,
              onPressed: () {
                Navigator.pushNamed(context, '/businesscreator');
              },
              child: Text("Nueva Empresa"),
            ),
          ),
        ],
      ),
    ]);
  }
}
