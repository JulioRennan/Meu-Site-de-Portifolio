import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rennan_portifolio/app/app_screen.dart';
import 'package:rennan_portifolio/themes/theme/default_app_theme.dart';
import 'package:rennan_portifolio/utils/manager_routes.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Bem-vindo',
      theme: defaultAppTheme,
      routes: {
        '/hideContacts': (BuildContext context) {
          ManagerApp.hideContacts = true;
          return WillPopScope(
            child: const AppScreen(),
            onWillPop: () async => false,
          );
        },
        '/': (BuildContext context) => const AppScreen(),
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
