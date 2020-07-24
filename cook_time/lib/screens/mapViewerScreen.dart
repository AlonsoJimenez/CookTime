import 'package:cook_time/logic/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewerScreen extends StatefulWidget {
  @override
  State<MapViewerScreen> createState() => MapViewerScreenState();
}

class MapViewerScreenState extends State<MapViewerScreen> {
  LatLng position = LatLng(9.9356284, -84.1483645);
  List<Marker> myMarker = [];

  ///Init que permite añadir el puntero y modificar la posición de la cámara una vez se extraen los datos del RestApi.
  void initPosition(double lat, double lng) {
    setState(() {
      position = LatLng(lat, lng);

      if (myMarker.length == 0) {
        myMarker.add(Marker(
          markerId: MarkerId(position.toString()),
          position: position,
        ));
      }
    });
  }

  ///Constructor de la página para visualizar un puntero ya existente..
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(SizeConfig.fixLil * 50),
          height: SizeConfig.fixAllVer * 8,
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
