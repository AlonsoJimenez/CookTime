import 'dart:convert';
import 'package:cook_time/future.dart';
import 'package:cook_time/logic/base64.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/screens/reusableWidgets.dart';
import 'package:flutter/material.dart';
import '../objects.dart';

Recipe toVisit;

class RecipeViewScreen extends StatefulWidget {
  @override
  State<RecipeViewScreen> createState() => RecipeViewScreenState();
}

class RecipeViewScreenState extends State<RecipeViewScreen> {
  String base64 = Base64.base64s;
  var stepsContainers = List<Widget>();
  var ingredientContainers = List<Widget>();
  var commentsContainers = List<Widget>();

  static final TextEditingController commentController =
      new TextEditingController();

  double stars = 0;

  ///Strings base para los TextFormField de la página de Vista de Recetas.
  List base = [
    "Nombre de la receta: ",
    "Tipo de plato: ",
    "Porcion: ",
    "Tiempo: ",
    "Dificultad: ",
    "Tags por dieta: ",
    "Precio: "
  ];

  List steps = toVisit.steps;

  List ingredients = toVisit.ingridients;

  List comments = toVisit.comments;

  ///Inicia los contenedores por cada paso, ingrediente y comentario en la receta.
  void initContainers() {
    if (stepsContainers.length == 0) {
      for (int x = 0; x < steps.length; x++) {
        stepsContainers.add(ReusableWidgets.infoContainer(
            "Paso " + (x + 1).toString(), steps[x]));
      }
    }

    if (ingredientContainers.length == 0) {
      for (int x = 0; x < ingredients.length; x++) {
        ingredientContainers.add(ReusableWidgets.infoContainer(
            "Ingrediente " + (x + 1).toString(), ingredients[x]));
      }
    }
    if (commentsContainers.length == 0) {
      for (int x = 0; x < comments.length; x++) {
        commentsContainers.add(ReusableWidgets.infoContainer(
            ReusableWidgets.divider(comments[x], true),
            ReusableWidgets.divider(comments[x], false)));
      }
    }
  }

  ///Constructor de la página de vista de Recetas.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    initContainers();

    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.fixAllVer * 4,
              width: SizeConfig.fixAllVer * 6.2,
              margin: EdgeInsets.only(
                  right: SizeConfig.fixLil * 80,
                  top: SizeConfig.fixLil * 80,
                  left: SizeConfig.fixLil * 80),
              color: Colors.blue,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.memory(base64Decode(base64)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  right: SizeConfig.fixLilHor * 54,
                  left: SizeConfig.fixLilHor * 54),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.star_border, color: Colors.blueAccent),
                        //REMPLAZAR LA STRING CON EL VALOR DEL API
                        Text(toVisit.stars.toString())
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.blueAccent,
                      ),
                      //REMPLAZAR LA STRING CON EL VALOR DEL API
                      Text(toVisit.preparationMinutes.toString() + "m"),
                    ],
                  ),
                ],
              ),
            ),
            //Aquí cambie las Strings por el valor real según orden (véase la lista "Base" para el orden)
            ReusableWidgets.infoContainer(base[0], toVisit.dishName),
            ReusableWidgets.infoContainer(base[1], toVisit.dishType),
            ReusableWidgets.infoContainer(
                base[2], toVisit.portionsSize.toString()),
            ReusableWidgets.infoContainer(
                base[4], toVisit.difficulty.toString()),
            ReusableWidgets.infoContainer(base[5], "Vegano"),
            ReusableWidgets.infoContainer(base[6], toVisit.price.toString()),
            //

            ReusableWidgets.categoryContainer("Ingredientes:"),
            Column(children: ingredientContainers),
            ReusableWidgets.categoryContainer("Pasos:"),
            Column(children: stepsContainers),

            ReusableWidgets.categoryContainer("Comentarios:"),
            Column(children: commentsContainers),

            ReusableWidgets.categoryContainer("¡Puntúa y Comenta aquí abajo!"),
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
              child: Column(
                children: [
                  Text("Puntúa de 0 a 5:"),
                  Slider(
                    value: stars,
                    divisions: 5,
                    min: 0,
                    max: 5,
                    onChanged: (value) {
                      setState(() {
                        stars = value;
                      });
                    },
                    label: stars.toInt().toString(),
                  ),
                  RaisedButton(
                    disabledColor: Colors.blueGrey,
                    disabledTextColor: Colors.black,
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    elevation: 5.0,
                    onPressed: () {
                      newRate(userForEveryone, passwordForEveryone,
                              toVisit.dishName, stars)
                          .then((value) => {
                                if (value.statusCode == 200)
                                  {Navigator.pushNamed(context, '/screens')}
                                else
                                  {throw Exception("Error rating")}
                              });
                    },
                    child: Text("Calificar"),
                  ),
                  TextFormField(
                    controller: commentController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          right: SizeConfig.fixLil * 15,
                          left: SizeConfig.fixLil * 15),
                      border: OutlineInputBorder(),
                      hintText: "Comenta",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  RaisedButton(
                    disabledColor: Colors.blueGrey,
                    disabledTextColor: Colors.black,
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    elevation: 5.0,
                    onPressed: () {
                      newComment(
                              userForEveryone,
                              passwordForEveryone,
                              toVisit.dishName,
                              userForEveryone +
                                  ":" +
                                  commentController.text.toString())
                          .then((value) => {
                                if (value.statusCode == 200)
                                  {Navigator.pushNamed(context, '/screens')}
                                else
                                  {throw Exception("Error commenting recipe")}
                              });
                    },
                    child: Text("Comentar"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
