

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final usersCol = FirebaseFirestore.instance.collection("users");
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final etkinlikCol = FirebaseFirestore.instance.collection("etkinlik");
  final istekCol = FirebaseFirestore.instance.collection("istek");
  var currentuser = FirebaseAuth.instance.currentUser?.uid;

  Future<void> insertPost({required String etkId,
    required String etkAd,
    required String etkAciklama,
    required String etkUcret,
    required String etkKonum,
    required String etkTur,
    required String etkTarih,
    required String etkSehir,
    required String kullaniciAd,
  }) async {
    await usersCol.doc(currentuser).update({
      "posts": FieldValue.arrayUnion([{
        "id": etkId,
      }
      ])
    });
    await etkinlikCol.doc(etkId).set({

      "Etk_ad": etkAd,
      "Etk_aciklama": etkAciklama,
      "Etk_ucret": etkUcret,
      "Etk_sehir": etkSehir,
      "etk_konum": etkKonum,
      "etk_tur": etkTur,
      "etk_tarih": etkTarih,
      "user_id": kullaniciAd,
      "etk_id": etkId,

    });
  }

  //veri gösterme

  Future<void> updatesifre({required yenisifre}) async {
    await usersCol.doc(currentuser).update({
      "sifre": yenisifre,
    });
  }

  Future<void> updateetk({required String etkId,
    required String etkAd,
    required String etkAciklama,
    required String etkUcret,
    required String etkKonum,
    required String etkTarih,
    required String etkTur,
  }) async {
    print(etkId);
    await etkinlikCol.doc(etkId).update({
      "Etk_ad": etkAd,
      "Etk_aciklama": etkAciklama,
      "Etk_ucret": etkUcret,
      "etk_konum": etkKonum,
      "etk_tur": etkTur,
      "etk_tarih": etkTarih,
    });
    print("kontrol 4 ");
  }

  Future<void> istekekle({required String istekId,
    required String istekaciklama,
    required String kullaniciAd,
  }) async {
    await istekCol.doc(istekId).set({
      "istek_aciklama": istekaciklama,
      "user_id": kullaniciAd,
      "istek_id": istekId,
    });
  }
}

