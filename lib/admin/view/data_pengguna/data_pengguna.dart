import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ombudsman/admin/view/data_pengguna/detail_pengguna.dart';

class DataPengguna extends StatefulWidget {
  @override
  _DataPenggunaState createState() => _DataPenggunaState();
}

class _DataPenggunaState extends State<DataPengguna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Data Pengguna'),
          centerTitle: true,),
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('Users')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
              } 
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
                    Map<String, dynamic> users = documentSnapshot.data;
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(users['Identitas']),
                            subtitle: Text(users['Nama Lengkap']),
                            trailing: PopupMenuButton(
                              itemBuilder: (BuildContext context) {
                                return List<PopupMenuEntry<String>>()
                                      ..add(PopupMenuItem<String>(
                                        value: 'detail',
                                        child: Text('Detail'),
                                      ))
                                      ..add(PopupMenuItem<String>(
                                        value: 'hapus',
                                        child: Text('Hapus'),
                                      ));
                              },
                              onSelected: (String value) async {
                                if (value == 'detail') {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPengguna(
                                    identitas: users['Identitas'],
                                    namalengkap: users['Nama Lengkap'],
                                    tgllahir: users['Tanggal Lahir'],
                                    alamat: users['Alamat'],
                                    status: users['Status'],
                                    pekerjaan: users['Pekerjaan'],
                                    notelepon: users['No.Telepon'],
                                    email: users['Email'],
                                    katasandi: users['Kata Sandi']
                                  )));
                                } else if (value == 'hapus') {
                                   showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Konfirmasi'),
                                            content: Text(
                                                'Apa kamu ingin menghapus pengguna atas nama ${users['Nama Lengkap']}?'),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text('Tidak'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              FlatButton(
                                                child: Text('Hapus'),
                                                onPressed: () {
                                                  documentSnapshot.reference.delete();
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                } 
                              },
                            )
                          ),
                        ]
                      ),
                    );
                  }
              );
          }
      )),
    );
  }
  
}
