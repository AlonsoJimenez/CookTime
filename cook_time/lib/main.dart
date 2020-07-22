import 'package:cook_time/screens/businessCreatorScreen.dart';
import 'package:cook_time/screens/recipeScreen.dart';
import 'package:cook_time/screens/signInScreen.dart';
import 'package:flutter/material.dart';

import 'package:cook_time/screens/tabBView.dart';
import 'package:cook_time/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook Time!',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      //initialRoute: '/login',
      //initialRoute: '/screens',
      initialRoute: '/businesscreator',
      routes: {
        '/screens': (context) => TabBView(),
        '/login': (context) => Login(),
        '/signin': (context) => SignInScreen(),
        '/recipe': (context) => RecipeScreen(),
        '/businesscreator': (context) => Material(
              child: BusinessCreatorScreen(),
            ),
      },
    );
  }
}
