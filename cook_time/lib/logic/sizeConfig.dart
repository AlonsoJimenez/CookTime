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

  ///Metodo que a partir del contexto de construcción extrae el ancho/largo de la pantalla del dispositivo
  ///Permitiendo usar medidas en base al dispositivo y así hacer widgets proporcionales.
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
