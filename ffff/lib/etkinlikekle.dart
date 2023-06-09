import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kisacaberkproje/homeview.dart';
import 'package:kisacaberkproje/register.dart';
import 'package:kisacaberkproje/service/firebase_service.dart';
import 'package:kisacaberkproje/service/status_service.dart';


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

  var currentuser= FirebaseAuth.instance.currentUser?.uid;
  var kullanici_ismi ="aaaaa";



  StatusService _statusService = StatusService();
  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  PickedFile? profileImage;

  Widget imageReplace(){
    var Ekranbilgisi = MediaQuery.of(context);
    final double Ekranyuksekligi = Ekranbilgisi.size.height;
    final double Ekrangenisligi = Ekranbilgisi.size.width;
    if (profileImage !=null){
      return Container(
        width: Ekrangenisligi/1.4,
        height: Ekranyuksekligi/3.8,
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
            image:  FileImage(File(profileImage!.path)),
            fit: BoxFit.cover,
          ),
        ),
      );
    }else {
      if (_pickImage != null ){
        return Container(
          width: Ekrangenisligi/1.4,
          height: Ekranyuksekligi/3.8,
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
              image:  NetworkImage(_pickImage),
              fit: BoxFit.cover,
            ),
          ),
        );
      }else{
        return Container(
          width: Ekrangenisligi/1.4,
          height: Ekranyuksekligi/3.8,
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
        );
      }
    }
  }


  DateTime dateTime = DateTime(2023, 07, 22, 5, 30);
  FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _etk_adcontroller= TextEditingController();
  // final TextEditingController _etk_tarih= TextEditingController();
  final TextEditingController _etk_turcontroller= TextEditingController();
  final TextEditingController _etk_ucretcontroller= TextEditingController();
  final TextEditingController _etk_aciklamacontroller= TextEditingController();
  final TextEditingController _etk_sehircontroller= TextEditingController();
  final TextEditingController _etk_konumcontroller= TextEditingController();
  bool showPassword = false;
  @override

  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2,"0");
    final munites = dateTime.minute.toString().padLeft(2,"0");
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
              GestureDetector(
                onTap: (){

                },
                child: Center(
                  child: Stack(
                    children: [
                      imageReplace(),
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
                            child: InkWell(
                              onTap: () => _onImageButtonPress(ImageSource.gallery),
                              child: Icon(
                                Icons.image_rounded,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Positioned(
                          bottom: 0,
                          right: 40,
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
                            child: InkWell(
                              onTap: () => _onImageButtonPress(ImageSource.camera),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff880E4F).withOpacity(0.95),
                      borderRadius: BorderRadius.circular(35)),
                  child: TextFormField(
                    controller: _etk_adcontroller,
                    decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          child: Icon(Icons.supervised_user_circle),
                        ),
                        border: InputBorder.none,
                        hintText: "Etkinlik Adı",
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
                      setState(() {});
                    },
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical:22.0), backgroundColor: Color(0xff880E4F),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)
                  ),
                ),
                child: Row( children: [
                  Icon(Icons.supervised_user_circle),
                  Text("${dateTime.year}/${dateTime.month}/${dateTime.day}  $hours:$munites",style: TextStyle(fontSize: 15),),
                ],),
                onPressed: pickDateTime,
              ),
              Text("$dateTime"),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff880E4F).withOpacity(0.95),
                      borderRadius: BorderRadius.circular(35)),
                  child: TextFormField(
                    controller: _etk_turcontroller,
                    decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          child: Icon(Icons.supervised_user_circle),
                        ),
                        border: InputBorder.none,
                        hintText: "Etkinlik Türü",
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
                      setState(() {});
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff880E4F).withOpacity(0.95),
                      borderRadius: BorderRadius.circular(35)),
                  child: TextFormField(
                    controller: _etk_ucretcontroller,
                    decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          child: Icon(Icons.supervised_user_circle),
                        ),
                        border: InputBorder.none,
                        hintText: "Ücret",
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
                      setState(() {});
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
                    controller: _etk_sehircontroller,
                    decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          child: Icon(Icons.supervised_user_circle),
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
                      setState(() {});
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
                    controller: _etk_konumcontroller,
                    decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          child: Icon(Icons.supervised_user_circle),
                        ),
                        border: InputBorder.none,
                        hintText: "Konum",
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
                      setState(() {});
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
                    controller: _etk_aciklamacontroller,
                    decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          child: Icon(Icons.supervised_user_circle),
                        ),
                        border: InputBorder.none,
                        hintText: "Açıklama",
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
                      setState(() {});
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xff4FCF8A),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () async {
                        var kullanici_ismi ="GGGGGsssaaG";
                        var currentuser= FirebaseAuth.instance.currentUser?.uid;
                        var response = await FirebaseFirestore.instance.collection("users").doc(currentuser).get();
                        var map =response.data!();
                        print("gelen veri:" + map?["kullanici_ad"]);
                        kullanici_ismi = map?["kullanici_ad"];
                        print(kullanici_ismi);
                        final String etkid = Random().nextInt(50000).toString();
                        _statusService.addStatus(etkid, profileImage!).then((value) {
                          Fluttertoast.showToast(msg: "Etkinlik Eklendi");
                        });

                        FirebaseService().insertPost(etkId: etkid, etkAd: _etk_adcontroller.text, etkAciklama: _etk_aciklamacontroller.text, etkUcret: _etk_ucretcontroller.text, etkKonum: _etk_konumcontroller.text, etkTur: _etk_turcontroller.text, etkTarih: dateTime.toString(), etkSehir: _etk_sehircontroller.text, kullaniciAd: kullanici_ismi);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
                      },
                      child: Text("Etkinlik Ekle",style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ],),
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
  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() => this.dateTime = dateTime);
  }
  Future <DateTime?> pickDate() => showDatePicker(
    context: context,
    initialDate: dateTime,
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
  );
  Future <TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
  );

  void _onImageButtonPress(ImageSource source) async {
    try{
      final pickedFile = await _pickerImage.getImage(source: source);
      setState(() {
        profileImage = pickedFile;
        print("resim ekleme");
        if(profileImage != null){

        }
      });
    }catch(e){
      setState(() {
        _pickImage = e;
        print("Hatamız " + _pickImage);
      });
    }
  }

}

