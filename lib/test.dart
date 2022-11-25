import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class four extends StatefulWidget {
  List<String> l;
  int index;

  four(this.l, this.index);

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  List<Color> color = [
    Colors.green,
    Colors.red,
    Colors.indigoAccent,
    Colors.lime,
    Colors.deepPurple,
    Colors.orange,
    Colors.blue,
    Colors.teal,
    Colors.purpleAccent,
    Colors.black87,
  ];
  Color backgroundc = Colors.lightGreen;
  Color textcolor = Colors.lightGreen;
/* --------- Color Picker ----------*/

/* --------- Color Picker ----------*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shayari",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 10,
        shadowColor: Color(0xff20ae72),
        backgroundColor: Color(0xff20ae72),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share_rounded),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text("${widget.l[widget.index]}",
                    style: TextStyle(
                        color: textcolor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic)),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: backgroundc,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              color: Color(0x4C260E00),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          splashColor: Colors.purpleAccent,
                          icon: Icon(Icons.zoom_in_map,
                              color: Colors.red, size: 25),
                        ),
                        IconButton(
                          onPressed: () {},
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    color: Colors.grey[400],
                                    height: 150,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GridView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: color.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    backgroundc = color[index];
                                                  });
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: color[index],
                                                ),
                                              );
                                            },
                                            gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.close_rounded),
                                              color: Colors.red,
                                              splashColor: Colors.indigo),
                                          alignment: Alignment.topCenter,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text("Background",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                )),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(1)),
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
                                barrierColor: Colors.transparent,
                                builder: (context) {
                                  return Container(
                                    color: Colors.grey[400],
                                    height: 150,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: GridView.builder(
                                              itemCount: color.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      textcolor = color[index];
                                                    });
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    color: color[index],
                                                  ),
                                                );
                                              },
                                              gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                              ),
                                            )),
                                        Container(
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.close_rounded),
                                              color: Colors.red,
                                              splashColor: Colors.indigo),
                                          alignment: Alignment.topCenter,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                context: context,
                              );
                            },
                            child: Text("Text Color",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                )),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(1)),
                              ),
                              fixedSize: Size(105, 40),
                              primary: Color(0xffE2252E),
                              onPrimary: Colors.purpleAccent,
                              padding: EdgeInsets.all(1),
                              elevation: 2,
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Share.share("${widget.l[widget.index]}");
                            },
                            child: Text("Share",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                )),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(1)),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Font",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                )),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(1)),
                              ),
                              fixedSize: Size(105, 40),
                              primary: Color(0xffE2252E),
                              onPrimary: Colors.purpleAccent,
                              padding: EdgeInsets.all(1),
                              elevation: 2,
                            )),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Emoji",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                )),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(1)),
                              ),
                              fixedSize: Size(105, 40),
                              primary: Color(0xffE2252E),
                              onPrimary: Colors.purpleAccent,
                              padding: EdgeInsets.all(1),
                              elevation: 2,
                            )),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Text Size",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(1)),
                              ),
                              // side: ,
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
    );
  }
}
/*
------------theme-------
// floatingActionButton: FloatingActionButton.extended(
              //   label: Icon(lightTheme
              //       ? Icons.dark_mode_outlined
              //       : Icons.light_mode_outlined),
              //   extendedPadding: EdgeInsets.all(15),
              //   highlightElevation: 12,
              //   // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              //   splashColor: Colors.purpleAccent,
              //   onPressed: () {
              //     setState(() {
              //       lightTheme = !lightTheme;
              //     });
              //   },
              //   elevation: 15,
              //   foregroundColor: foregroundColor,
              // ),
 */