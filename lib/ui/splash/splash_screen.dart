import 'package:covid_track_task/ui/Main/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dimensions.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: Offset(
        0,
        1,
      ),
      end: Offset(0, 0),
    ).animate(_animationController);
    _animationController.forward().whenComplete(() {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => MainScreen()));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: Dimensions.marginSize*2,
                    right: Dimensions.marginSize*2,
                    top: Dimensions.heightSize*18,
                    bottom: Dimensions.heightSize*18,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 3))
                  ),
                  child: Image.asset(
                    'assets/images/logo.jpg'
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Dimensions.heightSize * 5,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Covid_19 Tracker',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: Dimensions.extraLargeTextSize,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
