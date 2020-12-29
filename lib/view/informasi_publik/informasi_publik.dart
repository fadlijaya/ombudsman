import 'package:flutter/material.dart';
import 'package:ombudsman/models/informasi_publik.dart';
import 'package:ombudsman/view/informasi_publik/pdf.dart';

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
              return Card(
                child: ListTile(
                  title: Text(informasiPublik[index].title),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PDF(
                                title: informasiPublik[index].title,
                                docs: informasiPublik[index].docs)));
                  },
                ),
              );
            }));
  }
}
