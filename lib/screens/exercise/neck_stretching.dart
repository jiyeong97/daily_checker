import 'package:daily_checker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NeckStretching extends StatefulWidget {
  const NeckStretching({super.key});

  @override
  State<NeckStretching> createState() => NeckStretchings();
}

class NeckStretchings extends State<NeckStretching> {
  final videoURL = "https://youtu.be/dJXZRZvqbYg?si=aiu28M5H8rrK9PgE";

  late YoutubePlayerController _controller;
  final image = 'assets/image/OrangeCatPaw.png';
  bool neckStretching = false;

  bool onClick(){
    print('true');
    return neckStretching = true;
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
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                ).then(
                  (value) => setState(() {
                    NeckStretchings().neckStretching = true;
                  }),
                );
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
