import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:color_genrator/src/views/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8359837919145212~2959382747");
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Your Bist Color',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}

