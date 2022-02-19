


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/screen/add_post_screen.dart';
import 'package:instaclone/screen/feed_screen.dart';
import 'package:instaclone/screen/profil_screen.dart';
import 'package:instaclone/screen/search_screen.dart';

const webScreenSize =600;

List<Widget> homeScreenItems=[
 const  FeedScreen(),
const SearchScreen(),
const AddPostScreen(),
Text("1"),
ProfileScreen(uid:FirebaseAuth.instance.currentUser!.uid ,),
];