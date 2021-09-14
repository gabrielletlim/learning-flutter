import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/gabrielle_lim.jpeg'),
              ),
              Text(
                "Gabrielle Lim",
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                "FULL STACK DEVELOPPER",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.teal.shade100,
                  fontFamily: 'SourceSansPro',
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                        title: Text(
                          "+1 514.996.4460",
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'SourceSansPro',
                              fontSize: 20.0
                          ),
                        )
                    )
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "gabrielle.t.lim@gmail.com",
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'SourceSansPro',
                          fontSize: 20.0
                      ),
                    )
                  )
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}