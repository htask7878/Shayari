import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayari/shayari.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    loding();
  }

  loding() async {
    var status = await Permission.storage.status;
    if(status.isDenied)
      {
        await [Permission.storage].request();
      }
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return shayri();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Container(
                    color: Color(0xffFFFFFF),
                    child: Image(image: AssetImage("image/pngtree.jpg")),
                ),
            ),
            Container(
              width: double.infinity,
              color: Color(0xffFFFFFF),
              child: Text(
                "Hamna Avech...",
                textAlign: TextAlign.center,
                style: GoogleFonts.akronim(
                  letterSpacing: 2,
                  color: Color(0XffEFBF53),
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
