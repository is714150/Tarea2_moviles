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
  int _numClicks=0;

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday Card'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              _numClicks++;
              ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                    content: Text("Felicitado $_numClicks veces"),
                  ),
                );
            },
            child: Text(
              "Happy birthday Frank", 
              style: TextStyle(fontSize: 38),
            ),
          ),
          Expanded(
            child: Image.network(
                "https://thumbs.dreamstime.com/b/happy-birthday-cupcake-celebration-message-160558421.jpg",
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "From Mike",
              style: TextStyle(fontSize: 22),
              
            ),
          ),
        ],
      )
    );
  }
}