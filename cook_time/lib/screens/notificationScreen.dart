import 'package:flutter/material.dart';

import '../future.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  get passwordForEveryone => null;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<String>>(
          future: notifications(userForEveryone, passwordForEveryone),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return gettingNotifications(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("Error loading data");
            }
            return CircularProgressIndicator();
          },
        ));
  }
}

ListView gettingNotifications(List<String> notify) {
  List<Widget> addToNews = new List<Widget>();
  if (notify.length != 0) {
    for (String recipe in notify) {
      addToNews.add(SizedBox(height: 20));
      addToNews.add(notification(recipe));
    }
    return ListView(
      children: addToNews,
    );
  } else {
    return ListView(children: <Widget>[
      Text("No new notifications"),
      Text("Refresh later for more")
    ]);
  }
}

SizedBox notification(String dataNews) {
  return SizedBox(
    height: 110,
    child: Text(dataNews),
  );
}
