import 'package:core_event/domain/use_cases/controllers/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:core_event/domain/controller/authentication_controller.dart';
import 'package:core_event/ui/widgets/appbar.dart';
import 'package:core_event/ui/pages/content/user_feeds/states_screen.dart';
import 'package:core_event/ui/pages/content/public_events/public_events_screen.dart';
import 'package:core_event/ui/pages/content/chat/chat_page.dart';
import 'package:core_event/ui/pages/content/location/location_screen.dart';
import 'package:core_event/ui/pages/content/configuration/conf_screen.dart';

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
  AuthenticationController authenticationController = Get.find();
  static final List<Widget> _widgets = <Widget>[
    const StatesScreen(),
    const PublicEventsScreen(),
    const ChatScreen(),
    const LocationScreen(),
    const ConfScreen(),
  ];

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
    final UIController controller = Get.find<UIController>();

    return Scaffold(
      appBar: CustomAppBar(
          context: context,
          controller: controller,
          picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
          tile: Text("Welcome ${authenticationController.userEmail()}"),
          onSignOff: () {
            _logout();
          }),
//      body: _widgets.elementAt(_selectedTab),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _widgets.elementAt(_selectedTab),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.feed_rounded), label: "Estados"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity), label: "Eventos"),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: "Ubicación"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Ajustes"),
        ],
      ),
    );
  }
}
