import 'package:capstone/src/views/watchLiveScreen/widgets/LiveClubScreen.dart';
import 'package:capstone/src/views/watchLiveScreen/widgets/LiveScoresScreen.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';

class WatchLiveScreen extends StatelessWidget {
  const WatchLiveScreen({super.key});

  @override
  Widget build(BuildContext context){

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == LiveScoresScreen.routeName) {
            return MaterialPageRoute(builder: (context) => const LiveScoresScreen());
          } else if (settings.name == LiveClubScreen.routeName) {
            return MaterialPageRoute(builder: (context) => const LiveClubScreen());
          }
          return null;
        },
        home: const LiveScreen());
  }
}

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenStates();
}

class _LiveScreenStates extends State<LiveScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const LiveScoresScreen(),
    const LiveClubScreen(),
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
        bottomNavigationBar: customWatchLiveBottomNav(onTabTapped, _currentIndex));
  }
}