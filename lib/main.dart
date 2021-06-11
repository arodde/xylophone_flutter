import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  // void playsound1(int number) {
  //   /**
  //    * bad asynchronus function
  //    */
  //   (number) async {
  //     await player.setAsset('assets/note$number.mp4');
  //     player.play();
  //   };
  // }

  Future<void> playsound(int number) async {
    await player.setAsset('assets/note$number.mp4');
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade600,
        body: SafeArea(
          child: Column(
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () async {
                  playsound(1);
                },
                child: Text(''),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrangeAccent),
                ),
                onPressed: () async {
                  playsound(2);
                },
                child: Text(''),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.yellow.shade400),
                ),
                onPressed: () async {
                  playsound(3);
                },
                child: Text(''),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.shade300),
                ),
                onPressed: () async {
                  playsound(4);
                },
                child: Text(''),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.teal.shade200),
                ),
                onPressed: () async {
                  playsound(5);
                },
                child: Text(''),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () async {
                  playsound(6);
                },
                child: Text(''),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                ),
                onPressed: () async {
                  playsound(7);
                },
                child: Text(''),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
