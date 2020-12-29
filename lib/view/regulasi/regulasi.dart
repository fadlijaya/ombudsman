import 'package:flutter/material.dart';
import 'package:ombudsman/models/regulasi.dart';
import 'package:ombudsman/view/regulasi/pdf.dart';

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
              return Card(
                child: ListTile(
                  title: Text(regulasi[index].title),
                  subtitle: Text(regulasi[index].desc),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PDF(
                                title: regulasi[index].title,
                                desc: regulasi[index].title,
                                docs: regulasi[index].docs)));
                  },
                ),
              );
            }));
  }
}
