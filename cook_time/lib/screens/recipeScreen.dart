import 'dart:convert';
import 'dart:io';
//import 'dart:html';
import 'package:cook_time/future.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/screens/login.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class RecipeScreen extends StatefulWidget {
  @override
  State<RecipeScreen> createState() => RecipeScreenState();
}

class RecipeScreenState extends State<RecipeScreen> {
  String base64;
  bool private = false;

  var baseTextFieldControllers = List<TextEditingController>();
  var baseTextFormFields = List<Widget>();

  var ingredientTextFieldControllers = List<TextEditingController>();
  var ingredientTextFormFields = List<Widget>();

  var stepsTextFieldControllers = List<TextEditingController>();
  var stepsTextFormFields = List<Widget>();

  List text = [
    "Nombre de la receta",
    "Tipo de plato (Desayuno, Almuerzo...)",
    "Tiempo (Numero de minutos)",
    "Dificultad (Numero)",
    "Tags por dieta (Vegano, Kosher...)",
    "Precio (Obligatorio para empresas)"
  ];

  void initTextFormField() {
    if (baseTextFieldControllers.length == 0) {
      for (int x = 0; x < 6; x++) {
        baseTextFieldControllers.add(TextEditingController());
        baseTextFormFields
            .add(textFormFieldCreator(baseTextFieldControllers[x], text[x]));
      }

      ingredientTextFieldControllers.add(TextEditingController());
      ingredientTextFormFields.add(textFormFieldCreator(
          ingredientTextFieldControllers[0], "Ingrediente 1"));

      stepsTextFieldControllers.add(TextEditingController());
      stepsTextFormFields
          .add(textFormFieldCreator(stepsTextFieldControllers[0], "Paso 1"));
    }
  }

  Container textFormFieldCreator(
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

  Container categoryContainer(String text) {
    return Container(
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
      child: Text(
        text,
        textScaleFactor: SizeConfig.fixLilHor * 3,
      ),
    );
  }

  Future getImageFromGallery() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      base64 = base64Encode(image.readAsBytesSync());
    });
  }

  @override
  Widget build(BuildContext context) {
    initTextFormField();
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Esto es solo un widget pero con un if rarísimo que afecta la forma en la que se ve según se haya o no seleccionado un archivo.
            base64 == null
                ? GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(SizeConfig.fixLil * 60),
                      padding: EdgeInsets.all(SizeConfig.fixLil * 15),
                      height: SizeConfig.fixAllVer * 2.5,
                      width: SizeConfig.fixAllHor * 6,
                      color: Colors.blue,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "¡Tap para agregar una imagen!",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      getImageFromGallery();
                    },
                  )
                : GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(SizeConfig.fixLil * 60),
                      height: SizeConfig.fixAllVer * 2.5,
                      width: SizeConfig.fixAllHor * 6,
                      color: Colors.blue,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.memory(base64Decode(base64)),
                      ),
                    ),
                    onTap: () {
                      getImageFromGallery();
                    },
                  ),

            //Other Widgets

            categoryContainer("Información General"),

            Container(
              margin: EdgeInsets.all(SizeConfig.fixLil * 30),
              child: Column(
                children: [
                  Text("¿Receta privada?"),
                  Switch(
                    value: private,
                    onChanged: (value) {
                      setState(() {
                        private = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            Column(
              children: baseTextFormFields,
            ),

            categoryContainer("¡Ingredientes!"),

            Column(
              children: ingredientTextFormFields,
            ),

            RaisedButton(
              shape: CircleBorder(),
              disabledColor: Colors.blueGrey,
              disabledTextColor: Colors.black,
              color: Colors.blueAccent,
              textColor: Colors.white,
              elevation: 5.0,
              onPressed: () {
                setState(() {
                  ingredientTextFieldControllers.add(TextEditingController());
                  int temp = ingredientTextFieldControllers.length;
                  ingredientTextFormFields.add(textFormFieldCreator(
                      ingredientTextFieldControllers[temp - 1],
                      "Ingrediente " + temp.toString()));
                });
              },
              child: Icon(Icons.add),
            ),

            categoryContainer("¡Pasos!"),

            Column(
              children: stepsTextFormFields,
            ),

            RaisedButton(
              shape: CircleBorder(),
              disabledColor: Colors.blueGrey,
              disabledTextColor: Colors.black,
              color: Colors.blueAccent,
              textColor: Colors.white,
              elevation: 5.0,
              onPressed: () {
                setState(() {
                  stepsTextFieldControllers.add(TextEditingController());
                  int temp = stepsTextFieldControllers.length;
                  stepsTextFormFields.add(textFormFieldCreator(
                      stepsTextFieldControllers[temp - 1],
                      "Paso " + temp.toString()));
                });
              },
              child: Icon(Icons.add),
            ),

            RaisedButton(
              disabledColor: Colors.blueGrey,
              disabledTextColor: Colors.black,
              color: Colors.purpleAccent,
              textColor: Colors.white,
              elevation: 5.0,
              onPressed: () {
                print("Enviar Receta");
              },
              child: Text("Enviar Receta"),
            ),
          ],
        ),
      ),
    );
  }
}
