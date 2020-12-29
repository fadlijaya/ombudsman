import 'package:flutter/material.dart';

class Prosedur extends StatefulWidget {
  @override
  _ProsedurState createState() => _ProsedurState();
}

class _ProsedurState extends State<Prosedur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prosedur'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Image.asset('images/prosedur.png'),
      ),
    );
  }
}
