import 'package:akzio_deportes/model/user.dart';
import 'package:flutter/material.dart';

import '../model/sport.dart';
import '../utils/common_widgets.dart';
import '../utils/data_utils.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  static String route = "/view";

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.getAppBar("Usuarios",context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Usuarios creados",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            _createUserCards()
          ],
        ),
      ),
    );
  }

  Widget _createUserCards() {
    List<Widget> widgetList = <Widget>[];

    for(User user in _users){
      List<Sport> sports = user.sports;
      List<Widget> sportsTextWidgets = <Widget>[];
      sportsTextWidgets.add(Text("Deportes favoritos"
        ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ));
      for(Sport sport in sports){
        sportsTextWidgets.add(Text(sport.name));
      }

      widgetList.add(Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    children: [
                      Text("Correo"
                        ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(user.email)
                    ]
                ),
                Column(
                  children: sportsTextWidgets
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () async{
                          bool deleted = await DataUtils.deleteUser(user.id.toString(), context);
                          if(deleted){
                            loadUsers();
                          }
                        },
                        icon: Icon(Icons.delete,color: Colors.red,))
                  ],
                )
              ],
            ),
          )
      ));
    }

    return Column(children: widgetList);
  }

  loadUsers() async{
    _users = await DataUtils.getUsers();
    setState(() {

    });
  }
}