import 'package:cook_time/screens/companyList.dart';
import 'package:cook_time/screens/notificationScreen.dart';
import 'package:cook_time/screens/searchScreen.dart';
import 'package:cook_time/screens/userScreen.dart';
import 'package:flutter/material.dart';
import 'package:cook_time/screens/newsfeed.dart';
import 'package:flutter/services.dart';
import 'package:cook_time/logic/sizeConfig.dart';

class TabBView extends StatefulWidget {
  @override
  State<TabBView> createState() => TabBViewState();
}

class TabBViewState extends State<TabBView> {
  ///Metodo que prohíbe la pantalla en posición Landscape (horizontal)
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

  ///Futuro para volver a la página LogIn al presionar el botón back.
  Future<bool> _onBackPressed() {
    return Navigator.pushNamed(context, '/login');
  }

  ///Constructor de la página Tabview.
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
                  CompaniesList(),
                ],
              ),
            ),
          ),
        ));
  }

  ///Constructor de la BottomTabBar que permite cambiar entre pestañas en el TabView.
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
