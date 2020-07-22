import 'dart:convert';
import 'dart:io';

import 'package:cook_time/future.dart';
import 'package:cook_time/logic/base64.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/screens/login.dart';
import 'package:flutter/material.dart';

import '../objects.dart';

User toShow;

class PublicUserScreen extends StatefulWidget {
  @override
  State<PublicUserScreen> createState() => PublicUserState();
}

class PublicUserState extends State<PublicUserScreen> {
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
              child: Image.memory(base64Decode(toShow.imageBytes)),
            ),
          ),
          Text(
            toShow.name,
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
                  Text(toShow.followers != null
                      ? toShow.followers.length.toString()
                      : "0"),
                  Text("Seguidores"),
                ],
              ),
              Container(
                width: SizeConfig.fixAllHor * 1,
              ),
              Column(
                children: [
                  Text(toShow.following != null
                      ? toShow.following.length.toString()
                      : "0"),
                  Text("Siguiendo"),
                ],
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}