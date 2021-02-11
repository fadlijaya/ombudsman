import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ombudsman/constant.dart';

class Detail extends StatefulWidget {
  final String documentId;
  final String identitas;
  final String namaLengkap;
  final String tgllahir;
  final String alamat;
  final String status;
  final String pekerjaan;
  final String notelp;
  final String email;
  final String katasandi;
  final String namaTerlapor1;
  final String jabatan1;
  final String insTerlapor1;
  final String alamatTerlapor1;
  final String tglPeristiwa2;
  final String namaPetugas2;
  final String jabatan2;
  final String instansi2;
  final String tgl2;
  final String modeLaporan2;
  final String pengadilan2;
  final String noReg2;
  final String tglPeristiwa3;
  final String peristiwa3;
  final String buktiFile3;
  final String alamatTerlapor3;
  final String harapanPelapor4;
  final String rahasiaId5;
  final String catatan5;
  final String tglLaporan5;
  final String statusLaporan;

  const Detail(
      {Key key, 
      this.documentId,
      this.identitas,
      this.namaLengkap,
      this.tgllahir,
      this.alamat,
      this.status,
      this.pekerjaan,
      this.notelp,
      this.email,
      this.katasandi,
      this.namaTerlapor1,
      this.jabatan1,
      this.insTerlapor1,
      this.alamatTerlapor1,
      this.tglPeristiwa2,
      this.namaPetugas2,
      this.jabatan2,
      this.instansi2,
      this.tgl2,
      this.modeLaporan2,
      this.pengadilan2,
      this.noReg2,
      this.tglPeristiwa3,
      this.peristiwa3,
      this.buktiFile3,
      this.alamatTerlapor3,
      this.harapanPelapor4,
      this.rahasiaId5,
      this.catatan5,
      this.tglLaporan5,
      this.statusLaporan})
      : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

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
                SizedBox(height: 24.0),
                _dataDetailPengguna(),
              ]),
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
        Center(
          child: Text(widget.statusLaporan,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _dataDetailPengguna() {
    return Expanded(
        child: Container(
      child: SingleChildScrollView(
        child: Column(children: [
          Text(
            'Pelapor',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16.0),
          ),
          Divider(),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nomor ID :',
              ),
              Text(widget.identitas),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nama Lengkap :',
              ),
              Text(widget.namaLengkap)
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal Lahir :',
              ),
              Text(widget.tgllahir),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Alamat :'),
              Text(widget.alamat),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Status :'),
              Text(widget.status),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Pekerjaan :'),
              Text(widget.pekerjaan)
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('No.Telepon :'),
              Text(widget.notelp),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Email :'),
              Text(widget.email),
            ],
          ),
          SizedBox(height: 40.0),
          Text(
            'Laporan',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16.0),
          ),
          Divider(),
          SizedBox(height: 16.0),
          Row(
            children: [
              Text(
                'Terlapor',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nama Terlapor :',
              ),
              Text(widget.namaTerlapor1),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jabatan :',
              ),
              Text(widget.jabatan1),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Instansi Terlapor :',
              ),
              Text(widget.insTerlapor1),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Alamat Terlapor :'),
              Text(widget.alamatTerlapor1),
            ],
          ),
          SizedBox(height: 40.0),
          Row(
            children: [
              Text('Waktu Peristiwa', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tanggal Peristiwa :'),
              Text(widget.tglPeristiwa2)
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Nama Petugas :'),
              Text(widget.namaPetugas2),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Jabatan :'),
              Text(widget.jabatan2)
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Instansi :'),
              Text(widget.instansi2),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tanggal :'),
              Text(widget.tgl2)
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Pengadilan :'),
              Text(widget.pengadilan2),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('No.Registrasi Perkara :'),
              Text(widget.noReg2)
            ],
          ),
          SizedBox(height: 40.0),
          Row(
            children: [
              Text('Uraian Peristiwa (Kronologi)', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tanggal Kronologi :'),
              Text(widget.tglPeristiwa3),
            ],
          ),
          SizedBox(height: 16.0),
          Text('Peristiwa :'),
          SizedBox(height: 16.0),
          Text(widget.peristiwa3, textAlign: TextAlign.justify,),
          SizedBox(height: 40.0),
          Column(
            children: [
              Text('Bukti File :'),
              SizedBox(height: 16.0),
              Image.network(widget.buktiFile3)
            ],
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Alamat Terlapor :'),
              Text(widget.alamatTerlapor3)
            ],
          ),
           SizedBox(height: 40.0),
          Row(
            children: [
              Text('Harapan Pelapor', style: TextStyle(fontWeight: FontWeight.bold),  textAlign: TextAlign.justify,),
            ],
          ),
          SizedBox(height: 16.0),
         Text('Harapan Pelapor :'),
         SizedBox(height: 16.0),
         Text(widget.harapanPelapor4),
          SizedBox(height: 40.0),
          Row(
            children: [
              Text('Dokumen Pendukung', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Identitas Dirahasiakan :'),
              Text(widget.rahasiaId5)
            ],
          ),
          SizedBox(height: 16.0),
          Text('Catatan :'),
          SizedBox(height: 16.0),
          Text(widget.catatan5,  textAlign: TextAlign.justify,),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tanggal Laporan :'),
              Text(widget.tglLaporan5)
            ],
          ),
          SizedBox(height: 16.0),
        ]),
      ),
    ));
  }
}
