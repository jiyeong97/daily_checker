import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WaistWorkout extends StatefulWidget {
  const WaistWorkout({super.key});

  @override
  State<WaistWorkout> createState() => WaistWorkOut();
}

class WaistWorkOut extends State<WaistWorkout> {
  final videoURL = "https://youtu.be/wptXCZuLF_g?si=Y4o-VBRro26ghLqq";

  late YoutubePlayerController _controller;
  final image = 'assets/image/OrangeCatPaw.png';
  bool waistWorkOut = false;

  bool onClick(){
    return waistWorkOut = true;
  }

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: const Color(0xffcf6116),
        foregroundColor: Colors.white,
        title: Center(
          child: Text(
            "The cat is watching you",
            style: TextStyle(
              fontSize: 35,
              fontFamily: GoogleFonts.dongle().fontFamily,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          GestureDetector(
            onTap: () {
              onClick();
            },
            child: Center(
              child: Image.asset(
                image,
                width: 300,
                height: 280,
              ),
            ),
          ),
          Center(
            child: Text(
              'High - Five',
              style: TextStyle(
                fontSize: 50,
                fontFamily: GoogleFonts.darumadropOne().fontFamily,
                color: const Color(0xffcf6116),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
