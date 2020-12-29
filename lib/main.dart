import 'package:flutter/material.dart';
import 'package:ombudsman/view/layanan_pengaduan/dashboard.dart';
import 'package:ombudsman/view/layanan_pengaduan/laporan.dart';
import 'package:ombudsman/view/layanan_pengaduan/login.dart';
import 'package:ombudsman/view/layanan_pengaduan/register.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ombudsman/view/menu.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ombudsman RI Sulsel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
      routes: {
        Menu.routeName: (context) => Menu(),
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
        Dashboard.routeName: (context) => Dashboard(),
        Laporan.routeName: (context) => Laporan()
      },
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      image: Image.asset('images/logo.png'),
      photoSize: 150,
      backgroundColor: Colors.white,
      loaderColor: Colors.white,
      navigateAfterSeconds: AfterSplash(),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Menu();
  }
}
