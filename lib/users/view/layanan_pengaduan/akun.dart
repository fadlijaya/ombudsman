import 'package:flutter/material.dart';
import 'package:ombudsman/constant.dart';
import 'package:ombudsman/users/view/menu.dart';

class Akun extends StatefulWidget { 
  final String uid;
  final String namaLengkap;
  final String email;
  final String noTelepon;
  final String tglLahir;
  final String identitas;

  const Akun(
      {Key key,
      this.uid,
      this.namaLengkap,
      this.email,
      this.noTelepon,
      this.tglLahir,
      this.identitas})
      : super(key: key);
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
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
              Text('Akun Saya', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              SizedBox(height: 32.0),
              Image.asset(
                'images/avatar.png',
                width: 72.0,
              ),
              SizedBox(height: 8.0),
              Text(
                widget.namaLengkap ?? 'Nama Lengkap',
                style: TextStyle(
                    color: Colors.white,
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
        ),
        Positioned(child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text('v1.0.0', style: TextStyle(color: Colors.grey)),
          )
        ))
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
