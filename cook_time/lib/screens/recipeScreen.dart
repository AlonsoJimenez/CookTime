import 'dart:convert';
//import 'dart:html';
import 'package:cook_time/future.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/screens/reusableWidgets.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../objects.dart';

List<String> toStringList(List<TextEditingController> controllers) {
  List<String> toReturn = new List<String>();
  for (TextEditingController control in controllers) {
    toReturn.add(control.text);
  }
  return toReturn;
}

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

  ///Texto base para los TextFormField de la página de recetas.
  List text = [
    "Nombre de la receta",
    "Tipo de plato (Desayuno, Almuerzo...)",
    "Porcion (para cuantas personas)",
    "Duración de preparación (Numero en minutos)",
    "Tiempo (Aperitivo, Plato fuerte...)",
    "Dificultad (Numero)",
    "Tags por dieta (Vegano, Kosher...)",
    "Precio (Obligatorio para empresas)"
  ];

  ///Inicia los TextFormField base de la página de recetas.
  void initTextFormField() {
    if (baseTextFieldControllers.length == 0) {
      for (int x = 0; x < text.length; x++) {
        baseTextFieldControllers.add(TextEditingController());
        baseTextFormFields.add(ReusableWidgets.textFormFieldCreator(
            baseTextFieldControllers[x], text[x]));
      }

      ingredientTextFieldControllers.add(TextEditingController());
      ingredientTextFormFields.add(ReusableWidgets.textFormFieldCreator(
          ingredientTextFieldControllers[0], "Ingrediente 1"));

      stepsTextFieldControllers.add(TextEditingController());
      stepsTextFormFields.add(ReusableWidgets.textFormFieldCreator(
          stepsTextFieldControllers[0], "Paso 1"));
    }
  }

  ///Futuro para extraer la imagen de la galería.
  Future getImageFromGallery() async {
    // ignore: deprecated_member_use
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      base64 = base64Encode(image.readAsBytesSync());
    });
  }

  ///Constructor de la página para crear Recetas.
  @override
  Widget build(BuildContext context) {
    initTextFormField();
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
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

            ReusableWidgets.categoryContainer("Información General"),

            Container(
              margin: EdgeInsets.all(SizeConfig.fixLil * 30),
              child: Column(
                children: [
                  Text("¿Receta privada? (solo empresa)"),
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

            ReusableWidgets.categoryContainer("¡Ingredientes!"),

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
                  ingredientTextFormFields.add(
                      ReusableWidgets.textFormFieldCreator(
                          ingredientTextFieldControllers[temp - 1],
                          "Ingrediente " + temp.toString()));
                });
              },
              child: Icon(Icons.add),
            ),

            ReusableWidgets.categoryContainer("¡Pasos!"),

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
                  stepsTextFormFields.add(ReusableWidgets.textFormFieldCreator(
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
                DateTime now = new DateTime.now();
                List<String> tags = new List<String>();
                tags.add(baseTextFieldControllers[4].text);
                Recipe toSend = Recipe(
                  author: userForEveryone,
                  publish: [now.day, now.month, now.year],
                  comments: [],
                  stars: 5,
                  imageBytes: base64,
                  tags: tags,
                  dishType: baseTextFieldControllers[1].text,
                  dishName: baseTextFieldControllers[0].text,
                  preparationMinutes:
                      int.parse(baseTextFieldControllers[2].text),
                  difficulty: int.parse(baseTextFieldControllers[3].text),
                  steps: toStringList(stepsTextFieldControllers),
                  ingridients: toStringList(ingredientTextFieldControllers),
                  portionsSize: 4,
                );
                postRecipe(userForEveryone, passwordForEveryone, toSend)
                    .then((response) => {
                          if (response.statusCode == 200)
                            {Navigator.pushNamed(context, '/screens')}
                          else
                            {throw Exception("Error sending data")}
                        });
              },
              child: Text("Enviar Receta"),
            ),
          ],
        ),
      ),
    );
  }
}
