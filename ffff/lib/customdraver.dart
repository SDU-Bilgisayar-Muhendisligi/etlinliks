import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisacaberkproje/Profil.dart';
import 'package:kisacaberkproje/etkinlikekle.dart';
import 'package:kisacaberkproje/favorietkinliklerim.dart';
import 'package:kisacaberkproje/login.dart';

import 'Bize Ulaş.dart';
import 'Etkinliklerim.dart';
import 'kullanicibilgi.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(color: Color(0xff880E4F).withOpacity(0.5),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children:  [
               UserAccountsDrawerHeader(
                   accountName: Text("kisacaberk"),
                   accountEmail: Text("Üye"),
                   currentAccountPicture: CircleAvatar(
                     child: ClipOval(
                       child:Icon(Icons.person),
                     ),
                   ),
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage("resimler/menuetk.png"),
                     fit: BoxFit.cover,
                   )
                 ),
               ),

              _draweritem(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => EtkinlikEkle()));
                  }, iconData: CupertinoIcons.plus_circled, title: "Etkinlik Ekle"),
              Divider(color: Colors.grey,thickness: 2,indent: 13,endIndent: 13,),
              _draweritem(
                  onTap: () async {
                    var kullanici_ismi ="GGGGGsssaaG";
                    var currentuser= FirebaseAuth.instance.currentUser?.uid;
                    var response = await FirebaseFirestore.instance.collection("users").doc(currentuser).get();
                    var map =response.data!();
                    print(kullanici_ismi);
                    print(kullanici_ismi);
                    var kbilgilistesi = <kullanicibilgi>[];
                    var kbilgi = kullanicibilgi(2,"${map?["kullanici_ad"]}", "${map?["e_mail"]}", "${map?["sehir"]}", "${map?["sifre"]}");
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Profil(kbilgi: kbilgi)));
                  }, iconData: CupertinoIcons.profile_circled, title: "Profilim"),
              _draweritem(
                  onTap: ()async {
                    var kullanici_ismi ="GGGGGsssaaG";
                    var currentuser= FirebaseAuth.instance.currentUser?.uid;
                    var response = await FirebaseFirestore.instance.collection("users").doc(currentuser).get();
                    var map =response.data!();
                    print(kullanici_ismi);
                    print(kullanici_ismi);
                    var kbilgilistesi = <kullanicibilgi>[];
                    var kbilgi = kullanicibilgi(2,"${map?["kullanici_ad"]}", "${map?["e_mail"]}", "${map?["sehir"]}", "${map?["sifre"]}");
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => etkinliklerim(kbilgi: kbilgi)));
                  }, iconData: CupertinoIcons.tickets_fill, title: "Etkinliklerim"),

              _draweritem(
                  onTap: (){  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => bizeulas()));
                  }, iconData: CupertinoIcons.info_circle, title: "Bize Ulaş"),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => girissayfasi()));
                },
                leading: Icon(
                  Icons.logout,
                  color: Colors.white60,
                ),
                title: Text(
                  "Çıkış Yap",
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _draweritem(
      {required VoidCallback onTap,
        required IconData iconData,
        required String title}) =>
      ListTile(
        onTap: onTap,
       leading: Icon(
         iconData,
         color: Colors.white60,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white60,
      ),
    ),
  );
}
