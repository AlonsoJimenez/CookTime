import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;

  static double fixerHorizontal;
  static double fixerVertical;
  static double fixAllVer;
  static double fixAllHor;
  static double fixLilVer;
  static double fixLilHor;
  static double fixLil;

  ///Método que mediante el contexto extrae el valor del ancho/largo de la pantalla en el momento de ejecución
  ///permitiendo usarlo para hacer widgets proporcionales al tamaño de la pantalla del dispositivo.
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    //My implementation from the code above
    fixerVertical = screenHeight.toInt() * 1.0;
    fixerHorizontal = screenWidth.toInt() * 1.0;
    fixAllVer = screenHeight.toInt() / 10;
    fixAllHor = screenWidth.toInt() / 10;
    fixLilVer = screenHeight.toInt() / 1000;
    fixLilHor = screenWidth.toInt() / 1000;

    fixLil = fixLilHor * fixLilVer;

    print("Fixlil = " + fixLil.toString());
  }
}
