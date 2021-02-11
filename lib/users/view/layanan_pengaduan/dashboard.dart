import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ombudsman/users/view/layanan_pengaduan/notifikasi.dart';
import 'package:readmore/readmore.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  final String identitas;
  final String namaLengkap;
  final String uid;

  const Dashboard({Key key, this.identitas, this.namaLengkap, this.uid}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.only(top: 124.0),
            child: _buildWidgetListLaporan(context),
          )
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      padding:
          EdgeInsets.only(left: 24.0, top: 24.0, bottom: 48.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'images/logo.png',
                width: 160.0,
              ),
              GestureDetector(
                child: Icon(
                  Icons.notifications,
                  color: Colors.grey,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Notifikasi(
                    uid: widget.uid,
                    namaLengkap: widget.namaLengkap,
                    identitas: widget.identitas,
                  )));
                },
              )
            ],
          ),
          SizedBox(height: 16.0),
          Center(
            child: Text(
              'Laporan',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildWidgetListLaporan(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('Verifikasi Laporan').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('ERROR ${snapshot.error}'),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          itemCount: snapshot.data.documents.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 8.0,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot document =
                                snapshot.data.documents[index];
                            Map<String, dynamic> laporan = document.data;
                            return Card(
                              child: Container(
                                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'images/avatar.png',
                                            width: 40,
                                          ),
                                          SizedBox(width: 16.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                laporan['Nama Lengkap'],
                                              ),
                                              SizedBox(height: 4.0),
                                              Row(children: [
                                                Text('ID : ',
                                                    style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 12.0)),
                                                Text(document.documentID.substring(0, 8),
                                                    style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 12.0)),
                                                Text(' | '),
                                                Text(
                                                  laporan['Tanggal Laporan'],
                                                  style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 12.0),
                                                ),
                                              ])
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16.0),
                                    Expanded(
                                      child: Container(
                                        width: 360.0,
                                        child: Image.network(
                                          laporan['Bukti File'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ReadMoreText(
                                            laporan['Peristiwa'],
                                            trimLength: 60,
                                            colorClickableText: Colors.black,
                                            moreStyle: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                            trimCollapsedText:
                                                'Baca Selengkapnya',
                                            trimExpandedText: 'Kembali',
                                          ),
                                          SizedBox(height: 8.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                laporan['Status Laporan'],
                                                style:
                                                    TextStyle(color: Colors.green, fontSize: 12.0, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(child: Text('Belum Ada Laporan'));
                    }
                  }
                }),
          )
        ],
      ),
    );
  }
}
