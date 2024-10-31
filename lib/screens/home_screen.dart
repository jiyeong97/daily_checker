import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:daily_checker/screens/exercise/hip_workout.dart';
import 'package:daily_checker/screens/exercise/leg_stretching.dart';
import 'package:daily_checker/screens/exercise/leg_workout.dart';
import 'package:daily_checker/screens/exercise/neck_stretching.dart';
import 'package:daily_checker/screens/exercise/waist_workout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String formattedDate = DateFormat.MMMMd('en_US').format(DateTime.now());
  int total = 0;

  @override
  Widget build(BuildContext context) {
    const image = 'assets/image/SleepCat.png';
    const pawImg = 'assets/image/FoundationPaw.png';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                formattedDate,
                style: TextStyle(
                  fontFamily: GoogleFonts.darumadropOne().fontFamily,
                  fontSize: 58,
                  color: const Color(0xffcf6116),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                image,
                width: 300,
                height: 300,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NeckStretching()),
                ).then(
                  (value) => setState(() {
                  }),
                );
              },
              child: Container(
                height: 45,
                width: 320,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffcf6116),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(8, 5),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Neck stretching',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: GoogleFonts.dongle().fontFamily,
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Icon(
                      NeckStretchings().neckStretching ? Icons.pets : null,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LegStretching()),
                ).then(
                  (value) => setState(() {}),
                );
              },
              child: Container(
                height: 45,
                width: 320,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffe9a577),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(8, 5),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Leg stretching',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: GoogleFonts.dongle().fontFamily,
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Icon(
                      LegStretchings().legStretching ? Icons.pets : null,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WaistWorkout()),
                ).then(
                  (value) => setState(() {}),
                );
              },
              child: Container(
                height: 45,
                width: 320,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffcf6116),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(8, 5),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Waist work out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: GoogleFonts.dongle().fontFamily,
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Icon(
                      WaistWorkOut().waistWorkOut ? Icons.pets : null,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HipWorkout()),
                ).then(
                  (value) => setState(() {}),
                );
              },
              child: Container(
                height: 45,
                width: 320,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffe9a577),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(8, 5),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hip work out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: GoogleFonts.dongle().fontFamily,
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Icon(
                      HipWorkOut().hipWorkOut ? Icons.pets : null,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LegWorkout()),
                ).then(
                  (value) => setState(() {}),
                );
              },
              child: Container(
                height: 45,
                width: 320,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffcf6116),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(8, 5),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Leg work out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: GoogleFonts.dongle().fontFamily,
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Icon(
                      LegWorkOut().legWorkOut ? Icons.pets : null,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      pawImg,
                      width: 300,
                      height: 300,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: Text(
                        '$total',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                          fontFamily: GoogleFonts.dongle().fontFamily,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Total',
              style: TextStyle(
                fontSize: 80,
                fontFamily: GoogleFonts.darumadropOne().fontFamily,
                color: const Color(0xffcf6116),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
