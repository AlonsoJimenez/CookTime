import 'package:cook_time/logic/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSelectorScreen extends StatefulWidget {
  @override
  State<MapSelectorScreen> createState() => MapSelectorScreenState();
}

class MapSelectorScreenState extends State<MapSelectorScreen> {
  double lat;
  double lng;

  List<Marker> myMarker = [];

  LatLng position = LatLng(9.9356284, -84.1483645);

  ///Constructor de la página para extraer coordenadas de un puntero.
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
              target: LatLng(9.9356284, -84.1483645),
              zoom: 15.0,
            ),
            onTap: handleTap,
          ),
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
            //Evento que guarda/envía la lat y la lng
            setState(() {});
          },
          child: Text("Guardar Ubicación"),
        ),
      ],
    ));
  }

  handleTap(LatLng tappedPoint) {
    setState(() {
      lat = tappedPoint.latitude;
      lng = tappedPoint.longitude;

      print(lat);

      myMarker = [];
      myMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
      ));
    });
  }
}
