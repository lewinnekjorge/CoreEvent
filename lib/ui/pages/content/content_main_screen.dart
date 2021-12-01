import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:core_event/ui/widgets/appbar.dart';
//import 'package:core_event/ui/pages/content/user_feeds/event_screen.dart';
import 'package:core_event/ui/pages/content/user_feeds/states_screen.dart';

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
  static List<Widget> _widgets = <Widget>[StatesScreen(), StatesScreen()];
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
      body: _widgets.elementAt(_selectedTab),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        activeColor: Colors.deepPurple,
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Estados"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity), label: "Eventos"),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: "Ubicación"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Personal"),
        ],
      ),
    );
  }
}
