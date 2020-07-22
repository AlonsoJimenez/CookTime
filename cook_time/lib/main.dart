import 'package:cook_time/screens/businessCreatorScreen.dart';
import 'package:cook_time/screens/publicUserScreen.dart';
import 'package:cook_time/screens/recipeScreen.dart';
import 'package:cook_time/screens/signInScreen.dart';
import 'package:flutter/material.dart';

import 'package:cook_time/screens/tabBView.dart';
import 'package:cook_time/screens/login.dart';

import 'screens/userEditScreen.dart';

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
      initialRoute: '/login',
      routes: {
        '/recipe': (context) => Material(child: RecipeScreen()),
        '/user': (context) => Material(child: PublicUserScreen()),
        '/editUser': (context) => Material(child: UserEditScreen()),
        '/screens': (context) => TabBView(),
        '/login': (context) => Login(),
        '/signin': (context) => SignInScreen(),
        '/businesscreator': (context) => Material(
              child: BusinessCreatorScreen(),
            ),
      },
    );
  }
}
