import 'package:akzio_deportes/utils/common_widgets.dart';
import 'package:akzio_deportes/utils/data_utils.dart';
import 'package:flutter/material.dart';

import '../model/sport.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static String route = "/";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Sport> _sports = [];
  String _email = "";

  @override
  void initState() {
    super.initState();
    loadSports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.getAppBar("Inicio",context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Agregar usuario",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            _createInputUser(),
            _createInputSports(),
            Divider(),
            ElevatedButton(
                onPressed: () async{
                  bool added = await DataUtils.addUser(_email, _sports, context);
                  if(added){
                    resetParameters();
                  }
                },
                child: Text("Agregar")
            )
          ],
        ),
      ),
    );
  }

  Widget _createInputUser() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Correo',
            hintText: 'Ingrese su correo',
            suffixIcon: Icon(Icons.account_circle)),
        onChanged: (value) {
          _email = value;
          setState(() {

          });
        },
      ),
    );
  }

  Widget _createInputSports() {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        "Selecciona tus deportes favoritos",
      ),
    ));

    for(Sport sport in _sports){
      widgetList.add(Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(sport.name),
                Checkbox(
                  value: sport.added,
                  onChanged: (bool? value) {
                    setState(() {
                      sport.added = value!;
                    });
                  },
                ),
              ],
            ),
          )
      ));
    }

    return Column(children: widgetList);
  }

  loadSports() async{
    _sports = await DataUtils.getSports();
    setState(() {

    });
  }

  resetParameters(){
    for(Sport sport in _sports){
      sport.added = false;
    }

    setState(() {

    });
  }
}