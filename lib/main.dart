import 'package:fbapp/provider/auth_provider.dart';
import 'package:fbapp/provider/count_provider.dart';
import 'package:fbapp/provider/example_one_provider.dart';
import 'package:fbapp/provider/theme_changer.dart';
import 'package:fbapp/screens/count_example.dart';
import 'package:fbapp/screens/default.dart';
import 'package:fbapp/screens/exeample_one_provider.dart';
import 'package:fbapp/screens/login_screen.dart';
import 'package:fbapp/screens/notifi_listerner_screen.dart';
import 'package:fbapp/views/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCJXLeoynI4CCdAEYwoy9C0dhgTHPk2y5o",
      appId: "1:892300016188:android:9c5feacc101dbbcec72139",
      messagingSenderId: "892300016188",
      projectId: "fb-app-69822",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            home: Login(),
          );
        }));
  }
}
