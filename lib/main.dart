import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'anotherday.dart'; // Import the AnotherDayPage

class JournalEntryPage extends StatefulWidget {
  @override
  _JournalEntryPageState createState() => _JournalEntryPageState();
}

class _JournalEntryPageState extends State<JournalEntryPage> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _titlecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F8FF),
        elevation: 0,
        title: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 0, top: 38),
          child: Text(
            'Your Sleep Journal For the Day',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                letterSpacing: 0.04,
                color: Color(0xFF323339),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titlecontroller,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextField(
              controller: _textEditingController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Write about how you feel!',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('notes').add(
                  {
                    'title':_titlecontroller.text,
                    'body':_textEditingController.text,
                    'date':DateTime.now()
                  }
                );
                // Do something with the journal entry (e.g., save it)
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('Save'),

            ),
          ],
        ),
      ),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(

    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  void _openJournalEntryPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JournalEntryPage()),
    );
  }

  void _openAnotherDayPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnotherDayPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F8FF),
        elevation: 0,
        title: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 18, top: 38),
          child: Text(
            'Your Sleep Journal',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                letterSpacing: 0.04,
                color: Color(0xFF323339),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -40,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              decoration: BoxDecoration(
                color: Color(0xFFF4F8FF),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(35, 60, 103, 0.3),
                    blurRadius: 3,
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 16,
            child: Transform.scale(
              scale: 1.2,
              child: Image.asset('assets/astronaut.png'),
            ),
          ),
          Positioned(
            top: 8,
            left: 16,
            child: Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 36),
              child: Text(
                'Write about how you feel!',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF323339),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 152,
            left: 19,
            child: GestureDetector(
              onTap: () => _openAnotherDayPage(context), // Open the AnotherDayPage
              child: Container(
                width: 370,
                height: 120,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(-1, -1),
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Another day',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xFF323339),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Last night, I went to bed at 11:00 PM feeling slightly tired after a long day.',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _openJournalEntryPage(context), // Open the journal entry page
            ),
          ),
        ],
      ),
    );
  }
}
