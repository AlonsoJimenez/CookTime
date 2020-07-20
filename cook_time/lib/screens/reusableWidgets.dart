import 'package:cook_time/logic/sizeConfig.dart';
import "package:flutter/material.dart";

class ReusableWidgets {
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

  static Container categoryContainer(String text) {
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
}
