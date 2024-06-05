import 'dart:async';
import 'package:flutter/material.dart';
import 'package:capstone/src/services/auth_service.dart';
import 'package:capstone/src/models/User.dart';
import '../../../main.dart';
import '../homeScreen/HomeScreen.dart';
import '../loginScreen/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    User? user = await _authService.getUser();
    Timer(const Duration(seconds: 3), () {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen(user: user)),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _opacity,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/final_logo.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
