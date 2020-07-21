import 'dart:convert';

import 'package:cook_time/future.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/screens/login.dart';
import 'package:flutter/material.dart';

import '../objects.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  static SizedBox defaultContainer() {
    return SizedBox(
        child: Container(
      margin: EdgeInsets.all(SizeConfig.fixLil * 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
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
    ));
  }

  SizedBox noResults() {
    return SizedBox(
      child: Text("No results for your search"),
    );
  }

  SizedBox enterpriseResearch(Enterprise company) {
    return SizedBox(
        height: 110,
        child: Container(
          margin: EdgeInsets.all(SizeConfig.fixLil * 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Container(
                    height: SizeConfig.fixAllVer * 0.8,
                    width: SizeConfig.fixAllHor * 2,
                    color: Colors.blue,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Icon(Icons.business, color: Colors.black),
                    )),
                onDoubleTap: () {},
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(company.enterpriseName),
                  Text(company.operationHours),
                ],
              ),
              followCompanyButton(company.enterpriseName),
            ],
          ),
        ));
  }

  SizedBox recipeResearch(Recipe recipe) {
    return SizedBox(
        height: 110,
        child: Container(
          margin: EdgeInsets.all(SizeConfig.fixLil * 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Container(
                    height: SizeConfig.fixAllVer * 0.8,
                    width: SizeConfig.fixAllHor * 2,
                    color: Colors.blue,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.memory(base64Decode(recipe.imageBytes)),
                    )),
                onDoubleTap: () {},
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(recipe.dishName),
                  Text(recipe.author),
                ],
              ),
              Text(recipe.stars.toString())
            ],
          ),
        ));
  }

  FlatButton followCompanyButton(String name) {
    String textButton = "Follow";
    return FlatButton(
      color: Colors.blue,
      textColor: Colors.white,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
        followCompany(userForEveryone, passwordForEveryone, name)
            .then((response) => {
                  if (response.statusCode == 200)
                    {
                      this.setState(() {
                        variableCont = defaultContainer();
                      })
                    }
                  else
                    {throw Exception("Error sending request")}
                });
      },
      child: Text(
        textButton,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  SizedBox profileResearch(User profile) {
    return SizedBox(
        height: 110,
        child: Container(
          margin: EdgeInsets.all(SizeConfig.fixLil * 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Container(
                    height: SizeConfig.fixAllVer * 0.8,
                    width: SizeConfig.fixAllHor * 2,
                    color: Colors.blue,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.memory(base64Decode(profile.imageBytes)),
                    )),
                onDoubleTap: () {},
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(profile.name),
                  Text(profile.email),
                ],
              ),
              followUserButton(profile.email),
            ],
          ),
        ));
  }

  FlatButton followUserButton(String email) {
    String textButton = "Follow";
    return FlatButton(
      color: Colors.blue,
      textColor: Colors.white,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
        followUser(userForEveryone, passwordForEveryone, email)
            .then((response) => {
                  if (response.statusCode == 200)
                    {
                      this.setState(() {
                        variableCont = defaultContainer();
                      })
                    }
                  else
                    {throw Exception("Error sending request")}
                });
      },
      child: Text(
        textButton,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  SizedBox variableCont = defaultContainer();
  static final searchController = TextEditingController();
  static int treeValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 201, 204, 209),
      child: Column(
        children: [
          Container(
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
            child: Column(
              children: [
                TextField(
                  style: TextStyle(
                      color: Colors.black, fontSize: SizeConfig.fixLilHor * 34),
                  controller: searchController,
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: SizeConfig.fixLil * 10),
                      border: OutlineInputBorder(),
                      hintText:
                          'Ingresa el nombre de una receta, usuario o empresa.',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                  onChanged: (text) {
                    print(text);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                        menuSearch(userForEveryone, passwordForEveryone,
                                searchController.text.toString())
                            .then((valueResp) => {
                                  if (valueResp != null)
                                    {
                                      setState(() {
                                        variableCont =
                                            recipeResearch(valueResp);
                                        treeValue = 1;
                                      })
                                    }
                                  else
                                    {
                                      setState(() {
                                        variableCont = noResults();
                                      })
                                    }
                                });
                      },
                      child: Text("Receta"),
                    ),
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
                        profileSearch(userForEveryone, passwordForEveryone,
                                searchController.text.toString())
                            .then((valueResp) => {
                                  if (valueResp != null)
                                    {
                                      setState(() {
                                        variableCont =
                                            profileResearch(valueResp);
                                        treeValue = 1;
                                      })
                                    }
                                  else
                                    {
                                      setState(() {
                                        variableCont = noResults();
                                      })
                                    }
                                });
                      },
                      child: Text("Usuario"),
                    ),
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
                        enterpriseSearch(userForEveryone, passwordForEveryone,
                                searchController.text.toString())
                            .then((valueResp) => {
                                  if (valueResp != null)
                                    {
                                      setState(() {
                                        variableCont =
                                            enterpriseResearch(valueResp);
                                        treeValue = 1;
                                      })
                                    }
                                  else
                                    {
                                      setState(() {
                                        variableCont = noResults();
                                      })
                                    }
                                });
                      },
                      child: Text("Empresa"),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: variableCont,
          ),
        ],
      ),
    );
  }
}
