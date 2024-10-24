import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LegStretching extends StatefulWidget {
  const LegStretching({super.key});

  @override
  State<LegStretching> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<LegStretching> {
  final videoURL = "https://youtu.be/--MMq6I07b4?si=wJToAMg680FC6nbE";

  late YoutubePlayerController _controller;
  final image = 'assets/image/OrangeCatPaw.png';
  bool legStretching = false;

  bool onClick(){
    return legStretching = true;
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
