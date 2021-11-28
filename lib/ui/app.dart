import 'package:flutter/material.dart';
import 'package:core_event/ui/pages/main.dart';
import 'package:core_event/ui/pages/autentication/usr_login.dart';
import 'package:core_event/ui/pages/autentication/usr_register.dart';
import 'package:core_event/ui/widgets/flex_exp.dart';
import 'package:core_event/ui/pages/content/feed_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Core Event v1.02',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const InicioWidget(
              title: 'Main',
            ),
        '/usr_login': (context) => const LoginWidget(
              title: 'Login',
            ),
        '/usr_register': (context) => const RegisterWidget(
              title: 'Register',
            ),
        '/feed_screen': (context) => const FeedScreen(
              title: 'Feeds',
              currentUserId: 'pepe',
            ),
        '/flex': (context) => const FlexExpand(title: 'Flex'),
      },
    );
  }
}
