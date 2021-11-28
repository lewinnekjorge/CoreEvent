import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:twitter/Constants/Constants.dart';
//import 'package:twitter/Screens/CreateTweetScreen.dart';
//import 'package:twitter/Screens/HomeScreen.dart';
//import 'package:twitter/Screens/NotificationsScreen.dart';
//import 'package:twitter/Screens/ProfileScreen.dart';
//import 'package:twitter/Screens/SearchScreen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key, required this.title, required this.currentUserId})
      : super(key: key);
  final String title;
  final String currentUserId;
  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        activeColor: Colors.deepPurple,
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
