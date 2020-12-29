import 'package:flutter/material.dart';
import 'package:ombudsman/view/layanan_pengaduan/dashboard.dart';
import 'package:ombudsman/view/layanan_pengaduan/laporan.dart';
import 'package:ombudsman/view/layanan_pengaduan/profil.dart';

class LayananPengaduan extends StatefulWidget {
  final String uid;
  final String identitas;
  final String namaLengkap;
  final String tglLahir;
  final String alamat;
  final String status;
  final String pekerjaan;
  final String noTelepon;
  final String email;
  final String password;

  const LayananPengaduan(
      {Key key,
      this.uid,
      this.identitas,
      this.namaLengkap,
      this.tglLahir,
      this.alamat,
      this.status,
      this.pekerjaan,
      this.noTelepon,
      this.email,
      this.password})
      : super(key: key);

  @override
  _LayananPengaduanState createState() => _LayananPengaduanState();
}

class _LayananPengaduanState extends State<LayananPengaduan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Fitur(
        uid: widget.uid,
        identitas: widget.identitas,
        namaLengkap: widget.namaLengkap,
        tglLahir: widget.tglLahir,
        alamat: widget.alamat,
        status: widget.status,
        pekerjaan: widget.pekerjaan,
        noTelepon: widget.noTelepon,
        email: widget.email,
        password: widget.password,
      ),
    );
  }
}

class Fitur extends StatefulWidget {
  final String uid;
  final String identitas;
  final String namaLengkap;
  final String tglLahir;
  final String alamat;
  final String status;
  final String pekerjaan;
  final String noTelepon;
  final String email;
  final String password;

  const Fitur(
      {Key key,
      this.uid,
      this.namaLengkap,
      this.identitas,
      this.tglLahir,
      this.alamat,
      this.status,
      this.pekerjaan,
      this.noTelepon,
      this.email,
      this.password})
      : super(key: key);

  @override
  _FiturState createState() => _FiturState();
}

class _FiturState extends State<Fitur> {
  int _selectedPage = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List<Widget> pageList = List<Widget>();

  @override
  void initState() {
    pageList.add(Dashboard(
      uid: widget.uid,
      namaLengkap: widget.namaLengkap,
    ));
    pageList.add(Laporan(uid: widget.uid));
    pageList.add(Profil(
        uid: widget.uid,
        namaLengkap: widget.namaLengkap,
        email: widget.email,
        noTelepon: widget.noTelepon,
        tglLahir: widget.tglLahir,
        identitas: widget.identitas));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _selectedPage,
          children: pageList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          key: _bottomNavigationKey,
          currentIndex: _selectedPage,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              // ignore: deprecated_member_use
              title: Text(
                'Dashboard',
                style: TextStyle(fontSize: 10.0),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_add),
              // ignore: deprecated_member_use
              title: Text(
                'Laporan',
                style: TextStyle(fontSize: 10.0),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              // ignore: deprecated_member_use
              title: Text(
                'Profil',
                style: TextStyle(fontSize: 10.0),
              ),
            ),
          ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  showAddLaporan() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 140.0,
            child: Column(
              children: [
                ListTile(
                    title: Center(child: Text('Pengaduan')),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Laporan.routeName);
                    }),
                GestureDetector(
                  child: Container(
                    height: 48.0,
                    margin: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        color: Colors.grey[300]),
                    child: Center(
                        child: Text('BATAL',
                            style: TextStyle(fontWeight: FontWeight.w500))),
                  ),
                  onTap: () => Navigator.of(context).pop(),
                )
              ],
            ),
          );
        });
  }
}
