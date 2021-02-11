import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ombudsman/constant.dart';
import 'package:ombudsman/my_clipper.dart';
import 'package:ombudsman/users/view/informasi_publik/informasi_publik.dart';
import 'package:ombudsman/users/view/layanan_pengaduan/login.dart';
import 'package:ombudsman/users/view/profil/profil.dart';
import 'package:ombudsman/users/view/prosedur/prosedur.dart';
import 'package:ombudsman/users/view/regulasi/regulasi.dart';
import 'package:ombudsman/users/view/standar_layanan/standar_layanan.dart';

class Menu extends StatefulWidget {
  static const routeName = '/menu';
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
  
    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen = mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: widthScreen,
        height: heightScreen,
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 60, right: 60, bottom: 60),
                      child: Image.asset('images/logo.png'))),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 140),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.25,
                  padding: EdgeInsets.all(paddingGrid),
                  mainAxisSpacing: paddingGrid,
                  crossAxisSpacing: paddingGrid,
                  children: <Widget>[
                    GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'icons/monitor.png',
                                color: Colors.red,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Layanan Pengaduan',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: cFont),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          showAlertDialog();
                        }),
                    GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'icons/profil.png',
                                color: Colors.yellow[700],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Profil',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: cFont),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilMenu()));
                        }),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'icons/paper.png',
                              color: Colors.green,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Regulasi',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: cFont),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Regulasi()));
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('icons/strategy.png'),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Prosedur',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: cFont),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Prosedur()));
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'icons/speaker.png',
                              color: Colors.brown,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Informasi Publik',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: cFont),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Info()));
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'icons/star.png',
                              color: Colors.orange,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Standar Layanan',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: cFont),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StandarLayanan()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Informasi'),
            content:
                Text('Silahkan login menggunakan email yang sudah terdaftar!'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Login.routeName);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}