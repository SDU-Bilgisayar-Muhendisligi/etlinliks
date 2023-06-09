import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisacaberkproje/customdraver.dart';
import 'package:kisacaberkproje/etkinlikdetay.dart';
import 'package:kisacaberkproje/etkinlikekle.dart';
import 'package:kisacaberkproje/etkinliklist.dart';
import 'package:kisacaberkproje/register.dart';
import 'package:kisacaberkproje/service/firebase_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  CollectionReference noteref = FirebaseFirestore.instance.collection("etkinlik");
  FirebaseService _firebaseService = FirebaseService();
  Future<List<Etkinlikler>> etkinliklerigetir() async {
    var etkinlikListesi = <Etkinlikler>[];
    var e1 = Etkinlikler(1, "Sokrat ft. Şanışer St.", "06 Ocak 2023, Cuma - 22:30", "KONSER", "Bahçelievler, Süleyman Demirel Cd. No:81, 32040 Merkez/Isparta ", "150", "Rap müziğinin sevilen sanatçıları Şanışer ve Sokrat St Türkiye turnesi ile rapin nabzını tutmaya devam ediyor. Siz de bu başarılı ikilinin bestelerini canlı bir şekilde dinlemek için biletler tükenmeden konserde yerinizi ayırmayı unutmayın.", "skrte.jpg", "Holly Stone Performance Hall");
    var e2 = Etkinlikler(2, "Bisiklet Binelim!", "07 Ocak 2023 Cumartesi-11:30", "BİSİKLET", "Gökçay", "Ücretsiz", "Cumartesi sabahı Gökçayda bisiklet süreceğim. Birlikte bisiklet binebiliriz!!", "bisiklet.png", "Ramazan Ekim");
    var e3 = Etkinlikler(2, "Mevlüt Yemeği", "09 Ocak 2023 Pazartesi-14:00", "DİĞER", "Fatih Mah 4519 Sokak Hengame Tekel Karşısı Ara Sokak", "Ücretsiz", "Haftaya Mahallemizde mevlüt var benim gibi öğrenci arkadaşları bekliyorum.", "mevlut.png", "Mustafa Berk Alpay");

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
        title: Center(
            child:
            Padding(
                padding: const EdgeInsets.only(right: 1),
                child: Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      'Etkinliks',
                      style: TextStyle(
                          fontSize: 32,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.white,
                          fontWeight: FontWeight.bold,fontFamily: "monalisa"),
                    ),
                    // Solid text as fill.
                    Text("Etkinliks",style: TextStyle(color: Color(0xff880E4F) ,fontWeight: FontWeight.bold,fontSize:32,fontFamily: "monalisa"),),
                  ],
                )
            )
        ),
        actions: [
          IconButton(
              onPressed: (){
                showSearch(
                    context: context,
                    delegate: CustomSearch()
                );
              },
              icon: const Icon(Icons.search)),
        ],
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
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => EtkinlikEkle()));
        },
        child: Icon(Icons.add),
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
                      child: Row(
                        children: [
                          Icon(Icons.filter_alt_outlined,color: Color(0xff871351),size: 35),
                          Text("Fitrele",style: TextStyle(color: Color(0xff871351),fontSize: 18),),
                          Icon(Icons.keyboard_arrow_down,color: Color(0xff871351),size: 25),
                        ],
                      ),
                    ),
                    SizedBox(width: Ekrangenisligi/50,),
                    Container(
                      child: Row(
                        children: [
                          Text("Şuna Göre Sırala:",style: TextStyle(color: Colors.grey,fontSize: 15),),
                          Text("Yaklaşan Etkinlikler",style: TextStyle(color: Color(0xff871351),fontSize: 15),),
                          Icon(Icons.keyboard_arrow_down,color: Color(0xff871351),size: 25),
                        ],
                      ),
                    ),
                  ],
                ),
              ), //filtreler
            ), //filtreler
            Divider(color: Colors.grey,thickness: 2,indent: 13,endIndent: 13,),
            SizedBox(
              height: Ekranyuksekligi/1.25,
              child:
              /* StreamBuilder<QuerySnapshot>(stream: noteref.snapshots(),
              builder: (context,snapshot){
                if (snapshot.hasError){
                  return Text("Problmeo");
                }
                if (snapshot.connectionState == ConnectionState.waiting){
                  return Text("loading..");
                }
                if (snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,i){
                        return Text("${snapshot.data!.docs[i]["etk_tur"]}");
                      });
                }
                return Text("loadingcc");
              },
              ), */
              StreamBuilder<QuerySnapshot>(
                stream: noteref.where("Etk_sehir", isEqualTo: "Denizli").snapshots(),
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
                              var etkinlikListesi = <Etkinlikler>[];
                              var etkinlik = Etkinlikler(2,"${snapshot.data!.docs[i]["Etk_ad"]}", "${snapshot.data!.docs[i]["etk_tarih"]}", "${snapshot.data!.docs[i]["etk_tur"]}", "${snapshot.data!.docs[i]["etk_konum"]}", "${snapshot.data!.docs[i]["Etk_ucret"]}", "${snapshot.data!.docs[i]["Etk_aciklama"]}", "${snapshot.data!.docs[i]["etk_resim"]}", "${snapshot.data!.docs[i]["user_id"]}",);
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
                                SizedBox(
                                    height: Ekranyuksekligi /60
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
            )],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    "America","Russia","musia"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
          onPressed: (){
            query = "";
          },
          icon: const Icon(Icons.clear)
      )
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData){
      if (item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();List<String> matchQuery = [];
    for (var item in allData){
      if (item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }

}