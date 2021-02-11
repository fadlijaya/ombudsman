import 'package:flutter/material.dart';
import 'package:ombudsman/constant.dart';

class DetailPengguna extends StatefulWidget {
  final String identitas;
  final String namalengkap;
  final String tgllahir;
  final String alamat;
  final String status;
  final String pekerjaan;
  final String notelepon;
  final String email;
  final String katasandi;

  const DetailPengguna({Key key, this.identitas, this.namalengkap, this.tgllahir, this.alamat, this.status, this.pekerjaan, this.notelepon, this.email, this.katasandi}) : super(key: key);

  @override
  _DetailPenggunaState createState() => _DetailPenggunaState();
}

class _DetailPenggunaState extends State<DetailPengguna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        Container(
          padding: EdgeInsets.all(paddingDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(), 
              SizedBox(height: 60.0),
              _dataDetailPengguna()]),
        )
      ])),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 16.0),
        Text('Detail Data Pengguna',
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _dataDetailPengguna() {
    return Expanded(
        child: Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nomor ID :',
            ),
            SizedBox(width: 16.0),
            Text(
              widget.identitas,
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nama Lengkap :',
            ),
            SizedBox(width: 16.0),
            Text(widget.namalengkap),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tanggal Lahir :',
            ),
            SizedBox(width: 16.0),
            Text(widget.tgllahir),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Alamat :'),
            SizedBox(width: 16.0),
            Text(widget.alamat),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Status :'),
            SizedBox(width: 16.0),
            Text(widget.status),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pekerjaan :'),
            SizedBox(width: 16.0),
            Text(widget.pekerjaan),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('No.Telepon :'),
            SizedBox(width: 16.0),
            Text(widget.notelepon),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Email :'),
            SizedBox(width: 16.0),
            Text(widget.email),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Kata Sandi :'),
            SizedBox(width: 16.0),
            Text(widget.katasandi),
          ],
        ),
      ]),
    ));
  }
}
