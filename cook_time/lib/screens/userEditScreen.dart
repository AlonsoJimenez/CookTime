import 'dart:convert';
import 'package:cook_time/future.dart';
import 'package:cook_time/screens/reusableWidgets.dart';
import 'package:flutter/material.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:image_picker/image_picker.dart';

import '../objects.dart';

class UserEditScreen extends StatefulWidget {
  @override
  State<UserEditScreen> createState() => UserEditScreenState();
}

class UserEditScreenState extends State<UserEditScreen> {
  String base64;

  static final profileController = TextEditingController();

  ///Futuro que permite extraer una imagen desde la galería.
  Future getImageFromGallery() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      base64 = base64Encode(image.readAsBytesSync());
    });
  }

  ///Constructor de la página para editar usuario.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () {
        return Navigator.pushNamed(context, '/login');
      },
      child: Scaffold(
        body: SingleChildScrollView(
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
                            "¡Tap para cambiar la imagen!",
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
              ReusableWidgets.textFormFieldCreator(
                  profileController, "Agrega un nuevo texto a tu perfil"),
              RaisedButton(
                disabledColor: Colors.blueGrey,
                disabledTextColor: Colors.black,
                color: Colors.purpleAccent,
                textColor: Colors.white,
                elevation: 5.0,
                onPressed: () {
                  User toSend;
                  profile(userForEveryone, passwordForEveryone)
                      .then((userCatch) => {
                            toSend = userCatch,
                            toSend.imageBytes = base64,
                            toSend.profileDescription = profileController.text,
                            toSend.password = passwordForEveryone,
                            updateUser(userForEveryone, passwordForEveryone,
                                    toSend)
                                .then((response) => {
                                      if (response.statusCode == 200)
                                        {
                                          Navigator.pushNamed(
                                              context, '/screens')
                                        }
                                      else
                                        {throw Exception("Error sending data")}
                                    })
                          });
                },
                child: Text("Editar usuario"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
