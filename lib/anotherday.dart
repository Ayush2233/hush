import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnotherDayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F8FF),
        toolbarHeight: 170,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Another day',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF323339),
                ),
              ),
            ),
            SizedBox(height: 8), // Add spacing of 8 between "Another Day" and "17th May 2023"
            Text(
              '17th May 2023',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF323339),
                ),
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF323339),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last night, I went to bed at 11:00 PM feeling slightly tired after a long day. I followed my usual bedtime routine, which includes reading a book for about 30 minutes to relax my mind. Thankfully, I didn\'t experience any difficulties falling asleep; I quickly drifted off into a peaceful slumber.\n\nDuring the night, I woke up once around 3:00 AM. It took me a few minutes to fall back asleep, but overall, it didn\'t disrupt my sleep too much. I\'m glad it was just a brief interruption.',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF000000),
                ),
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}


