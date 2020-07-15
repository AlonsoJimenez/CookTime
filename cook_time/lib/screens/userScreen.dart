import 'dart:convert';

import 'package:cook_time/logic/base64.dart';
import 'package:cook_time/logic/sizeConfig.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget{
  @override
  State<UserScreen> createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 50,
          ),
          AspectRatio(
            aspectRatio: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0,3),
                  )
                ],
              ),
              margin: EdgeInsets.all(SizeConfig.fixAllHor*0.2),
              padding:  EdgeInsets.all(SizeConfig.fixAllHor*0.2),
              child: userTop(Base64.base64s, "Juanito", "15", "32"),
            ),
          ),
        ],
      ),
    );
  }

  static Row userTop(String base64, String user, String followers, String following){
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              height: SizeConfig.fixAllVer*1.6,
              width: SizeConfig.fixAllHor*4,
              color: Colors.blue,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.memory(base64Decode(base64)),
              ),
            ),
            Text(user, textScaleFactor: SizeConfig.fixLil * 3, style: TextStyle(color: Colors.deepPurple),)
          ],
        ),
        Container(
          width: SizeConfig.fixAllHor * 1,
        ),
        Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(followers),
                    Text("Seguidores"),
                  ],
                ),
                Container(
                  width: SizeConfig.fixAllHor * 1,
                ),
                Column(
                  children: [
                    Text(following),
                    Text("Siguiendo"),
                  ],
                ),
              ],
            ),

            Container(
              height: SizeConfig.fixAllVer * 0.3,
            ),

            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)
              ),
              disabledColor: Colors.blueGrey,
              disabledTextColor: Colors.black,
              color: Colors.white,
              textColor: Colors.black,
              elevation: 5.0,
              onPressed: (){
                print("Crear receta presionado");
              },
              child: Text("Nueva Receta"),
            ),
          ],
        ),
      ],
    );
  }
}