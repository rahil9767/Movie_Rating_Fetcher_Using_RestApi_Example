import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../view_model/services/splash_services.dart';
import 'home_screen.dart'; // Import your HomeScreen here

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      splashServices.checkAuthentication(context);
      _navigateToHomeScreen();
    });
  }

  void _navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              duration: const Duration(seconds: 1),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Opacity(
                  opacity:1.0,
                  child: child,
                );
              },
              child: Text(
                'EXPLORE MOVIE',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SpinKitFadingCircle(
              color: Colors.white,
              size: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
