import 'package:flutter/material.dart';
import 'package:ombudsman/users/models/regulasi.dart';
import 'package:ombudsman/users/view/regulasi/pdf.dart';

class Regulasi extends StatefulWidget {
  @override
  _RegulasiState createState() => _RegulasiState();
}

class _RegulasiState extends State<Regulasi> {
  // ignore: unused_field
  List<Regulasi> _list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Regulasi'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: regulasi.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PDF(
                                title: regulasi[index].title,
                                docs: regulasi[index].docs)));
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0, top: 16.0),
                  child: Text(regulasi[index].title, style: TextStyle(color: Colors.blue[900]),)));
            }));
  }
}
