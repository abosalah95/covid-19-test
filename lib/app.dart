import 'package:covid_track_task/ui/Main/main_screen.dart';
import 'package:covid_track_task/ui/splash/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.lightBlue.shade700;
    final primaryColorLight = Colors.white;
    final primaryColorDark = Colors.black;
    final accentColor =Colors.lightBlue.shade200;
    final cardColor = Colors.white;
    // final backgroundColor =  Colors.grey.shade800;
    final backgroundColor = Colors.grey.shade100;
    final errorColor = Colors.red.shade600;

    return  MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primaryColor: primaryColor,
          primaryColorLight: primaryColorLight,
          primaryColorDark: primaryColorDark,
          primaryColorBrightness: Brightness.light,
          accentColor: accentColor,
          accentColorBrightness: Brightness.light,
          backgroundColor:backgroundColor ,
          cardColor: cardColor,
          /////////////////////////  Text  ////////////////////////////////
          textTheme: GoogleFonts.cairoTextTheme().copyWith(),
          primaryTextTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'cairo',
            ),
          ),
          accentTextTheme: TextTheme(
            button: TextStyle(color: Colors.white,fontFamily: 'cairo'),
          ),
          ///////////////////////     cardTheme   ////////////////////////////
          // cardTheme: CardTheme(
          //   color: Colors.white,
          //   elevation: 6.0,
          //  margin: const EdgeInsets.all(4.0),
          //  shape: cardRounded,
          // ),
          //////////////////////////////////////////////////////////////////
          buttonTheme: ButtonThemeData(
            buttonColor: primaryColor,
            textTheme: ButtonTextTheme.primary,
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.white,
            textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 25,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          /////////////////////////////////////////////////////////////////////
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16,
            ),
            errorStyle: TextStyle(color: errorColor),
//            labelStyle: inputTheme.labelStyle,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorColor, width: 1.5),
            ),
          ),
          /////////////////////////////////////////////////////////////////////
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
            splashColor: accentColor,
            elevation: 4.0,
            highlightElevation: 2,
          ),
        ),
        home: SplashScreen()
      );
  }
}