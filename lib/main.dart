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
          child: Column(children: [
            Center(
              child: TextButton(
                onPressed: () async {
                  print('plop');
                  await player.setAsset('assets/note1.mp4');
                  player.play();
                },
                child: Text('Click Me'),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  print('plop');
                  await player.setAsset('assets/note2.mp4');
                  player.play();
                },
                child: Text('Click Me'),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  print('plop');
                  await player.setAsset('assets/note3.mp4');
                  player.play();
                },
                child: Text('Click Me'),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  print('plop');
                  await player.setAsset('assets/note4.mp4');
                  player.play();
                },
                child: Text('Click Me'),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  print('plop');
                  await player.setAsset('assets/note5.mp4');
                  player.play();
                },
                child: Text('Click Me'),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  print('plop');
                  await player.setAsset('assets/note6.mp4');
                  player.play();
                },
                child: Text('Click Me'),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  print('plop');
                  await player.setAsset('assets/note7.mp4');
                  player.play();
                },
                child: Text('Click Me'),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  print('plop');
                  await player.setAsset('assets/supercopter_2.mp4');
                  player.play();
                },
                child: Text('Click Me'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
