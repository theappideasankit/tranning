import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primarySwatch: Colors.blueGrey,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      );
}
