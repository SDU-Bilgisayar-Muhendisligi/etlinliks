import 'package:flutter/material.dart';
import 'package:kisacaberkproje/homeview.dart';


class sifremiunuttum extends StatefulWidget {
  const sifremiunuttum({Key? key}) : super(key: key);

  @override
  State<sifremiunuttum> createState() => _sifremiunuttumState();
}

class _sifremiunuttumState extends State<sifremiunuttum> {
  late String sifremiz,mailimiz;

  bool yuklenmedurumu = false;
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
                            // controller: _emailcontroller,
                            decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Icon(Icons.mail),
                                ),
                                border: InputBorder.none,
                                hintText: "Kayıtlı Mailiniz",

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
                SizedBox(
                  height: Ekranyuksekligi % 125,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
