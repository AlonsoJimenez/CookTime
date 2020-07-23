import 'dart:convert';
import 'package:cook_time/future.dart';
import 'package:cook_time/screens/login.dart';
import 'package:cook_time/screens/recipeViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cook_time/logic/sizeConfig.dart';
import '../objects.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
          ),
          margin: EdgeInsets.all(SizeConfig.fixLil * 25),
          padding: EdgeInsets.all(SizeConfig.fixLil * 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                disabledColor: Colors.blueGrey,
                disabledTextColor: Colors.black,
                color: Colors.blueAccent,
                textColor: Colors.white,
                elevation: 5.0,
                onPressed: () {
                  setState(() {
                    print("Ordenar Newsfeed pres");
                  });
                },
                child: Text("Fecha"),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                disabledColor: Colors.blueGrey,
                disabledTextColor: Colors.black,
                color: Colors.blueAccent,
                textColor: Colors.white,
                elevation: 5.0,
                onPressed: () {
                  setState(() {
                    print("Ordenar Newsfeed pres");
                  });
                },
                child: Text("Estrellas"),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                disabledColor: Colors.blueGrey,
                disabledTextColor: Colors.black,
                color: Colors.blueAccent,
                textColor: Colors.white,
                elevation: 5.0,
                onPressed: () {
                  setState(() {
                    print("Ordenar Newsfeed pres");
                  });
                },
                child: Text("Dificultad"),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
                alignment: Alignment.center,
                child: FutureBuilder<List<Recipe>>(
                  future: newsfeed(userForEveryone, passwordForEveryone),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return gettingNews(snapshot.data, context);
                    } else if (snapshot.hasError) {
                      return Text("No news");
                    }
                    return CircularProgressIndicator();
                  },
                ))),
      ],
    );
  }
}

ListView gettingNews(List<Recipe> recipes, context) {
  List<Widget> addToNews = new List<Widget>();
  if (recipes.length != 0) {
    for (Recipe recipe in recipes) {
      addToNews.add(SizedBox(height: 20));
      addToNews.add(news(recipe, context));
    }
    return ListView(
      children: addToNews,
    );
  } else {
    return ListView(
        children: <Widget>[Text("No news to show"), Text("Get some friend")]);
  }
}

Container news(Recipe recipe, BuildContext context) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
            ),
            Text(
              recipe.author,
              softWrap: true,
              style: TextStyle(color: Colors.deepPurple),
              textScaleFactor: SizeConfig.fixLil * 3,
            ),
          ],
        ),
        GestureDetector(
            onDoubleTap: () {
              toVisit = recipe;
              Navigator.pushNamed(context, '/recipeviewer');
            },
            child: AspectRatio(
                aspectRatio: 24 / 18,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.memory(base64Decode(
                      recipe.imageBytes != null ? recipe.imageBytes : null)),
                ))),
        AspectRatio(
            aspectRatio: 22 / 2,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 2 / 8,
                ),
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_border,
                        color: Colors.blueAccent,
                      ),
                      Text(
                        recipe.stars != null ? recipe.stars.toString() : null,
                        textScaleFactor: SizeConfig.fixLil * 4,
                      ),
                    ],
                  ),
                ),
                AspectRatio(
                  aspectRatio: 2 / 8,
                ),
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Row(
                    children: [
                      Icon(
                        Icons.comment,
                        color: Colors.blueAccent,
                      ),
                      Text(
                        recipe.comments.toString(),
                        textScaleFactor: SizeConfig.fixLil * 4,
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.blueAccent,
                      ),
                      Text(
                        recipe.preparationMinutes.toString() + " m.",
                        textScaleFactor: SizeConfig.fixLil * 4,
                      ),
                    ],
                  ),
                ),
                AspectRatio(
                  aspectRatio: 2 / 8,
                ),
              ],
            )),
        AspectRatio(
          aspectRatio: 28 / 4,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2 / 9,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: AspectRatio(
                    aspectRatio: 10 / 12,
                    child: FittedBox(
                      //alignment: Alignment.topLeft,
                      fit: BoxFit.fitWidth,
                      child: Column(
                        children: [
                          Icon(
                            Icons.restaurant_menu,
                          ),
                          Text(
                            "Receta:",
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  )),
              AspectRatio(
                aspectRatio: 1 / 10,
              ),
              AspectRatio(
                aspectRatio: 1 / 30,
                child: Container(
                  color: Colors.blueAccent,
                ),
              ),
              AspectRatio(
                aspectRatio: 1 / 10,
              ),
              Flexible(
                child: Text(
                  recipe.dishName,
                  softWrap: true,
                  textScaleFactor: SizeConfig.fixLil * 3, //*style: TextStyle(),
                ),
              ),
              AspectRatio(
                aspectRatio: 2 / 8,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
