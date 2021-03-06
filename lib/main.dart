import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/providers/user_provider.dart';
import 'package:instaclone/responsiv/mobile_screen_layout.dart';
import 'package:instaclone/responsiv/responsiv_layout_screen.dart';
import 'package:instaclone/responsiv/webscreenlayout.dart';
import 'package:instaclone/screen/login_screen.dart';

import 'package:instaclone/utilities/colors.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBuZrzghaXl846p1L3L2kR3ksSny1oItO8",
        appId: "1:78797791112:web:bad1fe35e747840a1ea43d",
        messagingSenderId: "78797791112",
        projectId: "insta-a166c",
        storageBucket: "insta-a166c.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insta-Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
              return const LoginScreen();
            }),
      ),
    );
  }
}
