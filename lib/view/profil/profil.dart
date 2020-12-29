import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilMenu extends StatefulWidget {
  @override
  _ProfilMenuState createState() => _ProfilMenuState();
}

class _ProfilMenuState extends State<ProfilMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profil'),
          centerTitle: true,
        ),
        body: ListView(children: [
          GestureDetector(
            child: Card(
              margin: EdgeInsets.only(left: 12, right: 12, top: 12),
              color: Colors.blue,
              child: Container(
                  height: 60,
                  width: 320,
                  child: Center(
                      child: Text(
                    'Profil Singkat',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ))),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilSingkat()));
            },
          ),
          GestureDetector(
            child: Card(
              margin: EdgeInsets.only(left: 12, right: 12, top: 12),
              color: Colors.blue,
              child: Container(
                  height: 60,
                  width: 320,
                  child: Center(
                      child: Text(
                    'Tugas dan Fungsi',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ))),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TugasFungsi()));
            },
          ),
          GestureDetector(
            child: Card(
              margin: EdgeInsets.only(left: 12, right: 12, top: 12),
              color: Colors.blue,
              child: Container(
                  height: 60,
                  width: 320,
                  child: Center(
                      child: Text(
                    'Struktur',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ))),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Struktur()));
            },
          ),
          GestureDetector(
            child: Card(
              margin: EdgeInsets.only(left: 12, right: 12, top: 12),
              color: Colors.blue,
              child: Container(
                  height: 60,
                  width: 320,
                  child: Center(
                      child: Text(
                    'Visi dan Misi',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ))),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => VisiMisi()));
            },
          ),
          GestureDetector(
            child: Card(
              margin: EdgeInsets.only(left: 12, right: 12, top: 12),
              color: Colors.blue,
              child: Container(
                  height: 60,
                  width: 320,
                  child: Center(
                      child: Text(
                    'Motto',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ))),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Motto()));
            },
          ),
        ]));
  }
}

class ProfilSingkat extends StatelessWidget {
  final String assetName = 'images/profil/profil_singkat.svg';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.all(8.0), child: SvgPicture.asset(assetName)),
      ),
    );
  }
}

class TugasFungsi extends StatelessWidget {
  final String assetName = 'images/profil/tugas_fungsi.svg';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              padding: EdgeInsets.all(8.0),
              child: SvgPicture.asset(assetName))),
    );
  }
}

class Struktur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              Text(
                'Struktur Keasistenan Substansi Ombudsman RI',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8.0),
              Image.asset('images/profil/struktur.png')
            ])),
      ),
    );
  }
}

class VisiMisi extends StatelessWidget {
  final String assetName = 'images/profil/visi_misi.svg';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              padding: EdgeInsets.all(8.0),
              child: SvgPicture.asset(assetName))),
    );
  }
}

class Motto extends StatelessWidget {
  final String assetName = 'images/profil/motto.svg';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              padding: EdgeInsets.all(8.0),
              child: SvgPicture.asset(assetName))),
    );
  }
}
