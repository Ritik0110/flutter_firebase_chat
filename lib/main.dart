import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/authentication/login_screen.dart';


import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(saveThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.saveThemeMode});
  final AdaptiveThemeMode? saveThemeMode;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorSchemeSeed: Colors.deepPurple),
      dark: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.deepPurple),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase chat',
        home: const LoginScreen(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}