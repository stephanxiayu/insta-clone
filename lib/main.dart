import 'package:flutter/material.dart';
import 'package:instaclone/responsiv/mobile_screen_layout.dart';
import 'package:instaclone/responsiv/responsiv_layout_screen.dart';
import 'package:instaclone/responsiv/webscreenlayout.dart';
import 'package:instaclone/utilities/colors.dart';
import 'package:instaclone/utilities/dimentions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insta-Clone',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: mobileBackgroundColor, ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
