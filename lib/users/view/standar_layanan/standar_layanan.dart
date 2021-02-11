import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StandarLayanan extends StatefulWidget {
  @override
  _StandarLayananState createState() => _StandarLayananState();
}

class _StandarLayananState extends State<StandarLayanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Standar Layanan'),
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
                    'Standar Pelayanan',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ))),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (contex) => StandarPelayanan()));
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
                      child: Text('Maklumat Pelayanan',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)))),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (contex) => MaklumatPelayanan()));
            },
          )
        ]));
  }
}

class StandarPelayanan extends StatelessWidget {
  final String assetName = 'images/standar_layanan/standar.svg';
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

class MaklumatPelayanan extends StatelessWidget {
  final String assetName = 'images/standar_layanan/maklumat.svg';
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
