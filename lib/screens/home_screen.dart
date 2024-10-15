import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  String formattedDate = DateFormat.MMMMd('en_US').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    const image = 'assets/image/SleepCat.png';

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
            Container(
              height: 45,
              width: 320,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color:const Color(0xffcf6116),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(8, 5),
                    color: Colors.black.withOpacity(0.5),
                  )
                ],
              ),
              child: const Text(''),
            ),
            Container(
              height: 45,
              width: 320,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color:const Color(0xffe9a577),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(8, 5),
                    color: Colors.black.withOpacity(0.5),
                  )
                ],
              ),
              child: const Text(''),
            ),
            Container(
              height: 45,
              width: 320,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color:const Color(0xffcf6116),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(8, 5),
                    color: Colors.black.withOpacity(0.5),
                  )
                ],
              ),
              child: const Text(''),
            ),
            Container(
              height: 45,
              width: 320,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color:const Color(0xffe9a577),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(8, 5),
                    color: Colors.black.withOpacity(0.5),
                  )
                ],
              ),
              child: const Text(''),
            ),
            Container(
              height: 45,
              width: 320,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color:const Color(0xffcf6116),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(8, 5),
                    color: Colors.black.withOpacity(0.5),
                  )
                ],
              ),
              child: const Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
