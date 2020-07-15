import 'package:cook_time/logic/sizeConfig.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  static final nameController = TextEditingController();
  static final lastNameController = TextEditingController();
  static final lastName2Controller = TextEditingController();
  static final emailController = TextEditingController();
  static final ageController = TextEditingController();
  static final passwordController = TextEditingController();

  Future<bool> _onBackPressed(){
    return Navigator.pushNamed(context, '/login');
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Material(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.blueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AspectRatio(
                        aspectRatio: 20,
                      ),
                      Text(
                        "¡Bienvenido a CookTime!", textScaleFactor: SizeConfig.fixLil * 5, style: TextStyle(color: Colors.white),
                      ),
                      AspectRatio(
                        aspectRatio: 30,
                      ),
                      Text(
                        " Llena el siguiente formulario para registrarte: ",textScaleFactor: SizeConfig.fixLil * 3, style: TextStyle(color: Colors.white),
                      ),
                      AspectRatio(
                        aspectRatio: 20,
                      ),
                    ],
                  ),
                ),
                AspectRatio(
                  aspectRatio: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical:  SizeConfig.fixLil * 40),
                    border: OutlineInputBorder(),
                    hintText: 'Nombre',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    )
                  ),
                ),
                AspectRatio(
                  aspectRatio: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: lastNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical:  SizeConfig.fixLil * 40),
                    border: OutlineInputBorder(),
                    hintText: '1er Apellido',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    )
                  ),
                ),
                AspectRatio(
                  aspectRatio: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: lastName2Controller,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical:  SizeConfig.fixLil * 40),
                    border: OutlineInputBorder(),
                    hintText: '2ndo Apellido',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    )
                  ),
                ),
                AspectRatio(
                  aspectRatio: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: ageController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical:  SizeConfig.fixLil * 40),
                    border: OutlineInputBorder(),
                    hintText: 'Edad',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    )
                  ),
                ),
                AspectRatio(
                  aspectRatio: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical:  SizeConfig.fixLil * 40),
                    border: OutlineInputBorder(),
                    hintText: 'Dirección de Correo Electrónico',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    )
                  ),
                ),
                AspectRatio(
                  aspectRatio: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical:  SizeConfig.fixLil * 40),
                      border: OutlineInputBorder(),
                      hintText: 'Contraseña',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      )
                  ),
                ),
                AspectRatio(
                  aspectRatio: 10,
                ),
                RaisedButton(
                  disabledColor: Colors.blueGrey,
                  disabledTextColor: Colors.black,
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  elevation: 5.0,
                  onPressed: (){
                    print("Crear cuenta presionado");
                  },
                  child: Text("Crear cuenta"),
                ),
                AspectRatio(
                  aspectRatio: 10,
                ),
              ],
            ),
          )
        )
      ),
    );
  }

}