import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ombudsman/admin/view/data_verifikasi_laporan.dart/detail.dart';

class DataVerifikasiLaporan extends StatefulWidget {
  @override
  _DataVerifikasiLaporanState createState() => _DataVerifikasiLaporanState();
}

class _DataVerifikasiLaporanState extends State<DataVerifikasiLaporan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Verifikasi Laporan'),
        centerTitle: true,
      ),
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('Verifikasi Laporan')
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
                              ListTile(
                                  title: Text(laporan['Nama Lengkap']),
                                  subtitle: Text(laporan['Identitas']),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(laporan['Instansi Terlapor'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey)),
                                      SizedBox(height: 8.0),
                                      Text(laporan['Nama Terlapor'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey)),
                                      SizedBox(height: 8.0),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    side: BorderSide(
                                                        color: Colors.blue)),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Detail(
                                                                documentId: documentSnapshot.documentID,
                                                                identitas: laporan[
                                                                    'Identitas'],
                                                                namaLengkap:
                                                                    laporan[
                                                                        'Nama Lengkap'],
                                                                tgllahir: laporan[
                                                                    'Tanggal Lahir'],
                                                                alamat: laporan[
                                                                    'Alamat'],
                                                                status: laporan[
                                                                    'Status'],
                                                                pekerjaan: laporan[
                                                                    'Pekerjaan'],
                                                                notelp: laporan[
                                                                    'No.Telepon'],
                                                                email: laporan[
                                                                    'Email'],
                                                                katasandi: laporan[
                                                                    'Kata Sandi'],
                                                                namaTerlapor1:
                                                                    laporan[
                                                                        'Nama Terlapor'],
                                                                jabatan1: laporan[
                                                                    'Jabatan'],
                                                                insTerlapor1:
                                                                    laporan[
                                                                        'Instansi Terlapor'],
                                                                alamatTerlapor1:
                                                                    laporan[
                                                                        'Alamat Terlapor'],
                                                                tglPeristiwa2:
                                                                    laporan[
                                                                        'Tanggal Peristiwa'],
                                                                namaPetugas2:
                                                                    laporan[
                                                                        'Nama Petugas'],
                                                                jabatan2: laporan[
                                                                    'Jabatan Petugas'],
                                                                instansi2: laporan[
                                                                    'Instansi'],
                                                                tgl2: laporan[
                                                                    'Tanggal Instansi Terlapor'],
                                                                modeLaporan2: laporan['Mode Laporan'],
                                                                pengadilan2:
                                                                    laporan[
                                                                        'Pengadilan'],
                                                                noReg2: laporan[
                                                                    'No.Registrasi Perkara'],
                                                                tglPeristiwa3:
                                                                    laporan[
                                                                        'Waktu Peristiwa'],
                                                                peristiwa3: laporan[
                                                                    'Peristiwa'],
                                                                buktiFile3: laporan[
                                                                    'Bukti File'],
                                                                alamatTerlapor3:
                                                                    laporan[
                                                                        'Alamat Terlapor'],
                                                                harapanPelapor4:
                                                                    laporan[
                                                                        'Harapan Pelapor'],
                                                                rahasiaId5: laporan[
                                                                    'Rahasiakan Identitas'],
                                                                catatan5: laporan[
                                                                    'Catatan'],
                                                                tglLaporan5:
                                                                    laporan[
                                                                        'Tanggal Laporan'],
                                                                statusLaporan:
                                                                    laporan['Status Laporan']
                                                              )));
                                                },
                                                child: Text(
                                                  'Lihat Data Laporan',
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                )),
                                                Text(laporan['Status Laporan'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),)
                                          ]),
                                      SizedBox(height: 16.0),
                                    ]),
                              ),
                            ]),
                      );
                    });
              })),
    );
  }
}