import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  final String namaLengkap;
  final String uid;

  const Dashboard({Key key, this.namaLengkap, this.uid}) : super(key: key);

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
            padding: const EdgeInsets.only(top: 140.0),
            child: _buildWidgetListLaporan(context),
          )
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      padding: EdgeInsets.only(left: 24.0, top: 24.0, bottom: 48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/logo.png',
            width: 200,
          ),
          SizedBox(height: 24.0),
          Text('Selamat Datang'),
          SizedBox(height: 4.0),
          Text(
            widget.namaLengkap,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Container _buildWidgetListLaporan(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('Users')
                    .document(widget.uid)
                    .collection('Laporan')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  } else if(snapshot.hasError){
                    return Center(child: Text('ERROR ${snapshot.error}'),);
                  } else {
                     if(snapshot.hasData){
                     return GridView.builder(
                      itemCount: snapshot.data.documents.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot document =
                            snapshot.data.documents[index];
                        Map<String, dynamic> laporan = document.data;
                        return Card(
                          child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Laporan',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Divider(
                                height: 1.0,
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      laporan['Tanggal Laporan'],
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12.0),
                                    ),
                                  ]),
                              SizedBox(height: 8.0),
                              Expanded(
                                  child: Container(
                                    width: 320,
                                    child: Image.network(
                                laporan['Bukti File'],
                                fit: BoxFit.cover, 
                              ),
                                      )),
                              SizedBox(height: 8.0),  
                              Text(laporan['Peristiwa'], textAlign: TextAlign.justify),
                              SizedBox(height: 8.0),
                              Text(
                                'Sedang Diverifikasi',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                        ));
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
