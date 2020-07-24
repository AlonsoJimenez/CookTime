import 'dart:convert';
import 'package:cook_time/future.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/screens/companyList.dart';
import 'package:cook_time/screens/reusableWidgets.dart';
import 'package:flutter/material.dart';
import '../objects.dart';

Enterprise visitMyCompany;

class BusinessAdmScreen extends StatefulWidget {
  @override
  State<BusinessAdmScreen> createState() => BusinessAdmScreenState();
}

class BusinessAdmScreenState extends State<BusinessAdmScreen> {
  TextEditingController addController;
  var memberContainers = List<Widget>();
  double opacity = 0;

  List<String> mem;

  ///Inicia los contenedores para miembros en la empresa privada.
  void initContainers() {
    enterpriseSearch(userForEveryone, passwordForEveryone, companySearch)
        .then((value) => {
              if (value != null)
                {
                  mem = value.members,
                  if (memberContainers.length == 0)
                    {
                      for (int x = 0; x < mem.length; x++)
                        {
                          memberContainers.add(Container(
                            padding: EdgeInsets.all(SizeConfig.fixLil * 15),
                            margin: EdgeInsets.all(SizeConfig.fixLil * 10),
                            width: SizeConfig.fixAllHor * 8,
                            decoration: ReusableWidgets.blueBoxDecoration(),
                            child: Text(
                              mem[x],
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                        }
                    }
                }
            });
  }

  ///Constructor de la página de empresa privada.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    initContainers();

    return FutureBuilder<Enterprise>(
      future:
          enterpriseSearch(userForEveryone, passwordForEveryone, companySearch),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Material(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: ReusableWidgets.genericBoxDecoration(),
                    padding: EdgeInsets.all(SizeConfig.fixLil * 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(SizeConfig.fixLil * 30),
                          height: SizeConfig.fixAllVer * 3,
                          width: SizeConfig.fixAllHor * 6,
                          color: Colors.blue,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            //REMPLAZAR CON IMAGEN DEL REST API
                            child: snapshot.data.imageBytes != null
                                ? Image.memory(
                                    base64Decode(snapshot.data.imageBytes))
                                : null,
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            //REMPLAZAR EL "68" CON INFO REST API
                            ReusableWidgets.infoContainer("Seguidores:",
                                snapshot.data.followers.length.toString()),

                            //REMPLAZAR EL "68" CON INFO REST API
                            ReusableWidgets.infoContainer("Miembros:",
                                snapshot.data.members.length.toString()),

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
                                  print("Ver ubicación presionado");
                                });
                              },
                              child: Text("Ver ubicación"),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),

                  //
                  //CAMBIAR CON EL NOMBRE DE LA EMPRESA
                  ReusableWidgets.categoryContainer(
                      snapshot.data.enterpriseName),

                  //CAMBIAR CORREO CON LA INFO REAL DEL API
                  ReusableWidgets.infoContainer(
                      "Contacto:", snapshot.data.contactInfo),

                  //CAMBIAR EL HORARIO CON LA INFO REAL DEL API
                  ReusableWidgets.infoContainer(
                      "Horario:", snapshot.data.operationHours),

                  Container(
                    width: SizeConfig.fixAllHor * 9.65,
                    decoration: ReusableWidgets.genericBoxDecoration(),
                    child: Column(
                      children: [
                        ReusableWidgets.categoryContainer("Miembros:"),
                        Column(
                          children: memberContainers,
                        ),
                        Container(
                          decoration: ReusableWidgets.genericBoxDecoration(),
                          margin: EdgeInsets.all(SizeConfig.fixLilHor * 15),
                          padding: EdgeInsets.all(SizeConfig.fixLilHor * 10),
                          child: Column(
                            children: [
                              ReusableWidgets.textFormFieldCreator(
                                  addController,
                                  "Ingresa un correo para añadir un nuevo miembro"),
                              Text("Correo no encontrado",
                                  style: TextStyle(
                                      color: Colors.redAccent
                                          .withOpacity(opacity))),
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
                                    //AQUI HAY QUE HACER UN IF QUE VALIDE SI EL USUARIO SE ENCONTRO O NO
                                    if (opacity == 0) {
                                      opacity = 1;
                                    } else {
                                      opacity = 0;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 400,
                      child: Expanded(
                          child: Container(
                              height: 350,
                              child: FutureBuilder<List<Recipe>>(
                                future: ownCompany(
                                    userForEveryone,
                                    passwordForEveryone,
                                    snapshot.data.enterpriseName),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return getMenu(snapshot.data);
                                  } else if (snapshot.hasError) {
                                    return Text("Error loading");
                                  }
                                  return CircularProgressIndicator();
                                },
                              ))))
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error loading  company");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Container getMenu(List<Recipe> recipes) {
    List<Widget> addToNews = new List<Widget>();
    if (recipes.length != 0) {
      for (Recipe recipe in recipes) {
        addToNews.add(menu(recipe));
        addToNews.add(SizedBox(height: 20));
      }
      return Container(
          child: ListView(
        children: addToNews,
      ));
    } else {
      return Container(
          child: ListView(children: [
        SizedBox(
          child: Text("No recipes to show"),
          height: 110,
        )
      ]));
    }
  }

  SizedBox menu(Recipe recipe) {
    return SizedBox(
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
            onDoubleTap: () {
              deleteRecipe(
                      userForEveryone, passwordForEveryone, recipe.dishName)
                  .then((response) => {
                        if (response.statusCode == 200)
                          {Navigator.pushNamed(context, '/screens')}
                        else
                          {throw Exception("Error deleting info")}
                      });
            },
          ),
          Text(recipe.dishName),
        ],
      ),
    );
  }
}
