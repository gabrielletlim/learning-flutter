import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Lan ETS"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Image(
          width: 350,
          image: AssetImage('images/logo_lan_3d_w.png'),
        ),
      ),
    ),
  ));
}