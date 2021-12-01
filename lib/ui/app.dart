import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_event/ui/theme/theme.dart';
import 'package:core_event/ui/pages/content_start.dart';
import 'package:core_event/ui/pages/authentication/usr_login.dart';
import 'package:core_event/ui/pages/authentication/usr_register.dart';
import 'package:core_event/ui/widgets/flex_exp.dart';
import 'package:core_event/ui/pages/content/content_main_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Core Event v1.04',
      //theme: ThemeData(primarySwatch: Colors.black),
      theme: MyTheme.ligthTheme,
      // Establecemos el tema oscuro
      darkTheme: MyTheme.darkTheme,
      // Por defecto tomara la seleccion del sistema
      themeMode: ThemeMode.system,
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
              title: 'Registro',
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
