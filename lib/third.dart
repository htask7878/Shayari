import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari/four.dart';

class third extends StatefulWidget {
  int index;
  List<String> l = [];

  third(this.index, this.l);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  PageController pagecontroller = PageController();
  String emoj1 = "☺💓🧡💚🙂";
  @override
  void initState() {
    super.initState();
    pagecontroller = PageController(initialPage: widget.index);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          title: Text(
            "Shayari",
            style: GoogleFonts.roboto(
              color: Colors.white
            ),

          ),
          elevation: 10,
          shadowColor: Color(0xff20ae72),
          backgroundColor: Color(0xff20ae72),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: Colors.white,
            ),
          ],
        ),
        /////////////////////////////////////
        body: SafeArea(
          child: Container(
color: Colors.green,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${widget.index + 1}/${widget.l.length}",
                        style: TextStyle(fontSize: 15,
                            color: Colors.blueGrey,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        widget.index = value;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    controller: pagecontroller,
                    // pageSnapping: true,
                    itemCount: widget.l.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: page(),
                      );
                    },
                  ),
                ),
                //*************************************//
                Container(
                  margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      bottomLeft: Radius.circular(7),
                      topRight: Radius.circular(7),
                      bottomRight: Radius.circular(7),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          FlutterClipboard.copy("${widget.l[widget.index]}").then(
                            (value) => Fluttertoast.showToast(
                                msg: "Copied",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.black12,
                                fontSize: 16.0),
                          );
                        },
                        icon: Icon(Icons.file_copy_outlined,
                            color: Colors.white, size: 30),
                      ),
                      IconButton(
                        onPressed: () {
                          if (widget.index > 0) {
                            widget.index--;
                          } else {
                            widget.index = widget.l.length - 1;
                          }
                          pagecontroller.previousPage(
                              duration: Duration(microseconds: 200),
                              curve: Curves.easeInCubic);
                          setState(() {});
                          pagecontroller.animateToPage(widget.index,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInCubic);
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return four(widget.l, widget.index);
                            },
                          ));
                        },
                        icon: Icon(Icons.edit_off, color: Colors.white, size: 30),
                      ),
                      IconButton(
                        onPressed: () {
                          if (widget.index < widget.l.length - 1) {
                            widget.index++;
                          } else {
                            widget.index = 0;
                          }
                          pagecontroller.nextPage(
                              duration: Duration(microseconds: 200),
                              curve: Curves.easeInCubic);
                          setState(() {});
                          pagecontroller.animateToPage(widget.index,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInCubic);
                        },
                        icon: Icon(Icons.arrow_forward,
                            color: Colors.white, size: 30),
                      ),
                      IconButton(
                        onPressed: () {
                          Share.share("${widget.l[widget.index]}");
                        },
                        icon: Icon(Icons.share, color: Colors.white, size: 30),
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
  }

  page() {
    return Container(
      height: 500,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Text("${emoj1}\n${widget.l[widget.index]}\n${emoj1}",
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
              color: Colors.white70,
              wordSpacing: 2,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic
          ),
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7),
          bottomLeft: Radius.circular(7),
          topRight: Radius.circular(7),
          bottomRight: Radius.circular(7),
        ),
      ),
    );
  }
}
/*
 onPressed: () => pagecontroller.previousPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInCubic,

                    // setState(() {});
                  ),

                   // onPressed: () => pagecontroller.nextPage(
                  //     //easeInCubic
                  //     duration: Duration(milliseconds: 100),
                  //     curve: Curves.easeInCubic),
                  */
