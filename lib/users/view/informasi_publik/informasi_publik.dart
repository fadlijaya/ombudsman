import 'package:flutter/material.dart';
import 'package:ombudsman/users/models/informasi_publik.dart';
import 'package:ombudsman/users/view/informasi_publik/pdf.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  // ignore: unused_field
  List<InformasiPublik> _list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Informasi Publik'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: informasiPublik.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PDF(
                                title: informasiPublik[index].title,
                                docs: informasiPublik[index].docs)));
                },
                child: Container(
                   padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0, top: 16.0),
                  child: Text(informasiPublik[index].title, style: TextStyle(color: Colors.blue[900]),)));
            }));
  }
}
