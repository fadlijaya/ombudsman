import 'package:flutter/material.dart';
import 'package:ombudsman/constant.dart';
import 'package:ombudsman/view/menu.dart';

class Profil extends StatefulWidget { 
  final String uid;
  final String namaLengkap;
  final String email;
  final String noTelepon;
  final String tglLahir;
  final String identitas;

  const Profil(
      {Key key,
      this.uid,
      this.namaLengkap,
      this.email,
      this.noTelepon,
      this.tglLahir,
      this.identitas})
      : super(key: key);
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: 200,
          decoration: BoxDecoration(color: Colors.blue),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'images/avatar.png',
                width: 90,
              ),
              SizedBox(height: 8.0),
              Text(
                widget.namaLengkap ?? 'Nama Lengkap',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )
            ]),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    widget.email ?? 'Email',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    'No.Telepon',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    widget.noTelepon ?? 'No.Telepon',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    'Tanggal Lahir',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    widget.tglLahir ?? 'Tanggal Lahir',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    'No.KTP',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    widget.identitas ?? 'Identitas',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                SizedBox(height: 48.0),
                Divider(
                  height: 1,
                ),
                GestureDetector(
                  child: ListTile(
                    title: Center(
                        child: Text('Keluar', style: TextStyle(color: cFont))),
                  ),
                  onTap: () {
                    _showDialog();
                  },
                ),
                Divider(
                  height: 1,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  void _showDialog() {
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
                    Navigator.of(context).pushReplacementNamed(Menu.routeName);
                  },
                  child: Text('YA')),
            ],
          );
        });
  }
}
