import 'dart:convert';

import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/screens/reusableWidgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BusinessCreatorScreen extends StatefulWidget {
  @override
  State<BusinessCreatorScreen> createState() => BusinessCreatorScreenState();
}

class BusinessCreatorScreenState extends State<BusinessCreatorScreen> {
  String base64;

  var baseTextFieldControllers = List<TextEditingController>();
  var baseTextFormFields = List<Widget>();

  final List text = [
    "Nombre de la empresa",
    "Método(s) de contacto",
    "Horario de atención",
  ];

  void initTextFormField() {
    if (baseTextFieldControllers.length == 0) {
      for (int x = 0; x < text.length; x++) {
        baseTextFieldControllers.add(TextEditingController());
        baseTextFormFields.add(ReusableWidgets.textFormFieldCreator(
            baseTextFieldControllers[x], text[x]));
      }
    }
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

            //w
            Column(
              children: baseTextFormFields,
            ),

            Container(
              margin: EdgeInsets.all(SizeConfig.fixLil * 60),
              padding: EdgeInsets.all(SizeConfig.fixLil * 15),
              height: SizeConfig.fixAllVer * 2.5,
              width: SizeConfig.fixAllHor * 6,
              color: Colors.blue,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "¡Tap para agregar una ubicación!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
