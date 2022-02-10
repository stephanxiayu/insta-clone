import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/model/post.dart';
import 'package:instaclone/resurces/store_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String proImage,
  ) async {
    String res = "some error occurred";

    try {
      String photoUrl =
          await StorageMethodes().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();

      Post post = Post(
          description: description,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: photoUrl,
          likes: []); res='success';

      _firestore.collection('posts').doc(postId).set(post.toJason());
    } catch (err) {
      res=err.toString();
    }
    return res;
  }
}
