import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Notifikasi extends StatefulWidget {
  final String uid;
  final String namaLengkap;
  final String identitas;

  const Notifikasi({Key key, this.identitas, this.uid, this.namaLengkap}) : super(key: key);
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
        centerTitle: true
      ),
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('Laporan').document(widget.identitas)
              .collection('Notifikasi')
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
                      DocumentSnapshot documentSnapshot =
                          snapshot.data.documents[index];
                      Map<String, dynamic> laporan = documentSnapshot.data;
                      return Card(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(laporan['Bukti File']),
                                      SizedBox(height: 8.0),
                                      Text(laporan['Peristiwa'], textAlign: TextAlign.justify,),
                                      SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(laporan['Status Laporan'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ]),
                              ),
                            ]),
                      );
                    });
              })), 
    );
  }
}