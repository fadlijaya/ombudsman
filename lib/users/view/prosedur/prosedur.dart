import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Prosedur extends StatefulWidget {
  @override
  _ProsedurState createState() => _ProsedurState();
}

class _ProsedurState extends State<Prosedur> {
  final String assetName = 'images/prosedur.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prosedur'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
          padding: EdgeInsets.all(8.0),
          child: SvgPicture.asset(assetName),
        ),
        Container(
          padding: EdgeInsets.only(right: 24.0, top: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('images/logo_ori.png', width: 72.0,),
            ],
          ),
        ),
        ]
      ),
    );
  }
}
