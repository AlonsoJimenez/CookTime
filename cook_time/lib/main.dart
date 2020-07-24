import 'package:cook_time/screens/BusinessAdmScreen.dart';
import 'package:cook_time/screens/businessCreatorScreen.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:cook_time/screens/mapSelectorScreen.dart';
=======
>>>>>>> parent of 8e7d7cd... Cambios para cargar vista empresa
=======
>>>>>>> parent of 8e7d7cd... Cambios para cargar vista empresa
import 'package:cook_time/screens/recipeScreen.dart';
import 'package:cook_time/screens/recipeViewScreen.dart';
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
      initialRoute: '/businessAdm',

      routes: {
        '/screens': (context) => TabBView(),
        '/login': (context) => Login(),
        '/signin': (context) => SignInScreen(),
        '/recipe': (context) => Material(child: RecipeScreen()),
        '/businesscreator': (context) => Material(
              child: BusinessCreatorScreen(),
            ),
        '/recipeviewer': (context) => RecipeViewScreen(),
<<<<<<< HEAD
<<<<<<< HEAD
        '/businessAdm': (context) => BusinessAdmScreen(),
        '/mapSelector': (context) => MapSelectorScreen(),
=======
        '/businessAdm': (context) => BusinessAdmScreen()
>>>>>>> parent of 8e7d7cd... Cambios para cargar vista empresa
=======
        '/businessAdm': (context) => BusinessAdmScreen()
>>>>>>> parent of 8e7d7cd... Cambios para cargar vista empresa
      },
    );
  }
}
