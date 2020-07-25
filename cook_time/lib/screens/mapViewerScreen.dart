import 'package:cook_time/logic/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewerScreen extends StatefulWidget {
  @override
  State<MapViewerScreen> createState() => MapViewerScreenState();
}

class MapViewerScreenState extends State<MapViewerScreen> {
  List<Marker> myMarker = [];

  LatLng position = LatLng(9.9356284, -84.1483645);

  ///Cambia la posición del mapa según los valores de Latitud y Longitud extraídos
  /// del rest api, estos valores también se usan para generar un marcador en el mapa.
  void initMarker(double lat, double lng) {
    setState(() {
      position = LatLng(lat, lng);
      myMarker.add(Marker(
        markerId: MarkerId(position.toString()),
        position: position,
      ));
    });
  }

  ///Constructor de la pantalla para ver el mapa.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(SizeConfig.fixLil * 50),
          height: SizeConfig.fixAllVer * 9.5,
          width: SizeConfig.fixAllHor * 9.5,
          child: GoogleMap(
            markers: Set.from(myMarker),
            initialCameraPosition: CameraPosition(
              target: position,
              zoom: 15.0,
            ),
          ),
        ),
      ],
    ));
  }
}
