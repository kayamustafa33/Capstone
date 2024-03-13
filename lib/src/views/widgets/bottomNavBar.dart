import 'package:flutter/material.dart';

Widget customBottomNavBar(Function onTabTapped, int currentIndex) {
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue,
    ),
    child: BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.transparent,
      elevation: 0,
      onTap: (value) {
        onTabTapped(value);
      },
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    ),
  );
}

Widget customWatchLiveBottomNav(Function onTabTapped, int currentIndex) {

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Image.asset('assets/star.png'),
      label: 'Scores',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/clubs.png'),
      label: 'Clubs',
    ),
  ];

  return Container(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue,
    ),
    child: BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.transparent,
      elevation: 0,
      onTap: (value) {
        onTabTapped(value);
      },
      currentIndex: currentIndex,
      items: bottomNavBarItems
    ),
  );
}
