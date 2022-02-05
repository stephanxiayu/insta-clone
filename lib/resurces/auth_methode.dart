import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/resurces/store_methods.dart';

class AuthMethode {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error sind aufgetreten";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) ;

      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      print(cred.user!.uid);

   String photourl=await   StorageMethodes().uploadImageToStorage('profilePics', file, false);

      await _firestore.collection('users').doc(cred.user!.uid).set({
        'username': username,
        'uid': cred.user!.uid,
        'email': email,
        'bio': bio,
        'followers': [],
        'following': [],
        'photoUrl':photourl,
      });
      res = "success";
    } on FirebaseAuthException catch(err){
      if(err.code== 'invalid-email'){
        res='Alter, keine richtige Email-Adresse';
      }else if(err.code=='weak-password'){
        res= 'Alter, 123456sieben ist kein sicheres Passwort';
      }
    }
    
    
    catch (err) {
      res = err.toString();
    }
    return res;
  }


  Future<String>loginUser({

   required String email,
   required String password,
  })async{
String res ='some error occurred'; try {

if(email.isNotEmpty||password.isNotEmpty){
 await _auth.signInWithEmailAndPassword(email: email, password: password);
 res='success';
}else{
  res='Du musst schon alles ausfüllen';
}

}on FirebaseAuthException catch(err){
      if(err.code== 'invalid-email'){
        res='Alter, keine richtige Email-Adresse';
      }else if(err.code=='weak-password'){
        res= 'Alter, 123456sieben ist kein sicheres Passwort';
      }
    }




catch(err){
res=err.toString();
} return res;
  }
}
