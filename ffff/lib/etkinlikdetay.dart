import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisacaberkproje/etkinliklist.dart';
import 'package:kisacaberkproje/register.dart';

class etkinlikdetay extends StatefulWidget {
  final Etkinlikler etkinlik;
  etkinlikdetay({Key? key, required this.etkinlik}) : super(key: key);


  @override
  State<etkinlikdetay> createState() => _etkinlikdetayState();
}

class _etkinlikdetayState extends State<etkinlikdetay> {

  var tfcontroller = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 3,left: 15),
                child: Text(
                  "Etkinlik  >  ${widget.etkinlik.etk_tur}  > ${widget.etkinlik.etk_ad}",
                  style: TextStyle(
                    color: Color(0xff8f6982),
                  ),
                ),
              ),
              height: Ekranyuksekligi /30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: SizedBox(
                      width: Ekrangenisligi /1,
                      child: Container(
                        decoration:  BoxDecoration (
                          color:  Color(0xff8f6982),
                          borderRadius:  BorderRadius.only (
                            topLeft:  Radius.circular(24),
                            topRight:  Radius.circular(24),
                            bottomRight:  Radius.circular(39),
                            bottomLeft:  Radius.circular(39),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Ekranyuksekligi % 25,
                            ),
                            Container(
                              height: Ekranyuksekligi /3,
                              width: Ekrangenisligi /1.5,
                              decoration:  BoxDecoration(
                                borderRadius:  BorderRadius.only (
                                  topLeft:  Radius.circular(24),
                                  topRight:  Radius.circular(24),
                                  bottomRight:  Radius.circular(39),
                                  bottomLeft:  Radius.circular(39),
                                ),
                                image:  DecorationImage(
                                  image:  AssetImage("resimler/${widget.etkinlik.resim_ad}"),
                                  fit: BoxFit.cover,
                                ),
                              ),

                            ),
                            Container(
                              height: Ekranyuksekligi /15,
                              width: Ekrangenisligi /1,
                              // decoration:  BoxDecoration(color: Colors.white),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Container(
                                      height: Ekranyuksekligi /30,
                                      width: Ekrangenisligi /5,
                                      decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius:  BorderRadius.only (
                                          topLeft:  Radius.circular(24),
                                          topRight:  Radius.circular(24),
                                          bottomRight:  Radius.circular(24),
                                          bottomLeft:  Radius.circular(24),
                                        ),
                                      ),
                                      child: Center(child: Text(widget.etkinlik.etk_tur,style: TextStyle(color: Colors.white, fontSize: 18),)),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.system_security_update_good,color: Colors.lightBlue,),
                                          Text(widget.etkinlik.etk_kullanici, style: TextStyle(color: Colors.white,fontSize: 12),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ),
                            Container(
                              width: Ekrangenisligi /1.1,
                               //decoration:  BoxDecoration(color: Colors.red),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.etkinlik.etk_ad,
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: Color(0xFF372F2F),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.system_security_update_good,color: Colors.white, size: 35,),
                                        SizedBox(width: Ekrangenisligi/50,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          child: Column(
                                            children: [
                                            Container(
                                                width: Ekrangenisligi/1.25,
                                                child: Text(widget.etkinlik.etk_tarih, style: TextStyle(color: Colors.white,fontSize: 25), ))],),
                                        )
                                      ],),),

                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(CupertinoIcons.clock_fill,color: Colors.white,size: 35),
                                        SizedBox(width: Ekrangenisligi/50,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          child: Column(
                                            children: [
                                              Container(
                                                  width: Ekrangenisligi/1.25,
                                                  child: Text("7 Saat Kaldı", style: TextStyle(color: Colors.white,fontSize: 25), ))],),
                                        )
                                      ],),),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(CupertinoIcons.location_solid,color: Colors.white,size: 35),
                                        SizedBox(width: Ekrangenisligi/50,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          child: Column(
                                            children: [
                                              Container(
                                                  width: Ekrangenisligi/1.25,
                                                  child: Text(widget.etkinlik.etk_adres, style: TextStyle(color: Colors.white,fontSize: 20), ))],),
                                        )
                                      ],),),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(CupertinoIcons.tags_solid,color: Colors.white,size: 35),
                                        SizedBox(width: Ekrangenisligi/50,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          child: Column(
                                            children: [
                                              Container(
                                                  width: Ekrangenisligi/1.25,
                                                  child: Text(widget.etkinlik.etk_fiyat, style: TextStyle(color: Colors.white,fontSize: 25), ))],),
                                        )
                                      ],),),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: Ekrangenisligi/50,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          child: Column(
                                            children: [
                                              Container(
                                                  width: Ekrangenisligi/1.25,
                                                  child: Text(widget.etkinlik.etk_detay, style: TextStyle(color: Colors.white,fontSize: 20), ))],),
                                        )
                                      ],),),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),

                ),
              ),
            ),
            SizedBox(
                height: Ekranyuksekligi /60
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.1,),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff880E4F),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => kayitol()));
                        },
                        child: Text("Favorilere Ekle",style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                      ),
                    ),
                  ],),
              ),
            ),
            SizedBox(
                height: Ekranyuksekligi /40
            ),

          ],
        ),
      ),
    );
  }
}
