import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisacaberkproje/homeview.dart';
import 'package:kisacaberkproje/login.dart';
import 'package:kisacaberkproje/service/firebase_service.dart';

class sifredegistir extends StatefulWidget {
  const sifredegistir({Key? key}) : super(key: key);

  @override
  State<sifredegistir> createState() => _sifredegistirState();
}

class _sifredegistirState extends State<sifredegistir> {
  late String sifremiz,mailimiz;
  final _formKey = GlobalKey<FormState>();
  var yenisifre = "";
  FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _sifrecontroller= TextEditingController();
  @override
  void dispose() {
    _sifrecontroller.dispose();
    super.dispose();
  }
  final currentUser= FirebaseAuth.instance.currentUser;
  changePassword() async{
    try{
      await currentUser!.updatePassword(yenisifre);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => girissayfasi(),
      ), // ), // Material Page Route
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black26,
        content: Text(" Your password has been Changed… Login again !"),
      ), // ), // Snack Bar
      ) ;
    } catch(error){

    }
  }
  bool yuklenmedurumu = false;
  @override
  Widget build(BuildContext context) {

    var Ekranbilgisi = MediaQuery.of(context);
    final double Ekranyuksekligi = Ekranbilgisi.size.height;
    final double Ekrangenisligi = Ekranbilgisi.size.width;
    return Stack(
      children: [
        Scaffold(
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
                SizedBox(
                  height: Ekranyuksekligi /5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

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

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Ekranyuksekligi % 93,
                ),
                Column(
                  children: [
                    yuklenmedurumu
                        ?Center(child: CircularProgressIndicator(),)
                        :Container(
                      decoration: BoxDecoration(
                          color: Color(0xffa5879b),
                          borderRadius: BorderRadius.circular(60)),
                      child: TextButton(
                        onPressed: () {
                          yenisifre = _sifrecontroller.text;
                          FirebaseService().updatesifre(yenisifre: yenisifre);
                          changePassword();

                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => HomeView()));
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
