import 'package:cook_time/logic/sizeConfig.dart';
import 'package:cook_time/screens/tabBView.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  static final searchController = TextEditingController();
  static int treeValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 201, 204, 209),
      child: Column(
        children: [
          Container(
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
            child: Column(
              children: [
                TextField(
                  style: TextStyle(color: Colors.black, fontSize:  SizeConfig.fixLilHor * 34),
                  controller: searchController,
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical:  SizeConfig.fixLil * 10),
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa el nombre de una receta, usuario o empresa.',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      )
                  ),
                  onChanged: (text){
                    print(text);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                        setState(() {
                          treeValue = 0;
                        });
                      },
                      child: Text("Receta"),
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
                        setState(() {
                          treeValue = 1;
                        });
                      },
                      child: Text("Usuario"),
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
                        setState(() {
                          treeValue = 2;
                        });
                      },
                      child: Text("Empresa"),
                    )
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.all(SizeConfig.fixLil * 20),
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
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0,3),
                  )
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}