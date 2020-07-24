import 'package:cook_time/future.dart';
import 'package:flutter/material.dart';
import '../objects.dart';

class CompaniesList extends StatefulWidget {
  @override
  State<CompaniesList> createState() => CompaniesListState();
}

///Metodo constructor de la página para seleccionar la empresa.
class CompaniesListState extends State<CompaniesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<Enterprise>>(
          future: companies(userForEveryone, passwordForEveryone),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return gettingNews(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("Error loading data");
            }
            return CircularProgressIndicator();
          },
        ));
  }
}

ListView gettingNews(List<Enterprise> companies) {
  List<Widget> addToNews = new List<Widget>();
  if (companies.length != 0) {
    for (Enterprise company in companies) {
      addToNews.add(SizedBox(height: 20));
      addToNews.add(selectCompany(company));
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

SizedBox selectCompany(Enterprise company) {
  return SizedBox(
    child: GestureDetector(
      child: Text(company.enterpriseName),
      onTap: () {},
    ),
    height: 110,
  );
}
