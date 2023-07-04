import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kisacaberkproje/homeview.dart';
import 'package:kisacaberkproje/service/firebase_service.dart';
import 'etkinliklist.dart';

class bizeulas extends StatefulWidget {
  const bizeulas({Key? key}) : super(key: key);

  @override
  State<bizeulas> createState() => _bizeulasState();
}

class _bizeulasState extends State<bizeulas> {
  var tfcontroller = TextEditingController();
  Future<List<Etkinlikler>> etkinliklerigetir() async {
    var etkinlikListesi = <Etkinlikler>[];
    var e1 = Etkinlikler(1, "Sokrat ft. Şanışer St.", "29 Nisan 2023, Cumartesi - 22:30", "KONSER", "Bahçelievler, Süleyman Demirel Cd. No:81, 32040 Merkez/Isparta ", "150", "Rap müziğinin sevilen sanatçıları Şanışer ve Sokrat St Türkiye turnesi ile rapin nabzını tutmaya devam ediyor. Siz de bu başarılı ikilinin bestelerini canlı bir şekilde dinlemek için biletler tükenmeden konserde yerinizi ayırmayı unutmayın.", "skrte.jpg", "Holly Stone Performance Hall");
    var e2 = Etkinlikler(2, "Bisiklet Binelim!", "30 Nisan 2023 Pazar-11:30", "BİSİKLET", "Gökçay", "Ücretsiz", "Cumartesi sabahı Gökçayda bisiklet süreceğim. Birlikte bisiklet binebiliriz!!", "bisiklet.png", "Ramazan Ekim");
    var e3 = Etkinlikler(2, "Mevlüt Yemeği", "30 Nisan 2023 Pazar-14:00", "DİĞER", "Fatih Mah 4519 Sokak Hengame Tekel Karşısı Ara Sokak", "Ücretsiz", "Haftaya Mahallemizde mevlüt var benim gibi öğrenci arkadaşları bekliyorum.", "mevlut.png", "Mustafa Berk Alpay");

    etkinlikListesi.add(e1);
    etkinlikListesi.add(e2);
    etkinlikListesi.add(e3);
    return etkinlikListesi;
  }
  @override
  Widget build(BuildContext context) {
    var Ekranbilgisi = MediaQuery.of(context);
    final double Ekranyuksekligi = Ekranbilgisi.size.height;
    final double Ekrangenisligi = Ekranbilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Padding(
            padding: const EdgeInsets.only(right: 45),
            child: Stack(
              children: <Widget>[
// Stroked text as border.
                Text(
                  'Etkinliks',
                  style: TextStyle(
                      fontSize: 38,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.white,
                      fontWeight: FontWeight.bold,fontFamily: "monalisa"),
                ),
// Solid text as fill.
                Text("Etkinliks",style: TextStyle(color: Color(0xff880E4F) ,fontWeight: FontWeight.bold,fontSize:38,fontFamily: "monalisa"),),
              ],
            )
        )
        ),
        flexibleSpace: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[ Color(0xff880E4F), Color(0xff8F6982).withOpacity(0.95)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: Ekrangenisligi/1,
                height: Ekranyuksekligi/20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff8f6982),
                        borderRadius:  BorderRadius.only (
                          topLeft:  Radius.circular(24),
                          topRight:  Radius.circular(24),
                          bottomRight:  Radius.circular(24),
                          bottomLeft:  Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          children: [
                            Icon(Icons.star,color: Color(0xff871351),size: 25),
                            Text("Bize Ulaş",style: TextStyle(color: Color(0xff871351),fontSize: 28),),
                            Icon(Icons.keyboard_arrow_down,color: Color(0xff8f6982),size: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ), //filtreler
            ), //filtreler
            Divider(color: Color(0xff8f6982),thickness: 2,indent: 13,endIndent: 13,),
            SizedBox(
              height: Ekranyuksekligi/1.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: SizedBox(
                        width: Ekrangenisligi /1,
                        child: Container(
                          decoration:  BoxDecoration (
                            color:  Color(0xff871351),
                            borderRadius:  BorderRadius.only (
                              topLeft:  Radius.circular(20),
                              topRight:  Radius.circular(20),
                              bottomRight:  Radius.circular(95),
                              bottomLeft:  Radius.circular(95),
                            ),
                          ),
                          child: Column( //ana kolon
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text("Bir sorun, problem veya önerin varsa bize ulaşabilirsin",style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: Ekranyuksekligi /8,
                                  decoration: BoxDecoration(
                                      color: Color(0xffEBE4E4).withOpacity(0.95),
                                      borderRadius: BorderRadius.circular(80)),
                                  child: TextFormField(
                                    controller: tfcontroller,
                                    decoration: InputDecoration(
                                        contentPadding:
                                        const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                                        border: InputBorder.none,
                                        hintText: "Yazınız",
                                        hintStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        )),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.go,
                                    onChanged: (oge){
                                    },
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                    onPressed: () async {
                                      var kullanici_ismi ="GGGGGsssaaG";
                                      var currentuser= FirebaseAuth.instance.currentUser?.uid;
                                      var response = await FirebaseFirestore.instance.collection("users").doc(currentuser).get();
                                      var map =response.data!();
                                      print("gelen veri:" + map?["kullanici_ad"]);
                                      kullanici_ismi = map?["kullanici_ad"];
                                      final String istekId = Random().nextInt(50000).toString();
                                      FirebaseService().istekekle(istekId: istekId, istekaciklama: tfcontroller.text, kullaniciAd: kullanici_ismi);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView())).then((value) {
                                        Fluttertoast.showToast(msg: "İstek Yollandı");
                                      });
                                    },
                                    child: Text("Gönder",style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff871351),
                                    ),),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: Ekranyuksekligi /80
                              ),
                              //fotolu kısım
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: Ekranyuksekligi /60
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
