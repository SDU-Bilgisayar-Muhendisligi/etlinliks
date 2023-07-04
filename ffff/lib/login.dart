import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisacaberkproje/homeview.dart';
import 'package:kisacaberkproje/register.dart';
import 'package:kisacaberkproje/service/auth_service.dart';
import 'package:kisacaberkproje/sifremiunuttum.dart';




class girissayfasi extends StatefulWidget {
  const girissayfasi({Key? key}) : super(key: key);

  @override
  State<girissayfasi> createState() => _girissayfasiState();
}

class _girissayfasiState extends State<girissayfasi> {
  late String sifremiz,mailimiz;
  bool yuklenmedurumu = false;
  final TextEditingController _emailcontroller= TextEditingController();
  final TextEditingController _sifrecontroller= TextEditingController();
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
                SizedBox(
                  height: Ekranyuksekligi % 30,
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
                            controller: _emailcontroller,
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
                            textInputAction: TextInputAction.next,
                            onChanged: (oge){
                              setState(() {
                                mailimiz=oge;
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
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.go,
                          onChanged: (oge){
                            setState(() {
                              sifremiz=oge;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
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
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
                          AuthService().singIn(context,email:_emailcontroller.text, password: _sifrecontroller.text);
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
                SizedBox(
                  height: Ekranyuksekligi % 125,
                ),
                Container(
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(60)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(

                        decoration: BoxDecoration(
                            color: Color(0xfff8edf2),
                            borderRadius: BorderRadius.circular(60)),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => kayitol()));
                          },
                          child: Text("Kayıt Ol",style: TextStyle(
                            fontSize: 20,
                            color: Colors.pink.shade900,
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
