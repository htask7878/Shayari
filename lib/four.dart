import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari/all_shayari.dart';

class four extends StatefulWidget {
  List<String> l;
  int index;

  four(this.l, this.index);

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  double textsize = 20;
  String changetext = "";
  Color backgrod = Colors.blueGrey;
  Color textcolor = Colors.white70;
  bool lightTheme = true;
  String emoj = "☺💓🧡💚🙂";
  List mytext = ["t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"];
  String mytext1 = "";
  bool bg = false;
  List<Color> current_gra_color = [Colors.blueGrey, Colors.blueGrey];

  String dr_path = "";
  GlobalKey globalKey = GlobalKey();

  Future<Uint8List> _capturePng() async {
    var pngBytes;
    try {
      RenderRepaintBoundary boundary =
      globalKey.currentContext!.findRenderObject()  as RenderRepaintBoundary ;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
       pngBytes = byteData!.buffer.asUint8List();
   //   var bs64 = base64Encode(pngBytes);
    } catch (e) {}
    return pngBytes;
  }
//TODO initstate
  @override
  void initState() {
    super.initState();
    folder();
  }

  folder() async {
    // Directory dr = Directory((Platform.isAndroid
    //             ? await getExternalStorageDirectory() //FOR ANDROID
    //             : await getApplicationSupportDirectory() //FOR IOS
    //         )!
    //         .path +
    //     "Shayari");

    var path = await ExternalPath.getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_DOWNLOADS) +
        "/Shayari";
    Directory dr = Directory(path);

    if (await dr.exists()) {
      print("Already create");
    } else {
      //jo file create ny hoy to thashe
      dr.create();
    }
    dr_path = dr.path;
  }



  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        useWhiteForeground(backgrod) ? Colors.white : Colors.black;
    return AnimatedTheme(
      data: lightTheme ? ThemeData.light() : ThemeData.dark(),
      child: Builder(
        builder: (context) {
          return DefaultTabController(
            length: 1,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Edit Page",
                    style: GoogleFonts.roboto(
                      color: lightTheme ? Colors.white : Colors.black,
                    ),
                  ),
                  elevation: 10,
                  shadowColor: Color(0xff20ae72),
                  backgroundColor: Color(0xff20ae72),
                  foregroundColor: foregroundColor,
                  actions: [
                    FloatingActionButton.extended(
                      label: Icon(
                        lightTheme ? Icons.dark_mode_outlined
                            : Icons.light_mode_outlined,
                        color: lightTheme ? Colors.white : Colors.black,
                      ),
                      extendedPadding: EdgeInsets.all(15),
                      highlightElevation: 12,
                      onPressed: () {
                        setState(() {
                          lightTheme = !lightTheme;
                        });
                      },
                      elevation: 15,
                      foregroundColor: foregroundColor,
                    ),
                  ],
                ),
                body: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: RepaintBoundary(
                                    key: globalKey,
                                    child: Container(
                                      //TODO a Containar ma hight apvi ny..
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: bg ? backgrod : null,
                                        gradient: bg
                                            ? null
                                            : LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: current_gra_color,
                                              ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          bottomLeft: Radius.circular(7),
                                          topRight: Radius.circular(7),
                                          bottomRight: Radius.circular(7),
                                        ),
                                      ),
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Text(
                                          "${emoj}\n${widget.l[widget.index]}\n${emoj}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              wordSpacing: 2,
                                              color: textcolor,
                                              fontFamily: mytext1,
                                              fontSize: textsize,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.italic)),
                                    ),
                                  ),
                                  margin: EdgeInsets.all(20),
                                );
                              },
                            ),
                          ),
                        ),
                      )),
                      Container(
                        height: 150,
                        color: Color(0x4C260E11),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 1),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        barrierColor: Colors.transparent,
                                        builder: (context) {
                                          return Container(
                                            height: 400,
                                            color: Colors.white,
                                            // margin: EdgeInsets.all(10),
                                            child: GridView.builder(
                                              padding: EdgeInsets.all(5),
                                              scrollDirection: Axis.vertical,
                                              itemCount: all_shayari
                                                  .gradiantcolor.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      current_gra_color =
                                                          all_shayari.gradiantcolor[
                                                              index];
                                                      bg = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text("Shayri",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                        textAlign:
                                                            TextAlign.center),
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: all_shayari
                                                                  .gradiantcolor[
                                                              index]),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                  ),
                                                );
                                              },
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      // childAspectRatio: 2,
                                                      // mainAxisExtent: 100,
                                                      crossAxisSpacing: 10,
                                                      mainAxisSpacing: 10,
                                                      crossAxisCount: 2),
                                            ),
                                          );
                                        }, context: context,
                                      );
                                    },
                                    splashColor: Colors.purpleAccent,
                                    icon: Icon(Icons.zoom_out_map,
                                        color: Colors.red, size: 25),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      bg = false;
                                      int nu = Random().nextInt(
                                          all_shayari.changecolor.length);
                                      setState(() {
                                        current_gra_color =
                                            all_shayari.changecolor[nu];
                                      });
                                    },
                                    icon: Icon(
                                      Icons.autorenew_rounded,
                                      color: Colors.red,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                              height: 40,
                              width: 120,
                              color: Colors.white,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          barrierDismissible: false,
                                          barrierColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return SimpleDialog(
                                              backgroundColor: Colors.black,
                                              elevation: 20,
                                              children: [
                                                Container(
                                                  height: 350,
                                                  color: Color(0xf0ea9e9e),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    child: ColorPicker(
                                                        pickerAreaHeightPercent: 0.8,
                                                        onColorChanged:
                                                            (value) {
                                                          setState(() {
                                                            backgrod = value;
                                                            bg = true;
                                                          });
                                                        },
                                                        pickerColor: backgrod),
                                                  ),
                                                ),
                                                CloseButton(
                                                  color: Colors.red,
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text("Background",
                                          style: GoogleFonts.lato(
                                            // color: Colors.white,
                                            color: lightTheme
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                        ),
                                        fixedSize: Size(105, 40),
                                        primary: Color(0xffE2252E),
                                        onPrimary: Colors.purpleAccent,
                                        padding: EdgeInsets.all(1),
                                        elevation: 2,
                                      )
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          barrierDismissible: false,
                                          barrierColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return SizedBox(
                                              height: 500,
                                              child: SimpleDialog(
                                                elevation: 20,
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                                children: [
                                                  SizedBox(
                                                    height: 350,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: BlockPicker(
                                                          onColorChanged:
                                                              (value) {
                                                            setState(() {
                                                              textcolor = value;
                                                            });
                                                          },
                                                          pickerColor:
                                                              textcolor),
                                                    ),
                                                  ),
                                                  CloseButton(
                                                    color: Colors.red,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "Text Color",
                                        style: GoogleFonts.lato(
                                          color: lightTheme
                                              ? Colors.white
                                              : Colors.black,
                                          // color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                        ),
                                        fixedSize: Size(105, 40),
                                        primary: Color(0xffE2252E),
                                        onPrimary: Colors.purpleAccent,
                                        padding: EdgeInsets.all(1),
                                        elevation: 2,
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        DateTime datetime = DateTime.now();
                                        String setin =
                                            "${datetime.year.toString() +
                                            datetime.month.toString() +
                                            datetime.day.toString() +
                                            datetime.hour.toString()+
                                            datetime.minute.toString()+
                                            datetime.second.toString()+
                                        datetime.microsecond.toString()
                                        }";
                                        _capturePng().then((value) {
                                          print(_capturePng());
                                          String image1 = "${dr_path}/${setin}.png";
                                          File Createfile = File(image1);
                                          Createfile.writeAsBytes(value).then((value) {
                                            print(value.path);
                                            Share.shareFiles([value.path]);
                                          });
                                        });
                                      },
                                      child: Text("Share",
                                          style: GoogleFonts.lato(
                                            color: lightTheme ? Colors.white : Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                        ),
                                        fixedSize: Size(105, 40),
                                        primary: Color(0xffE2252E),
                                        onPrimary: Colors.purpleAccent,
                                        padding: EdgeInsets.all(1),
                                        elevation: 2,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          isDismissible: false,
                                            barrierColor: Colors.transparent,
                                            builder: (context) {
                                              return Container(
                                                margin: EdgeInsets.all(15),
                                                color: Colors.black,
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        child: StatefulBuilder(
                                                          builder: (context, setState1) {
                                                            return Slider(
                                                                inactiveColor: Colors.grey,
                                                                activeColor: Color(0xffE2252E),
                                                                thumbColor: Color(0xffE2252E),
                                                                min: 10,
                                                                max: 60,
                                                                onChanged: (value) {
                                                                  textsize = value;
                                                                  setState1(() {});
                                                                  setState(() {});
                                                                },
                                                                value: textsize);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        icon: Icon(
                                                          Icons.highlight_remove_sharp,
                                                          color: Color(0xffE2252E),
                                                          size: 25,
                                                        )),
                                                  ],
                                                ),
                                              );
                                            },
                                            context: context);
                                      },
                                      child: Text("Text Size",
                                          style: GoogleFonts.lato(
                                            color: lightTheme
                                                ? Colors.white
                                                : Colors.black,
                                            // color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                        ),
                                        fixedSize: Size(105, 40),
                                        primary: Color(0xffE2252E),
                                        onPrimary: Colors.purpleAccent,
                                        padding: EdgeInsets.all(1),
                                        elevation: 2,
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            isDismissible: false,
                                            barrierColor: Colors.transparent,
                                            builder: (context) {
                                              return Container(
                                                color: Colors.grey[400],
                                                height: 250,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: GridView.builder(
                                                        itemCount: all_shayari
                                                            .emoji.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                emoj = all_shayari
                                                                        .emoji[
                                                                    index];
                                                              });
                                                            },
                                                            child: Container(
                                                              color:
                                                                  Colors.black,
                                                              child: Text(
                                                                all_shayari
                                                                        .emoji[
                                                                    index],
                                                              ),
                                                              margin: EdgeInsets
                                                                  .all(0.2),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                            ),
                                                          );
                                                        },
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 1,
                                                          childAspectRatio: 7,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        color: Colors.black,
                                                        child: CloseButton(
                                                          color:
                                                              Color(0xffE2252E),
                                                        )),
                                                  ],
                                                ),
                                              );
                                            },
                                            context: context);
                                      },
                                      child: Text("Emoji",
                                          style: GoogleFonts.lato(
                                            color: lightTheme
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                        ),
                                        fixedSize: Size(105, 40),
                                        primary: Color(0xffE2252E),
                                        onPrimary: Colors.purpleAccent,
                                        padding: EdgeInsets.all(1),
                                        elevation: 2,
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            isDismissible: false,
                                            builder: (context) {
                                              return Container(
                                                height: 150,
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.all(15),
                                                color: Colors.black,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: ListView.builder(
                                                        padding: EdgeInsets.all(40),
                                                        itemCount:
                                                            mytext.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Container(
                                                            alignment: Alignment.center,
                                                            margin: EdgeInsets.all(5),
                                                            height: 100,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(0xffE2252E),
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                Radius.circular(10),
                                                                  ),
                                                            ),
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  mytext1 = mytext[index];
                                                                });
                                                              },
                                                              child: Text(
                                                                "Shayari",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(height: 2,
                                                                  color: lightTheme
                                                                      ? Colors.white
                                                                      : Colors.black,
                                                                  fontFamily: mytext[index],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        icon: Icon(
                                                          Icons.highlight_remove_outlined,
                                                          color:Color(0xffE2252E),
                                                          size: 30,
                                                        )),
                                                  ],
                                                ),
                                              );
                                            },
                                            context: context,
                                            barrierColor: Colors.transparent);
                                      },
                                      child: Text(
                                        "Font",
                                        style: GoogleFonts.lato(
                                          color: lightTheme
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                        ),

                                        fixedSize: Size(105, 40),
                                        primary: Color(0xffE2252E),
                                        onPrimary: Colors.purpleAccent,
                                        padding: EdgeInsets.all(1),
                                        elevation: 2,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
