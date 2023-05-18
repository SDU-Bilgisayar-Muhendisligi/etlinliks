import 'package:flutter/material.dart';

class EtkinlikEkle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Etkinlik Ekle",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    var Ekranbilgisi = MediaQuery.of(context);
    final double Ekranyuksekligi = Ekranbilgisi.size.height;
    final double Ekrangenisligi = Ekranbilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child:
        Stack(
          children: <Widget>[
            Text(
              "Etkinliks",
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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Etkinlik Ekle",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: Ekrangenisligi/1.2,
                      height: Ekranyuksekligi/3.5,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image:  AssetImage("resimler/bisiklet.png"),
                            fit: BoxFit.cover,
                          ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Color(0xff880E4F),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Etkinlik Adı", "Bisiklet Binelim!", false),
              buildTextField("Tarih", "30 Nisan 2023 Pazar-11:30", false),
              buildTextField("Etkinlik Türü", "BİSİKLET", false),
              buildTextField("Konum", "Gökçay", false),
              buildTextField("Ücret", "Ücretsiz", false),
              buildTextField("Açıklama", "Cumartesi sabah birlikte bisiklet sürelim!", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("İptal",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Color(0xff880E4F),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Ekle",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),

      ),

    );

  }
}