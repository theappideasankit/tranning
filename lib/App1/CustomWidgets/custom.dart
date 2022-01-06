import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomWidget {
  // ignore: non_constant_identifier_names
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText1,
          titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
        cardColor: Colors.white,
        canvasColor: creamColor,
        // ignore: deprecated_member_use
        accentColor: darkBlueGrey,
        // ignore: deprecated_member_use
        buttonColor: darkbuttonColor,
        fontFamily: GoogleFonts.lato().fontFamily,
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        cardColor: Colors.black26,
        canvasColor: darkBlueGrey,
        primarySwatch: Colors.blueGrey,
        // ignore: deprecated_member_use
        accentColor: Colors.white,
        // ignore: deprecated_member_use
        buttonColor: darkbuttonColor,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.white),
            toolbarTextStyle: Theme.of(context).textTheme.bodyText1,
            // ignore: deprecated_member_use
            textTheme: Theme.of(context).textTheme.copyWith(
                headline6:
                    context.textTheme.headline6.copyWith(color: Colors.white))),
        fontFamily: GoogleFonts.lato().fontFamily,
      );

  //colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color blueGrey = Vx.blueGray600;
  static Color darkBlueGrey = Vx.gray900;
  static Color darkColor = const Color(0xFF263238);
  static Color lightbuttonColor = Vx.blueGray700;
  static Color darkbuttonColor = Vx.blueGray600;
  static Color priceColor = Vx.red900;
}
