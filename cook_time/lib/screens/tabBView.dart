import 'dart:convert';

import 'package:cook_time/logic/base64.dart';
import 'package:cook_time/screens/notificationScreen.dart';
import 'package:cook_time/screens/searchScreen.dart';
import 'package:cook_time/screens/signInScreen.dart';
import 'package:cook_time/screens/userScreen.dart';
import 'package:flutter/material.dart';
import 'package:cook_time/screens/newsfeed.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:cook_time/logic/sizeConfig.dart';

class TabBView extends StatefulWidget {
  @override
  State<TabBView> createState() => TabBViewState();
}

class TabBViewState extends State<TabBView> {
  static double treeValue = 0;

  callback(newTreeValue) {
    setState(() {
      treeValue = newTreeValue;
    });
  }

  Future<http.Response> fetchUser() {
    //return http.get("http://10.0.2.2:3000/recipe");
    //return http.get("https://jsonplaceholder.typicode.com/posts/1");
    return http.get("http://localhost:3000/recipe");
  }

  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([
      //Its okay if there is nothing here :)
    ]);
  }

  Future<bool> _onBackPressed(){
    return Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    String temp;
    fetchUser().then((value) => {
      temp = value.body
      //print(Newsfeed().breteador(value.body, "base64"))
    });

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Material(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              elevation: 5.0,
              centerTitle: true,
              title: Text("CookTime!", style: TextStyle(color: Colors.white),),
            ),
            bottomNavigationBar: bottomTabBar(),
            body: TabBarView(
              children: [
                //Aquï como hijos se ponen los widgets de cada pantalla (Pueden crearse en otra clase=
                Container(
                  color: Colors.white,
                  child: Newsfeed().news(Base64.base64s, "4.6", "13", "Juanito", "Pan de muerto", "135")
                ),
                SearchScreen(),
                NotificationScreen(),
                UserScreen(),
                Container(color: Colors.yellowAccent,),
              ],
            ),
          ),
        ),
      )
    );
  }


  Container bottomTabBar(){
    return Container(
      child: TabBar(
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            icon: Icon(Icons.restaurant_menu, color: Colors.black),
          ),
          Tab(
            icon: Icon(Icons.search, color: Colors.black),
          ),
          Tab(
            icon: Icon(Icons.notifications, color: Colors.black),
          ),
          Tab(
            icon: Icon(Icons.person, color: Colors.black),
          ),
          Tab(
              icon: Icon(Icons.business, color: Colors.black)
          ),
        ],
      ),
    );
  }
}