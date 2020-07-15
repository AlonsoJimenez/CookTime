import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cook_time/logic/sizeConfig.dart';

class Newsfeed{
  ListView newsfeeder(){
    return ListView.builder(
        itemBuilder: (BuildContext context, int index){

        }
    );
  }

  FutureBuilder recipes(url){
    return FutureBuilder(
      future: http.get(url),
      // ignore: missing_return
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          print(snapshot.data.toString());
        } else{
          return CircularProgressIndicator(backgroundColor: Colors.black,);
        }
      },
    );
  }

  Container news(String base64, String stars, String comments, String user, String name, String time){
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.person, ),
              Text(user, softWrap: true, style: TextStyle(color: Colors.deepPurple), textScaleFactor: SizeConfig.fixLil * 3,),
            ],
          ),
          GestureDetector(
            onDoubleTap: (){
              print("Aquí se entraría a la receta ya completa con pasos y comentarios de ser posible");
            },
            child: AspectRatio(
              aspectRatio: 24/18,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.memory(base64Decode(base64)),
              )
            )
          ),
          AspectRatio(
              aspectRatio: 22/2,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 2/8,
                  ),
                  FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Row(
                      children: [
                        Icon(Icons.star_border, color: Colors.blueAccent,),
                        Text(stars, textScaleFactor: SizeConfig.fixLil * 4,),
                      ],
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 2/8,
                  ),
                  FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Row(
                      children: [
                        Icon(Icons.comment, color: Colors.blueAccent,),
                        Text(comments, textScaleFactor: SizeConfig.fixLil * 4,),
                      ],
                    ),
                  ),
                  Spacer(flex: 2,),
                  FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: Colors.blueAccent,),
                        Text(time+" m.", textScaleFactor:  SizeConfig.fixLil * 4,),
                      ],
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 2/8,
                  ),
                ],
              )
          ),
          AspectRatio(
            aspectRatio: 28/4,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 2/9,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: AspectRatio(
                      aspectRatio: 10/12,
                      child: FittedBox(
                        //alignment: Alignment.topLeft,
                        fit: BoxFit.fitWidth,
                        child: Column(
                          children: [
                            Icon(Icons.restaurant_menu, ),
                            Text("Receta:", softWrap: true,),
                          ],
                        ),
                      ),
                    )
                ),
                AspectRatio(
                  aspectRatio: 1/10,
                ),
                AspectRatio(
                  aspectRatio: 1/30,
                  child: Container(color: Colors.blueAccent,),
                ),
                AspectRatio(
                  aspectRatio: 1/10,
                ),
                Flexible(
                  child: Text(
                    name, softWrap: true, textScaleFactor:  SizeConfig.fixLil * 3, //*style: TextStyle(),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 2/8,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  String breteador(String brete, String indice){
    String res = "";
    int cont = brete.indexOf(indice, 0) + indice.length + 4;
    while(brete[cont] != "\""){
      res += brete[cont];
      cont++;
    }
    return res;
  }

}