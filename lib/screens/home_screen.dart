import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:daily_checker/screens/exercise/hip_workout.dart';
import 'package:daily_checker/screens/exercise/leg_stretching.dart';
import 'package:daily_checker/screens/exercise/leg_workout.dart';
import 'package:daily_checker/screens/exercise/neck_stretching.dart';
import 'package:daily_checker/screens/exercise/waist_workout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String formattedDate = DateFormat.MMMMd('en_US').format(DateTime.now());
  bool neckStretchingComplete = false;
  bool waistWorkOutComplete = false;
  bool legStretchingComplete = false;
  bool legWorkOutComplete = false;
  bool hipWorkOutComplete = false;
  SharedPreferences? prefs;
  int total = 0;

  @override
  void initState() {
    super.initState();
    initPref();
  }

  Future<void> initPref() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      total = prefs?.getInt('total') ?? 0;
    });

    totalSum();
  }

  void totalSum() {
    if (prefs != null) {
      setState(() {
        int incrementCount = 0;

        if (neckStretchingComplete) incrementCount++;
        if (waistWorkOutComplete) incrementCount++;
        if (legStretchingComplete) incrementCount++;
        if (legWorkOutComplete) incrementCount++;
        if (hipWorkOutComplete) incrementCount++;

        total += incrementCount;

        prefs?.setInt('total', total);
      });
    }
  }

  void updateNeckStretchingBool(bool value) {
    setState(() {
      neckStretchingComplete = value;
    });
    totalSum();
  }

  void updateWaistWorkOutBool(bool value) {
    setState(() {
      waistWorkOutComplete = value;
    });
    totalSum();
  }

  void updateLegStretchingBool(bool value) {
    setState(() {
      legStretchingComplete = value;
    });
    totalSum();
  }

  void updateLegWorkOutBool(bool value) {
    setState(() {
      legWorkOutComplete = value;
    });
    totalSum();
  }

  String imgchange() {
    if (total % 5 == 0) {
      return 'assets/image/SleepCat.png';
    } else if (total % 5 == 1) {
      return 'assets/image/EyesOnYouOrangeCat.png';
    } else if (total % 5 == 2) {
      return 'assets/image/OrangeCat.png';
    } else if (total % 5 == 3) {
      return 'assets/image/HighFiveOrangeCat.png';
    } else if (total % 5 == 4) {
      return 'assets/image/ThumbsUpOrangeCat.gif';
    }
    return '';
  }

  void updateHipWorkOutBool(bool value) {
    setState(() {
      hipWorkOutComplete = value;
    });
    totalSum();
  }

  @override
  Widget build(BuildContext context) {
    String img;
    img = imgchange();
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
                img,
                width: 300,
                height: 300,
                gaplessPlayback: true,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NeckStretching(),
                  ),
                );
                if (result != null) {
                  updateNeckStretchingBool(result);
                }
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
                      neckStretchingComplete ? Icons.pets : null,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LegStretching(),
                  ),
                );
                if (result != null) {
                  updateLegStretchingBool(result);
                }
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
                      legStretchingComplete ? Icons.pets : null,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WaistWorkout(),
                  ),
                );
                if (result != null) {
                  updateWaistWorkOutBool(result);
                }
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
                      waistWorkOutComplete ? Icons.pets : null,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HipWorkout(),
                  ),
                );
                if (result != null) {
                  updateHipWorkOutBool(result);
                }
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
                      hipWorkOutComplete ? Icons.pets : null,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LegWorkout(),
                  ),
                );
                if (result != null) {
                  updateLegWorkOutBool(result);
                }
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
                      legWorkOutComplete ? Icons.pets : null,
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
