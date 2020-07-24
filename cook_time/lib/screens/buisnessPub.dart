import 'dart:convert';
import 'package:cook_time/future.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/screens/reusableWidgets.dart';
import 'package:cook_time/screens/searchScreen.dart';
import 'package:flutter/material.dart';
import '../objects.dart';

Enterprise vivitYourCompany;

class PublicCompany extends StatefulWidget {
  @override
  State<PublicCompany> createState() => PublicCompanyState();
}

class PublicCompanyState extends State<PublicCompany> {
  TextEditingController addController;
  var memberContainers = List<Widget>();
  double opacity = 0;

  List<String> mem;

  void initContainers() {
    enterpriseSearch(userForEveryone, passwordForEveryone, getYourCompany)
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
    //AQUI SE PUEDE REMPLAZAR LOS CONTAINERS QUE USE POR UNOS QUE PERMITAN ENTRAR AL PERFIL DE USUARIO O LO QUE SEA
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    initContainers();

    return FutureBuilder<Enterprise>(
      future: enterpriseSearch(
          userForEveryone, passwordForEveryone, getYourCompany),
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
                      ],
                    ),
                  ),
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
}
