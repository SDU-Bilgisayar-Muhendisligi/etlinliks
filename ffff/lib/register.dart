import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kisacaberkproje/login.dart';
import 'package:kisacaberkproje/service/auth_service.dart';




class kayitol extends StatefulWidget {
  const kayitol({Key? key}) : super(key: key);

  @override
  State<kayitol> createState() => _kayitolState();
}

class _kayitolState extends State<kayitol> {
  late String email,sifre,sifretekrar,kullaniciadi;
  bool yuklenmedurumu = false;
  var _biseyanahtari= GlobalKey<FormState>();
  final TextEditingController _emailcontroller= TextEditingController();
  final TextEditingController _sifrecontroller= TextEditingController();
  final TextEditingController _kullanicicontroller= TextEditingController();
  final TextEditingController _sehircontroller= TextEditingController();
  @override

  Widget build(BuildContext context) {


    var Ekranbilgisi = MediaQuery.of(context);
    final double Ekranyuksekligi = Ekranbilgisi.size.height;
    final double Ekrangenisligi = Ekranbilgisi.size.width;
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.black, Colors.black12],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ).createShader(bounds),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("resimler/konsr.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.white60, BlendMode.darken),
                )),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        "Etkinliks",
                        style: TextStyle(
                            fontSize: 70,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.white,
                            fontWeight: FontWeight.bold,fontFamily: "monalisa"),
                      ),
// Solid text as fill.
                      Text("Etkinliks",style: TextStyle(color: Color(0xff880E4F) ,fontWeight: FontWeight.bold,fontSize:70,fontFamily: "monalisa"),),
                    ],
                  ),
                ),

                Form(
                  key: _biseyanahtari,
                  child: Container(

                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff880E4F).withOpacity(0.95),
                                borderRadius: BorderRadius.circular(35)),
                            child: TextFormField(
                              controller: _kullanicicontroller,
                              decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(vertical: 20),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Icon(Icons.supervised_user_circle),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Kullanıcı Adı",
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  )),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onChanged: (oge){
                                setState(() {
                                  kullaniciadi = oge;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff880E4F).withOpacity(0.95),
                                borderRadius: BorderRadius.circular(35)),
                            child: TextFormField(
                              controller: _sehircontroller,
                              decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(vertical: 20),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Icon(Icons.map),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Şehir",
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  )),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onChanged: (oge){
                                setState(() {
                                  kullaniciadi = oge;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xff880E4F).withOpacity(0.95),
                              borderRadius: BorderRadius.circular(35)),
                          child: TextFormField(
                            controller: _emailcontroller,
                            validator: (oge){
                              return oge!.contains("@") ? null : "bir mail adresi yazın";
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Icon(Icons.mail),
                                ),
                                border: InputBorder.none,
                                hintText: "Mail",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.go,
                            onChanged: (oge){
                              setState(() {
                                email=oge;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff880E4F).withOpacity(0.95),
                                borderRadius: BorderRadius.circular(35)),
                            child: TextFormField(
                              validator: (oge){
                                return oge!.length >= 6 ? null : "Şifre En az 6 karakter olmalı";
                              },
                              controller: _sifrecontroller,
                              decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(vertical: 20),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Icon(Icons.lock),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Şifre",
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  )),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.go,
                              onChanged: (oge){
                                setState(() {
                                  sifre=oge;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xff880E4F).withOpacity(0.95),
                              borderRadius: BorderRadius.circular(35)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Icon(Icons.lock),
                                ),
                                border: InputBorder.none,
                                hintText: "Şifre Tekrar",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.go,
                            onChanged: (oge){
                              setState(() {
                                sifretekrar=oge;
                              });
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).popUntil((route) => route.isFirst);
                              },
                              child: Text(
                                "Hesabım Var",
                                style: TextStyle(color: Color(0xff166cc2)),
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    yuklenmedurumu
                        ?Center(child: CircularProgressIndicator(),)
                        : Container(
                      decoration: BoxDecoration(
                          color: Color(0xffa5879b),
                          borderRadius: BorderRadius.circular(60)),
                      child: TextButton(
                        onPressed: () {
                          if(_biseyanahtari.currentState!.validate()&&sifre==sifretekrar) {
                            setState(() {
                              AuthService().signUp(context,
                                  name: _kullanicicontroller.text,
                                  email: _emailcontroller.text,
                                  password: _sifrecontroller.text,
                                  sehir: _sehircontroller.text,
                                  id: Random().nextInt(50000).toString());
                            });
                          }
                        },
                        child: Ink.image(
                          image:
                          AssetImage("resimler/Vector.png"),
                          width: Ekrangenisligi/10,
                          height: Ekranyuksekligi/18,

                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


}
