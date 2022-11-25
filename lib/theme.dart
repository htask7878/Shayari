import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class theme extends StatefulWidget {
  const theme({Key? key}) : super(key: key);

  @override
  State<theme> createState() => _themeState();
}

class _themeState extends State<theme> {
  bool lightTheme = true;
  Color backgrod = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        useWhiteForeground(backgrod) ? Colors.white : Colors.black;

    return AnimatedTheme(
      data: lightTheme ? ThemeData.light() : ThemeData.dark(),
      child: Builder(builder: (context) {
        return DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: AppBar(
              elevation: 10,
              shadowColor: Color(0xff20ae72),
              backgroundColor: Color(0xff20ae72),
              foregroundColor: foregroundColor,
            ),
            floatingActionButton: FloatingActionButton.extended(
              extendedPadding: EdgeInsets.all(15),
              highlightElevation: 12,
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              splashColor: Colors.purpleAccent,
              onPressed: () {
                setState(() {
                  lightTheme = !lightTheme;
                });
              },
              label: Icon(lightTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              elevation: 15,
              foregroundColor: foregroundColor,
            ),
          ),
        );
      }),
    );
  }
}
