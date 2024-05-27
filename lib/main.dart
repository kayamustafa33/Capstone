import 'package:capstone/src/blocks/Auth/auth_bloc.dart';
import 'package:capstone/src/views/loginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/services/auth_service.dart';
import 'src/views/homeScreen/HomeScreen.dart';
import 'src/models/User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authService: AuthService()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter MySQL Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        routes: {
          LoginPage.routeName: (context) => const LoginPage(),
          HomeScreen.routeName: (context) => HomeScreen(
              user:
                  User(userId: 0, name: "", password: "", role: "", email: "")),
        },
      ),
    );
  }
}
