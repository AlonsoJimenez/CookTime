import 'package:cook_time/future.dart';
import 'package:cook_time/screens/businessAdmScreen.dart';
import 'package:cook_time/screens/reusableWidgets.dart';
import 'package:flutter/material.dart';
import '../objects.dart';

String companySearch;

class CompaniesList extends StatefulWidget {
  @override
  State<CompaniesList> createState() => CompaniesListState();
}

class CompaniesListState extends State<CompaniesList> {
  ///Creador de la página para ver la lista de empresas.
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<Enterprise>>(
          future: companies(userForEveryone, passwordForEveryone),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return getCompanies(snapshot.data, context);
            } else if (snapshot.hasError) {
              return Text("Error loading data");
            }
            return CircularProgressIndicator();
          },
        ));
  }
}

///Devuelve un ListView con las compañías en las que el usuario es miembro.
ListView getCompanies(List<Enterprise> companies, BuildContext context) {
  List<Widget> addToNews = new List<Widget>();
  if (companies.length != 0) {
    for (Enterprise company in companies) {
      addToNews.add(SizedBox(height: 20));
      addToNews.add(selectCompany(company, context));
    }
    return ListView(
      children: addToNews,
    );
  } else {
    return ListView(children: <Widget>[
      Text("No companies to show"),
      Text("Create a new one on your profile info")
    ]);
  }
}

///Retorna un SizedBox con la opción de empresa disponible.
SizedBox selectCompany(Enterprise company, BuildContext context) {
  return SizedBox(
    child: GestureDetector(
      child: Container(
        decoration: ReusableWidgets.blueBoxDecoration(),
        child: Text(
          company.enterpriseName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      onTap: () {
        companySearch = company.enterpriseName;
        Navigator.pushNamed(context, '/businessAdm');
      },
    ),
    height: 110,
  );
}
