import 'dart:convert';

import 'package:cook_time/future.dart';
import 'package:cook_time/logic/base64.dart';
import 'package:cook_time/screens/businessCreatorScreen.dart';
import 'package:cook_time/screens/login.dart';
import 'package:cook_time/screens/notificationScreen.dart';
import 'package:cook_time/screens/recipeScreen.dart';
import 'package:cook_time/screens/searchScreen.dart';
import 'package:cook_time/screens/signInScreen.dart';
import 'package:cook_time/screens/userScreen.dart';
import 'package:flutter/material.dart';
import 'package:cook_time/screens/newsfeed.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:cook_time/logic/sizeConfig.dart';

import '../objects.dart';

class TabBView extends StatefulWidget {
  @override
  State<TabBView> createState() => TabBViewState();
}

class TabBViewState extends State<TabBView> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([
      //Its okay if there is nothing here :)
    ]);
  }

  Future<bool> _onBackPressed() {
    return Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    String temp;

    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Material(
          child: DefaultTabController(
            length: 5,
            child: Scaffold(
              appBar: AppBar(
                elevation: 5.0,
                centerTitle: true,
                title: Text(
                  "CookTime!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              bottomNavigationBar: bottomTabBar(),
              body: TabBarView(
                children: [
                  //Aquï como hijos se ponen los widgets de cada pantalla (Pueden crearse en otra clase=
                  NewsScreen(),
                  SearchScreen(),
                  NotificationScreen(),
                  UserScreen(),
                  BusinessCreatorScreen(),
                ],
              ),
            ),
          ),
        ));
  }

  Container bottomTabBar() {
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
          Tab(icon: Icon(Icons.business, color: Colors.black)),
        ],
      ),
    );
  }
}
