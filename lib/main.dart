import 'package:capstone/src/blocks/Auth/auth_bloc.dart';
import 'package:capstone/src/blocks/ClubBloc/club_bloc.dart';
import 'package:capstone/src/services/club_service.dart';
import 'package:capstone/src/views/loginScreen/LoginScreen.dart';
import 'package:capstone/src/views/splashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/services/auth_service.dart';
import 'src/views/homeScreen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authService: AuthService()),
        ),
        BlocProvider(
          create: (context) => ClubBloc(clubService: ClubService()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Archery app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        },
      ),
    );
  }
}
