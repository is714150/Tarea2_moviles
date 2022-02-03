import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green
        )
      ),
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color _maleIconColor = Colors.black;
  Color _femaleIconColor = Colors.black;
  int _genero=0;
  TextEditingController _altura = TextEditingController();
  TextEditingController _peso = TextEditingController();
  double IMC =0;
  double _ialtura=0;
  double _ipeso=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular IMC'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){
                  setState(() {
                      _altura.clear();
                      _peso.clear();
                      _maleIconColor = Colors.black;
                      _femaleIconColor = Colors.black;

                    });
                },
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 50.0),),
              Text("Ingrese sus datos para calcular el IMC",style: TextStyle(fontSize: 18),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.male),
                color: _maleIconColor,
                iconSize: 30,
                onPressed: (){
                  setState(() {
                      if(_maleIconColor == Colors.black){
                        _maleIconColor = Colors.blue;
                        _femaleIconColor = Colors.black;
                        _genero=0;
                      }else{
                        _maleIconColor = Colors.black;
                      }
                    });
                },
              ),
              IconButton(
                icon: Icon(Icons.female),
                color: _femaleIconColor,
                iconSize: 30,
                onPressed: (){
                  setState(() {
                      if(_femaleIconColor == Colors.black){
                            _femaleIconColor = Colors.pink;
                            _maleIconColor = Colors.black;
                            _genero=1;
                      }else{
                        _femaleIconColor = Colors.black;
                      }
                    });
                },
              ),
            ],
          ),
          Container(
            width: 380.0,
            child: TextField(
              controller: _altura,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingresar altura (metros)',
                border: OutlineInputBorder(),
                icon: Icon(
                  Icons.square_foot,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10),),
          Container(
            width: 380.0,
            child: TextField(
              controller: _peso,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingresar peso (KG)',
                border: OutlineInputBorder(),
                icon: Icon(
                  Icons.monitor_weight,              
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
        
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                ), 
                onPressed: () {
                  _ialtura =double.parse(_altura.text);
                  _ipeso =double.parse(_peso.text);
                  IMC=_ipeso/(_ialtura*_ialtura);
                  if(_genero==1){
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Tu IMC: $IMC"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tabla de IMC Mujeres"),
                          Text("Edad   IMC ideal"),
                          Text("16-24   19-24"),
                          Text("25-34   20-25"),
                          Text("35-44   21-26"),
                          Text("45-54   22-27"),
                          Text("55-64   23-28"),
                          Text(" 65+    24-29"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.black,
                                ), 
                                onPressed: (){
                                Navigator.pop(context);
                              }, 
                              child: 
                              Text("Aceptar"),
                              ),
                            ],
                          )
                        ],
                      )
                      
                    );
                  });
                }else{
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Tu IMC: $IMC"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tabla de IMC Hombres"),
                          Text("Edad   IMC ideal"),
                          Text("16-24   19-24"),
                          Text("25-34   20-25"),
                          Text("35-44   21-26"),
                          Text("45-54   22-27"),
                          Text("55-64   23-28"),
                          Text(" 65+    24-29"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.black,
                                ), 
                                onPressed: (){
                                Navigator.pop(context);
                              }, 
                              child: 
                              Text("Aceptar"),
                              ),
                            ],
                          )
                        ],
                      )
                      
                    );
                  });
                };
                },
                child: const Text('Calcular'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

