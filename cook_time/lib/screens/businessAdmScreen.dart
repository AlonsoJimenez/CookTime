import 'dart:convert';

import 'package:cook_time/logic/base64.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/screens/reusableWidgets.dart';
import 'package:flutter/material.dart';

class BusinessAdmScreen extends StatefulWidget {
  @override
  State<BusinessAdmScreen> createState() => BusinessAdmScreenState();
}

class BusinessAdmScreenState extends State<BusinessAdmScreen> {
  TextEditingController addController;
  var memberContainers = List<Widget>();
  double opacity = 0;

  List mem = [
    "Juancho",
    "Rafael",
    "John Petrucci",
    "Eric TheDooo",
  ];

  ///Inicia los contenedores para miembros en la empresa privada.
  void initContainers() {
<<<<<<< HEAD
    //AQUI SE PUEDE REMPLAZAR LOS CONTAINERS QUE USE POR UNOS QUE PERMITAN ENTRAR AL PERFIL DE USUARIO O LO QUE SEA
    if (memberContainers.length == 0) {
      for (int x = 0; x < mem.length; x++) {
        memberContainers.add(Container(
          padding: EdgeInsets.all(SizeConfig.fixLil * 15),
          margin: EdgeInsets.all(SizeConfig.fixLil * 10),
          width: SizeConfig.fixAllHor * 8,
          decoration: ReusableWidgets.blueBoxDecoration(),
          child: Text(
            mem[x],
            style: TextStyle(color: Colors.white),
          ),
        ));
      }
    }
=======
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
>>>>>>> bda2073baf138d48c3f66f3411c2044ffd8a2d82
  }

  ///Constructor de la página de empresa privada.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    initContainers();

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
                      child: Image.memory(base64Decode(Base64.base64s)),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      //REMPLAZAR EL "68" CON INFO REST API
                      ReusableWidgets.infoContainer("Seguidores:", "68"),

                      //REMPLAZAR EL "68" CON INFO REST API
                      ReusableWidgets.infoContainer("Miembros:", "36"),

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
            ReusableWidgets.categoryContainer("Pancho's Enterprise"),

            //CAMBIAR CORREO CON LA INFO REAL DEL API
            ReusableWidgets.infoContainer("Contacto:", "panchos@gmail.com"),

            //CAMBIAR EL HORARIO CON LA INFO REAL DEL API
            ReusableWidgets.infoContainer("Horario:", "Lun-Vier: 7am-3pm"),

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
                        ReusableWidgets.textFormFieldCreator(addController,
                            "Ingresa un correo para añadir un nuevo miembro"),
                        Text("Correo no encontrado",
                            style: TextStyle(
                                color: Colors.redAccent.withOpacity(opacity))),
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
            //Aquí se puede agregar cualquier widget de cualquier tamaño porque es un SIngleviewScrollwidget
          ],
        ),
      ),
    );
  }
}
