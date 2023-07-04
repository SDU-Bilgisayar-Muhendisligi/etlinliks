import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisacaberkproje/EtkinlikGuncel.dart';

import 'package:kisacaberkproje/register.dart';
import 'package:kisacaberkproje/service/firebase_service.dart';

import 'etkinlikdetay.dart';
import 'etkinliklist.dart';
import 'kullanicibilgi.dart';

class etkinliklerim extends StatefulWidget {
  final kullanicibilgi kbilgi;
  etkinliklerim({Key? key, required this.kbilgi}) : super(key: key);

  @override
  State<etkinliklerim> createState() => _etkinliklerimState();
}

class _etkinliklerimState extends State<etkinliklerim> {
  CollectionReference noteref = FirebaseFirestore.instance.collection("etkinlik");
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
    didChangeDependencies() {
    bilgigetir();
    super.setState(() {}); // to update widget data
    /// new

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
                            Text("Etkinliklerim",style: TextStyle(color: Color(0xff871351),fontSize: 28),),
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
              child: StreamBuilder<QuerySnapshot>(
                stream: noteref.where("user_id", isEqualTo: "${widget.kbilgi.kullanici_ad}").snapshots(),
                builder: (context,snapshot){
                  if (snapshot.hasError){
                    return Text("Problmeo");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return Text("loading..");
                  }
                  if(snapshot.hasData){
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,i){
                          return GestureDetector(
                            onTap: (){
                              print("okuyorum ben:${bilgigetir()}");
                              var etkinlikListesi = <Etkinlikler>[];
                              final etkidd= int.parse(snapshot.data!.docs[i]["etk_id"]);
                              var etkinlik = Etkinlikler(etkidd,"${snapshot.data!.docs[i]["Etk_ad"]}", "${snapshot.data!.docs[i]["etk_tarih"]}", "${snapshot.data!.docs[i]["etk_tur"]}", "${snapshot.data!.docs[i]["etk_konum"]}", "${snapshot.data!.docs[i]["Etk_ucret"]}", "${snapshot.data!.docs[i]["Etk_aciklama"]}", "${snapshot.data!.docs[i]["etk_resim"]}", "${snapshot.data!.docs[i]["user_id"]}");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => etkinlikdetay(etkinlik: etkinlik,)));
                            },
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
                                            topLeft:  Radius.circular(24),
                                            topRight:  Radius.circular(24),
                                            bottomRight:  Radius.circular(39),
                                            bottomLeft:  Radius.circular(39),
                                          ),
                                        ),
                                        child: Column( //ana kolon
                                          children: [
                                            SizedBox(
                                              height: Ekranyuksekligi % 25,
                                            ),
                                            Container(
                                              height: Ekranyuksekligi /4,
                                              width: Ekrangenisligi /1.2,
                                              decoration:  BoxDecoration(
                                                borderRadius:  BorderRadius.only (
                                                  topLeft:  Radius.circular(24),
                                                  topRight:  Radius.circular(24),
                                                ),
                                                image:  DecorationImage(
                                                  image:  NetworkImage("${snapshot.data!.docs[i]["etk_resim"]}"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(height: Ekranyuksekligi/150,),
                                                  Container(
                                                    height: Ekranyuksekligi /30,
                                                    width: Ekrangenisligi /1.5,
                                                    decoration: BoxDecoration(
                                                      color: Colors.indigo.withOpacity(0.5),
                                                      borderRadius:  BorderRadius.only (
                                                        topLeft:  Radius.circular(24),
                                                        topRight:  Radius.circular(24),
                                                        bottomRight:  Radius.circular(24),
                                                        bottomLeft:  Radius.circular(24),
                                                      ),
                                                    ),
                                                    child: Center(child: Text("${snapshot.data!.docs[i]["Etk_ad"]}",style: TextStyle(color: Colors.white, fontSize: 18),)),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          height: Ekranyuksekligi /30,
                                                          width: Ekrangenisligi /5,
                                                          decoration: BoxDecoration(
                                                            color: Colors.indigo.withOpacity(0.5),
                                                            borderRadius:  BorderRadius.only (
                                                              topLeft:  Radius.circular(24),
                                                              topRight:  Radius.circular(24),
                                                              bottomRight:  Radius.circular(24),
                                                              bottomLeft:  Radius.circular(24),
                                                            ),
                                                          ),
                                                          child: Center(child: Text("${snapshot.data!.docs[i]["etk_tur"]}",style: TextStyle(color: Colors.white, fontSize: 18),)
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Container(
                                                          height: Ekranyuksekligi /30,
                                                          width: Ekrangenisligi /5,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xff871351).withOpacity(0.5),
                                                            borderRadius:  BorderRadius.only (
                                                              topLeft:  Radius.circular(24),
                                                              topRight:  Radius.circular(24),
                                                              bottomRight:  Radius.circular(24),
                                                              bottomLeft:  Radius.circular(24),
                                                            ),
                                                          ),
                                                          child: Row(children: [
                                                            Icon(CupertinoIcons.clock_fill,color: Colors.white,size: 25,),
                                                            Center(child: Text("7 Saat",style: TextStyle(color: Colors.white, fontSize: 18),))
                                                          ],),
                                                        ),
                                                      ],),),
                                                  ),
                                                ],
                                              ),
                                            ), //fotolu kısım
                                            Container(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  /*sol sütun*/       Container(
                                                    width: Ekrangenisligi/2,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: Ekranyuksekligi/150,),
                                                        Container(//konum
                                                          child: Row(
                                                            children: [
                                                              Icon(CupertinoIcons.calendar,color: Colors.white,size: 35),
                                                              SizedBox(width: Ekrangenisligi/50,),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(vertical: 12),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                        width: Ekrangenisligi/2.9,
                                                                        child: Text("${snapshot.data!.docs[i]["etk_tarih"]}", style: TextStyle(color: Colors.white,fontSize: 15), ))],),
                                                              )
                                                            ],),),
                                                        SizedBox(height: Ekranyuksekligi/150,),
                                                        Container(//detay

                                                          width: Ekrangenisligi /2.2,
                                                          decoration: BoxDecoration(
                                                            color: Colors.indigo.withOpacity(0.5),
                                                            borderRadius:  BorderRadius.only (
                                                              topLeft:  Radius.circular(24),
                                                              topRight:  Radius.circular(24),
                                                              bottomRight:  Radius.circular(24),
                                                              bottomLeft:  Radius.circular(24),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(width: Ekrangenisligi/50,),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(vertical: 12),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                        width: Ekrangenisligi/2.4,
                                                                        child: Text("${snapshot.data!.docs[i]["Etk_aciklama"]}",overflow: TextOverflow.ellipsis, maxLines: 6, style: TextStyle(color: Colors.white,fontSize: 15), ))],),
                                                              )
                                                            ],),),
                                                      ],
                                                    ),
                                                  ),
                                                  /*sağ sütun*/      Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: Ekranyuksekligi/150,),
                                                        Container(//konum
                                                          child: Row(
                                                            children: [
                                                              Icon(CupertinoIcons.location_solid,color: Colors.white,size: 35),
                                                              SizedBox(width: Ekrangenisligi/50,),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(vertical: 12),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                        width: Ekrangenisligi/2.9,
                                                                        child: Text("${snapshot.data!.docs[i]["etk_konum"]}",overflow: TextOverflow.ellipsis, maxLines: 3, style: TextStyle(color: Colors.white,fontSize: 15, ), ))],),
                                                              )
                                                            ],),),
                                                        SizedBox(height: Ekranyuksekligi/150,),
                                                        Container(//fiyat
                                                          child: Row(
                                                            children: [
                                                              Icon(CupertinoIcons.tags_solid,color: Colors.white,size: 35),
                                                              SizedBox(width: Ekrangenisligi/50,),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(vertical: 12),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                        width: Ekrangenisligi/2.9,
                                                                        child: Text("${snapshot.data!.docs[i]["Etk_ucret"]}", style: TextStyle(color: Colors.white,fontSize: 20), ))],),
                                                              )
                                                            ],),),
                                                        SizedBox(height: Ekranyuksekligi/150,),
                                                        Container(//kişi
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons.system_security_update_good,color: Colors.lightBlue,),
                                                              SizedBox(width: Ekrangenisligi/50,),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(vertical: 12),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                        width: Ekrangenisligi/2.9,
                                                                        child: Text("${snapshot.data!.docs[i]["user_id"]}", style: TextStyle(color: Colors.white,fontSize: 13), ))],),
                                                              )
                                                            ],),),
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            SizedBox(height: Ekranyuksekligi/50,),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                               /* Padding(
                                  padding: const EdgeInsets.only(left: 0.1,),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(20)),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context, MaterialPageRoute(builder: (context) => kayitol()));
                                          },
                                          child: Text("Favorilerden Kaldır",style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),),
                                        ),
                                      ),
                                    ],),
                                  ),
                                ),*/
                                Column(
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
                                                SizedBox(
                                                  height: Ekranyuksekligi%20,
                                                ),
                                                Row(
                                                  children: [
                                                    Spacer(),
                                                    Center(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.blueAccent,
                                                            borderRadius: BorderRadius.circular(20)),
                                                        child: TextButton(
                                                          onPressed: ()async {
                                                            var etkinlikListesi = <Etkinlikler>[];
                                                            final etkidd= int.parse(snapshot.data!.docs[i]["etk_id"]);
                                                            var etkinlik = Etkinlikler(etkidd,"${snapshot.data!.docs[i]["Etk_ad"]}", "${snapshot.data!.docs[i]["etk_tarih"]}", "${snapshot.data!.docs[i]["etk_tur"]}", "${snapshot.data!.docs[i]["etk_konum"]}", "${snapshot.data!.docs[i]["Etk_ucret"]}", "${snapshot.data!.docs[i]["Etk_aciklama"]}", "${snapshot.data!.docs[i]["etk_resim"]}", "${snapshot.data!.docs[i]["user_id"]}");
                                                            Navigator.push(context,
                                                                MaterialPageRoute(builder: (context) => etkguncelle(etkinlik: etkinlik,)));
                                                          },
                                                          child: Text("Güncelle",style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.white,
                                                          ),),
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Center(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Color(0xffC3232D),
                                                            borderRadius: BorderRadius.circular(20)),
                                                        child: TextButton(
                                                          onPressed: ()async {
                                                            await snapshot.data!.docs[i].reference.delete();
                                                          },
                                                          child: Text("Sil",style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.white,
                                                          ),),
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: Ekranyuksekligi /110
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
                                SizedBox(
                                    height: Ekranyuksekligi /20
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  }else{
                    return Center();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future <dynamic> bilgigetir() async {
    super.didChangeDependencies();
    var kullanici_ismi ="GGGGGsssaaG";
    var currentuser= FirebaseAuth.instance.currentUser?.uid;
    var response = await FirebaseFirestore.instance.collection("users").doc(currentuser).get();
    var map =response.data!();
    print("gelen veri:" + map?["kullanici_ad"]);
    kullanici_ismi = map?["kullanici_ad"];
    print(kullanici_ismi);
    return kullanici_ismi.toString();
  }
}
