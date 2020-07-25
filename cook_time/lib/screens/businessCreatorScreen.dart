import 'dart:convert';

import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/objects.dart';
import 'package:cook_time/screens/reusableWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../future.dart';
import 'mapSelectorScreen.dart';

class BusinessCreatorScreen extends StatefulWidget {
  @override
  State<BusinessCreatorScreen> createState() => BusinessCreatorScreenState();
}

class BusinessCreatorScreenState extends State<BusinessCreatorScreen> {
  GoogleMapController myController;
  String base64;

  var baseTextFieldControllers = List<TextEditingController>();
  var baseTextFormFields = List<Widget>();

  final List text = [
    "Nombre de la empresa",
    "Método(s) de contacto",
    "Horario de atención",
  ];

  ///Inicia los TextFormField base para crear la empresa.
  void initTextFormField() {
    if (baseTextFieldControllers.length == 0) {
      for (int x = 0; x < text.length; x++) {
        baseTextFieldControllers.add(TextEditingController());
        baseTextFormFields.add(ReusableWidgets.textFormFieldCreator(
            baseTextFieldControllers[x], text[x]));
      }
    }
  }

  ///Futuro para extraer la imagen de la galería.
  Future getImageFromGallery() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      base64 = base64Encode(image.readAsBytesSync());
    });
  }

  ///Creador de la página para Crear Empresas.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                      height: SizeConfig.fixAllVer * 3,
                      width: double.infinity,
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
                Navigator.pushNamed(context, '/mapSelector');
              },
              child: Text("Agregar ubicación."),
            ),
            RaisedButton(
              disabledColor: Colors.blueGrey,
              disabledTextColor: Colors.black,
              color: Colors.purpleAccent,
              textColor: Colors.white,
              elevation: 5.0,
              onPressed: () {
                Enterprise toSend = Enterprise(
                  contactInfo: baseTextFieldControllers[1].text,
                  enterpriseName: baseTextFieldControllers[0].text,
                  followers: [],
                  members: [userForEveryone],
                  operationHours: baseTextFieldControllers[2].text,
                  recipes: [],
                  imageBytes: base64,
                  coordinates: [lat, lng],
                );
                postCompany(userForEveryone, passwordForEveryone, toSend)
                    .then((response) => {
                          if (response.statusCode == 200)
                            {Navigator.pushNamed(context, '/screens')}
                          else
                            {throw Exception("Error sending data")}
                        });
              },
              child: Text("Crear Empresa"),
            ),
          ],
        ),
      ),
    );
  }
}
