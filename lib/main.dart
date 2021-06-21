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
  Color color = Colors.white;

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

  Future<void> playsound(int soundNumber) async {
    await player.setAsset('assets/note$soundNumber.mp4');
    player.play();
  }

  // Widget? xyloTouch(
  //     {required int soundNumber, required MaterialStateProperty<Colors> col}) {
  //   return Expanded(
  //     child: TextButton(
  //       style: ButtonStyle(
  //         backgroundColor: col,
  //       ),
  //       onPressed: () async {
  //         playsound(soundNumber);
  //       },
  //       child: Text(''),
  //     ),
  //   );
  // }

  buildkey({required int number, required Color col}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(col as Color),
        ),
        onPressed: () async {
          playsound(number);
        },
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              buildkey(number: 1, col: Colors.red),
              buildkey(number: 2, col: Colors.orange),
              buildkey(number: 3, col: Colors.yellow),
              buildkey(number: 4, col: Colors.greenAccent),
              buildkey(number: 5, col: Colors.teal),
              buildkey(number: 5, col: Colors.blue),
              buildkey(number: 6, col: Colors.purple),
              /* Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () async {
                    playsound(1);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepOrangeAccent),
                  ),
                  onPressed: () async {
                    playsound(2);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.yellow.shade400),
                  ),
                  onPressed: () async {
                    playsound(3);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green.shade300),
                  ),
                  onPressed: () async {
                    playsound(4);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal.shade200),
                  ),
                  onPressed: () async {
                    playsound(5);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () async {
                    playsound(6);
                  },
                  child: Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                  onPressed: () async {
                    playsound(7);
                  },
                  child: Text(''),
                ),
              ),*/
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
      ),
    );
  }
}
