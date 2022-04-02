import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }

  void getData() async {
    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=5297745a1cb9a565d481ebf5ca38dab9');
    Response resp = await get(url);
    if (resp.statusCode == 200) {
      String data = resp.body;
      print(data);
    } else {
      print(resp.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
