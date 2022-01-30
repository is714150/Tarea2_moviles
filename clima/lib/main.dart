import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Mi primer app"),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 10, top:10, right: 10, bottom:0),
          padding: EdgeInsets.only(left: 5, top:5, right: 5, bottom:5),
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("San Francisco", style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),),
              Text("Nublado", style: TextStyle(
                color: Colors.white
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.cloud,
                    color: Colors.lightBlue,
                    size: 80.0,
                    ),
                  Text("19 C", style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                       content: Text("Los datos estan siendo actualizados"),
                     ),
                   );
                    }, 
                    child: Text("Actualizar datos"), 
                    color: Colors.yellow,
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }
}

