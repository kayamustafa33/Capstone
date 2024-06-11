import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okculuk_federasyonu/src/blocks/Auth/auth_bloc.dart';
import 'package:okculuk_federasyonu/src/blocks/ClubBloc/club_bloc.dart';
import 'package:okculuk_federasyonu/src/services/club_service.dart';
import 'package:okculuk_federasyonu/src/views/loginScreen/LoginScreen.dart';
import 'package:okculuk_federasyonu/src/views/splashScreen/SplashScreen.dart';
import 'src/services/auth_service.dart';
import 'src/views/homeScreen/HomeScreen.dart';
import 'src/views/ScoresScreen/ScoresScreen.dart';
import 'src/views/profileScreen/ProfileScreen.dart';
import 'src/views/widgets/bottomNavBar.dart';
import 'src/models/User.dart';

void main() {
  runApp(const MyApp());
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
        },
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({super.key, required this.user});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late final List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = [
      HomeScreen(user: widget.user),
      const ScoresScreen(),
      const ProfileScreen(),
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: customBottomNavBar(onTabTapped, _currentIndex),
    );
  }
}
