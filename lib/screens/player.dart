import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SongPlayer extends StatefulWidget {
  late String artWorkUrl;
  late String trackName;
  late String artistName;
  late String previewUrl;
  late bool currentStat;
  late PlayerState playerState;
  SongPlayer(
      {required this.artWorkUrl,
      required this.artistName,
      required this.previewUrl,
      required this.trackName,
      required this.currentStat,
      super.key});

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  AudioPlayer songPlayer = AudioPlayer();
  Duration fullDuration = const Duration(seconds: 0);
  Duration currentDuration = const Duration(seconds: 0);

  int elapsed = 0;

  getSongDetails() {
    songPlayer.onDurationChanged.listen((Duration fDuration) {
      setState(() {
        fullDuration = fDuration;
      });
    });
    songPlayer.onPositionChanged.listen((Duration cDuration) {
      setState(() {
        currentDuration = cDuration;
      });
    });
    songPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getSongDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.network(
              widget.artWorkUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.trackName,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.artistName,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Text(
                  currentDuration.inSeconds.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
                Expanded(
                  child: Slider(
                      value: (currentDuration.inSeconds <
                              fullDuration.inSeconds)
                          ? (currentDuration.inSeconds / fullDuration.inSeconds)
                          : 0,
                      onChanged: (value) {
                        print("this is the req value $value");
                        int reqDuration =
                            (value * fullDuration.inSeconds).toInt();
                        songPlayer.seek(Duration(seconds: reqDuration));
                        setState(() {});
                      }),
                ),
                Text(fullDuration.inSeconds.toString()),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.no_accounts)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.skip_previous)),
              IconButton(
                  iconSize: 60,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    widget.currentStat
                        ? songPlayer.stop()
                        : songPlayer.play(UrlSource(widget.previewUrl));

                    widget.currentStat = !widget.currentStat;
                    setState(() {});
                  },
                  icon:
                      Icon(widget.currentStat ? Icons.pause : Icons.play_arrow)

                  // size: 80,
                  ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.skip_next)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.repeat)),
            ],
          ),
        ],
      ),
    ));
  }
}
