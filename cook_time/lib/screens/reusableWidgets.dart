import 'package:cook_time/logic/sizeConfig.dart';
import "package:flutter/material.dart";

class ReusableWidgets {
  ///Contenedor con un TextFormField genérico que está hecho para su uso a lo largo de la aplicación.
  ///return Container
  static Container textFormFieldCreator(
      TextEditingController controller, String text) {
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.fixLilVer * 6,
          bottom: SizeConfig.fixLilVer * 6,
          right: SizeConfig.fixLil * 15,
          left: SizeConfig.fixLil * 15),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        controller: controller,
        obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              right: SizeConfig.fixLil * 15, left: SizeConfig.fixLil * 15),
          border: OutlineInputBorder(),
          hintText: text,
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  ///Contenedor genérico para títulos y divisores.
  ///return Container.
  static Container categoryContainer(String text) {
    return Container(
      decoration: genericBoxDecoration(),
      margin: EdgeInsets.all(SizeConfig.fixLil * 25),
      padding: EdgeInsets.all(SizeConfig.fixLil * 25),
      child: Text(
        text,
        textScaleFactor: SizeConfig.fixLilHor * 3,
      ),
    );
  }

  ///Contenedor genérico que muestra un título o categoría junto al dato que le corresponde.
  ///return Container
  static Container infoContainer(String tittle, String bot) {
    return Container(
      decoration: genericBoxDecoration(),
      margin: EdgeInsets.all(SizeConfig.fixLil * 25),
      padding: EdgeInsets.all(SizeConfig.fixLil * 25),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              tittle,
              textScaleFactor: 0.7,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(bot),
          ),
        ],
      ),
    );
  }

  ///Divide el texto de un comentario según queramos el usuario o el comentario en sí.
  ///return String
  static String divider(String todiv, bool user) {
    String res = "";
    if (user) {
      res = todiv.split(":")[0];
    } else {
      res = todiv.split(":")[1];
    }
    return res;
  }

  ///Decoración genérica para Containers que genera efecto de elevación.
  ///return BoxDecoration
  static BoxDecoration genericBoxDecoration() {
    return BoxDecoration(
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
    );
  }

  ///Decoración azul para Containers que genera efecto de elevación.
  ///return BoxDecoration
  static BoxDecoration blueBoxDecoration() {
    return BoxDecoration(
      color: Colors.blue,
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
    );
  }
}
