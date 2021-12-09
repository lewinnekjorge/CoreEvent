import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:core_event/domain/controller/authentication_controller.dart';
import 'package:core_event/domain/controller/chat_controller.dart';
import 'package:core_event/domain/controller/firestore_controller.dart';
import 'package:core_event/domain/use_cases/controllers/ui.dart';
import 'package:core_event/domain/use_cases/theme_management.dart';
import 'firebase_central.dart';
import 'package:core_event/ui/theme/theme.dart';
import 'package:core_event/ui/pages/content_start.dart';
import 'package:core_event/ui/pages/authentication/usr_login.dart';
import 'package:core_event/ui/pages/authentication/usr_register.dart';
import 'package:core_event/ui/pages/content/content_main_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // The future is part of the state of our widget. We should not call `initializeApp`
  // directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _stateManagementInit();
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Wrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          _firebaseStateInit();
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Core Event v1.07',
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
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const MaterialApp(
          home: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  void _stateManagementInit() {
    // Dependency Injection
    UIController uiController = Get.put(UIController());
    uiController.themeManager = ThemeManager();

    // Reactive
    ever(uiController.reactiveBrightness, (bool isDarkMode) {
      uiController.manager.changeTheme(isDarkMode: isDarkMode);
    });
  }

  _firebaseStateInit() {
    Get.put(FirebaseController());
    Get.put(AuthenticationController());
    Get.put(ChatController());
    return const FirebaseCentral();
  }
}

class Wrong extends StatelessWidget {
  const Wrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Hubo un error con firebase"));
  }
}
