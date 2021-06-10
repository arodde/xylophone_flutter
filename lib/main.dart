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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SafeArea(
            child: Center(
              child: TextButton(
                onPressed: () async {
                  print('plop');
                  await player.setAsset('assets/supercopter_2.mp4');
                  player.play();
                },
                child: Text('Click Me'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
