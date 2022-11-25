import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        title: Text(
          "Settings",
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        elevation: 10,
        shadowColor: Color(0xff20ae72),
        backgroundColor: Color(0xff20ae72),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: Text("Emoji Settings", textAlign: TextAlign.center),
          ),
          Row(
            children: [
              TextButton(onPressed: () {}, child: Text("Emoji")),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "No Emoji",
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
          Container(
            color: Colors.amber,
            height: 60,
            child: Text("Rate Us"),
            margin: EdgeInsets.only(top: 1, bottom: 1),
          ),
          Container(
            color: Colors.pinkAccent,
            height: 60,
            child: Text("Share"),
            margin: EdgeInsets.only(top: 1, bottom: 1),
          ),
        ],
      ),
    );
  }
}
