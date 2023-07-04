import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kisacaberkproje/homeview.dart';
import 'package:kisacaberkproje/login.dart';
class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;
  Future<void> signUp(BuildContext context,{required String id,required String name, required String email, required String sehir, required String password}) async{
    final navigator = Navigator.of(context);
    try {
      var userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null){
        await userCollection.doc(userCredential.user!.uid).set({
          "e_mail": email,
          "kullanici_ad": name,
          "sifre": password,
          "sehir": sehir,
          "id": userCredential.user!.uid,
        });
        navigator.push(MaterialPageRoute(builder: (context)=> girissayfasi(),));
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> singIn(BuildContext context,{required String email, required String password}) async{
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential != null){
        Fluttertoast.showToast(msg: "Giriş Başarılı", toastLength: Toast.LENGTH_LONG);
        navigator.push(MaterialPageRoute(builder: (context)=> HomeView(),));
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> _registerUser({required id,required String name, required String email, required String password}) async{

  }
}