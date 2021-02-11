import 'package:flutter/material.dart';
import 'package:ombudsman/admin/view/akun.dart';
import 'package:ombudsman/admin/view/data_laporan/data_laporan.dart';
import 'package:ombudsman/admin/view/data_pengguna/data_pengguna.dart';
import 'package:ombudsman/admin/view/data_verifikasi_laporan.dart/data_verifikasi_laporan.dart';
import 'package:ombudsman/constant.dart';
import 'package:ombudsman/my_clipper.dart';
import 'package:ombudsman/users/view/layanan_pengaduan/login.dart';

class DashboardAdmin extends StatefulWidget {
  final String uid;
  final String namalengkap;
  final String jabatan;
  final String nip;
  final String email;

  const DashboardAdmin(
      {Key key, this.uid, this.namalengkap, this.jabatan, this.nip, this.email})
      : super(key: key);

  @override
  _DashboardAdminState createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                )),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 24.0, top: 24.0, bottom: 48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/logo.png',
                    width: 160.0,
                  ),
                  SizedBox(height: 16.0),
                  Text('Selamat Datang Asisten'),
                  SizedBox(height: 4.0),
                  Text(
                    widget.namalengkap,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 4.0,
                padding: EdgeInsets.all(paddingGrid),
                mainAxisSpacing: 12.0,
                crossAxisSpacing: paddingGrid,
                children: <Widget>[
                  GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(paddingGrid),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Data Laporan',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: cFont),
                            ),
                            Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.blue),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DataLaporan()));
                      }),
                  GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(paddingGrid),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Data Verifikasi Laporan',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: cFont),
                            ),
                            Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.blue),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DataVerifikasiLaporan()));
                      }),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(paddingGrid),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Data Pengguna',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: cFont),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.blue,)
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DataPengguna()));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(paddingGrid),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Akun',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: cFont),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.blue,)
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Akun(
                                    uid: widget.uid,
                                    namalengkap: widget.namalengkap,
                                    jabatan: widget.jabatan,
                                    nip: widget.nip,
                                    email: widget.email,
                                  )));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(paddingGrid),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Keluar',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: cFont),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _keluar();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _keluar() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Konfirmasi'),
            content: Text('Anda yakin ingin keluar ?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('TIDAK')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Login.routeName);
                  },
                  child: Text('YA')),
            ],
          );
        });
  }
}
