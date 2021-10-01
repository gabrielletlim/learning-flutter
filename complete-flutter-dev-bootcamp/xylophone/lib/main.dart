import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playsound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
              children: [
                MaterialButton(
                  color: Colors.red,
                  onPressed: (){
                    playsound(1);
                  },
                ),
                MaterialButton(
                  color: Colors.orange,
                  onPressed: (){
                    playsound(2);
                  },
                ),
                MaterialButton(
                  color: Colors.yellow,
                  onPressed: (){
                    playsound(3);
                  },
                ),
                MaterialButton(
                  color: Colors.green,
                  onPressed: (){
                    playsound(4);
                  },
                ),
                MaterialButton(
                  color: Colors.teal,
                  onPressed: (){
                    playsound(5);
                  },
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: (){
                    playsound(6);
                  },
                ),
                MaterialButton(
                  color: Colors.deepPurple,
                  onPressed: (){
                    playsound(7);
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}
