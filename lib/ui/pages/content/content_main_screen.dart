import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:core_event/ui/widgets/appbar.dart';
//import 'package:app/Constants/Constants.dart';
//import 'package:app/Screens/CreateTweetScreen.dart';
//import 'package:app/Screens/HomeScreen.dart';
//import 'package:app/Screens/NotificationsScreen.dart';
//import 'package:app/Screens/ProfileScreen.dart';
//import 'package:app/Screens/SearchScreen.dart';

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

  _logout() {
    try {
      Get.offNamed('/');
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
          tile: const Text("Bienvenido Usuario currentUserId"),
          context: context,
          onSignOff: () {
            _logout();
          }),
      //body: _widgets.elementAt(_selectIndex),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            // Aqui es donde se enlazan con los otros widgets
            //child: [].elementAt(_selectedTab),
          ),
        ),
      ),
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
          BottomNavigationBarItem(icon: Icon(Icons.logout_rounded)),
        ],
      ),
    );
  }
}
