import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisacaberkproje/Profil.dart';
import 'package:kisacaberkproje/etkinlikekle.dart';
import 'package:kisacaberkproje/favorietkinliklerim.dart';
import 'package:kisacaberkproje/login.dart';

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
                        context, MaterialPageRoute(builder: (context) => Profil()));
                  }, iconData: CupertinoIcons.profile_circled, title: "Profilim"),
              _draweritem(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => FavoriEtkinliklerim()));
                  }, iconData: CupertinoIcons.star_fill, title: "Favori Etkinlikler"),
              _draweritem(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => EtkinlikEkle()));
                  }, iconData: CupertinoIcons.plus_circled, title: "Etkinlik Ekle"),

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
