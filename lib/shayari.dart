import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shayari/all_shayari.dart';
import 'package:shayari/second.dart';
import 'package:shayari/setting.dart';

class shayri extends StatefulWidget {
  const shayri({Key? key}) : super(key: key);

  @override
  State<shayri> createState() => _shayriState();
}

class _shayriState extends State<shayri> {
  bool t = true;

  @override
  void initState() {
    all_shayari mo = all_shayari();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Shayari",
            style: GoogleFonts.roboto(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff20ae72),
          elevation: 10,
          shadowColor: Color(0xff20ae72),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    onTap: ()  {
                       Navigator.pushReplacement(context,
                          MaterialPageRoute(
                            builder: (context) {
                              return setting();
                            },
                      ));
                      print("hi hardik..");
                    },
                    // value: 1,
                    child: Text(
                      "Settings",
                    )),
                PopupMenuItem(
                    // value: 2,
                    child: Text("Share"),
                    onTap: () {
                      FlutterShare.share(
                        title: "HardikShayri",
                        linkUrl: "https://Shayari/",
                        text: 'Example share text',
                        chooserTitle: 'Example Chooser Title',
                      );
                    }),
                PopupMenuItem(
                  // value: 3,
                  child: Text("Rate Us"),
                ),
                PopupMenuItem(
                  onTap: () {

                  },
                  value: 4,
                  child: Text("Exit"),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.grey[300],
        body: Container(
          // decoration:
          // BoxDecoration(
          // image: DecorationImage(image: AssetImage("image/page.jpg"),
          // fit: BoxFit.cover,
          //   ),),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTapDown: (details) {
                  t = true;
                  print("on Tap Down");
                },
                onTapCancel: () {
                  t = false;
                  print("on tap cancel");
                },
                onTapUp: (details) {
                  t = false;
                  print("on tap up");
                },
                child: Card(
                  // elevation: 3,
                  color: Colors.white,
                  margin: EdgeInsets.all(7),
                  shadowColor: Colors.grey[500],
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return second(index);
                        },
                      ));
                    },
                    title: Text(
                      "${all_shayari.s_name[index]}",
                      style: GoogleFonts.lato(
                          color: Color(0xff20ae72), fontSize: 18),
                    ),
                    leading: Container(
                      height: 50,//
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(1),
                          bottomRight: Radius.circular(1),
                          topLeft: Radius.circular(1),
                          topRight: Radius.circular(1),
                        ),
                        image: DecorationImage(
                          image: AssetImage("${all_shayari.s_photo[index]}"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: all_shayari.s_name.length,
            separatorBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                height: 4,
                margin: EdgeInsets.only(top: 1),
              );
            },
          ),
        ),
      ),
    );
  }
}
