import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shayari/all_shayari.dart';
import 'package:shayari/third.dart';

class second extends StatefulWidget {
  int index;

  second(this.index);

  @override
  State<second> createState() => _secondState();
}

List<String> l = [];

class _secondState extends State<second> {

  @override
  void initState() {
    super.initState();
    if (widget.index == 0) {
      l = all_shayari.be;
    } else if (widget.index == 1) {
      l = all_shayari.holi;
    } else if (widget.index == 2) {
      l = all_shayari.life;
    } else if (widget.index == 3) {
      l = all_shayari.polit;
    } else if (widget.index == 4) {
      l = all_shayari.sad;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${all_shayari.s_name[widget.index]}",
            style: GoogleFonts.roboto(
              color: Colors.white
            ),
          ),
          elevation: 10,
          shadowColor: Color(0xff20ae72),
          backgroundColor: Color(0xff20ae72),
          actions: [

          ],
        ),
        body: Container(

          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(7),
                shadowColor: Colors.grey[500],
                child: Container(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return third(index, l);
                        },
                      ));
                      setState(() {});
                    },
                    title: Text("${l[index]}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(color: Colors.white70),
                    ),
                  ),

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        (Color(0xff607D8F)),
                        (Color(0xff607D8F)),
                        (Color(0xff607D8F)),

                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: l.length,
          ),
        ),
        backgroundColor: Colors.grey[300],

      ),
    );
  }
}
