import 'package:flutter/material.dart';

class Akun extends StatefulWidget {
  final String uid;
  final String namalengkap;
  final String jabatan;
  final String nip;
  final String email;

  const Akun({Key key, this.uid, this.namalengkap, this.jabatan, this.nip, this.email}) : super(key: key);

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
              Image.asset(
                'images/avatar.png',
                width: 90,
              ),
              SizedBox(height: 8.0),
              Text(
                widget.namalengkap,
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
            padding: const EdgeInsets.only(top: 170),
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    'Jabatan',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    widget.jabatan,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    'NIP',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    widget.nip,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    widget.email,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
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
}