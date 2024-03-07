import 'package:capstone/src/views/homeScreen/HomeScreen.dart';
import 'package:capstone/src/views/loginScreen/LoginScreen.dart';
import 'package:capstone/src/views/profileScreen/ProfileScreen.dart';
import 'package:capstone/src/views/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == HomeScreen.routeName) {
            return MaterialPageRoute(builder: (context) => HomeScreen());
          } else if (settings.name == ProfileScreen.routeName) {
            return MaterialPageRoute(builder: (context) => ProfileScreen());
          }
          return null;
        },
        home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: customBottomNavBar(onTabTapped, _currentIndex));
  }
}