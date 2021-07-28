import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(XylophoneApp());
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  List<String> shortSounds = [
    'assets/shortSounds/do.mp4',
    'assets/shortSounds/re.mp4',
    'assets/shortSounds/mi.mp4',
    'assets/shortSounds/fa.mp4',
    'assets/shortSounds/sol.mp4',
    'assets/shortSounds/la.mp4',
    'assets/shortSounds/si.mp4'
  ];
  List<String> longSounds = [
    'assets/longSounds/undead.mp3',
    'assets/longSounds/wolf.mp3',
    'assets/longSounds/chicks.mp3',
    'assets/longSounds/elephant.mp3',
    'assets/longSounds/frog.mp3',
    'assets/longSounds/monkeys.mp3',
    'assets/longSounds/peacock.mp3'
  ];
  List<String> pictures = [
    'assets/img/umbrella.png',
    'assets/img/wolf-howling-at-the-moon.png',
    'assets/img/chicken.png',
    'assets/img/elephant-side-view.png',
    'assets/img/tropical-frop.png',
    'assets/img/monkey-facing-right.png',
    'assets/img/peacock.png',
  ];
  late AudioPlayer player;
  String _titleSound = "";

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

  Future<void> playShortSound(int soundNumber) async {
    await player.setAsset(shortSounds[soundNumber]);
    player.play();
  }

  Future<void> playLongSound(int soundNumber) async {
    await player.setAsset(longSounds[soundNumber]);
    player.play();
  }

  String displaySoundText(String originalSoundText) {
    String maNouvelleString = originalSoundText.substring(
        originalSoundText.lastIndexOf("/") + 1,
        originalSoundText.lastIndexOf("."));
    return maNouvelleString;
  }

  String displayCategory(int number) {
    String maString = '';
    return maString.substring(
        maString.indexOf("/") + 1, maString.lastIndexOf("/"));
  }

  buildkey(
      {required int number,
      String fileSoundName = '',
      required Color col,
      String? description}) {
    _titleSound = displaySoundText(shortSounds[number]);
    // _titleSound = displaySoundText(shortSounds[number]) +        ' / ' +        displaySoundText(longSounds[number]);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(col),
          ),
          onPressed: () async {
            playShortSound(number);
          },
          onLongPress: () async {
            playLongSound(number);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                _titleSound,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 50.0,
                    fontFamily: "FrederickatheGreat"),
              ),
              Image(
                image: AssetImage(pictures[number]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
// TODO I need to revise the size the text in the piano tiles for the landscape configuration.
          child: Column(
            children: <Widget>[
              buildkey(number: 0, col: Colors.red, fileSoundName: _titleSound),
              buildkey(number: 1, col: Colors.orange, description: _titleSound),
              buildkey(number: 2, col: Colors.yellow, description: _titleSound),
              buildkey(
                  number: 3, col: Colors.greenAccent, description: _titleSound),
              buildkey(number: 4, col: Colors.teal, description: _titleSound),
              buildkey(number: 5, col: Colors.blue, description: _titleSound),
              buildkey(number: 6, col: Colors.purple, description: _titleSound)
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
      ),
    );
  }
}
