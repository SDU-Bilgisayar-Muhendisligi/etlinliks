
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kisacaberkproje/service/firebase_service.dart';
import 'package:kisacaberkproje/service/status.dart';
import 'package:kisacaberkproje/service/storage_service.dart';

class StatusService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StorageService _storageService = StorageService();
  String mediaUrl = "";

  Future<Status> addStatus (String etkid, PickedFile pickedFile) async{
    var ref = _firestore.collection("etkinlik");
    if (pickedFile == null){
      mediaUrl = "";
    } else {
      mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));
    }

    var documentRef = await ref.doc(etkid).update({
      "etk_resim" : mediaUrl,
    });
    return Status(id: etkid, image: mediaUrl);
  }


}