import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ombudsman/view/layanan_pengaduan/login.dart';

class Register extends StatefulWidget {
  static const routeName = '/register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _idController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _noTeleponController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController(); 

  DateTime date = DateTime.now();

  var _selectedStatus;
  var _selectedPekerjaan;
  
  List<String> _listStatus = <String>['Menikah', 'Belum Menikah'];

  List<String> _listPekerjaan = [
    'Mahasiswa',
    'Wiraswasta',
    'Wirausaha',
    'Dosen',
    'Pegawai Negeri Sipil',
    'Tentara',
    'Karyawan'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registrasi'),
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _idController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'No. Identitas KTP/KITAS/KITAP/KK'),
                  validator: (value) {
                    if (value.isEmpty || value.length < 16) {
                      return 'Invalid Identitas';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _idController.text = value;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(labelText: 'Nama Lengkap'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Invalid Nama Lengkap';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _namaController.text = value;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _tglLahirController,
                  decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      suffixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Icon(Icons.today)],
                      )),
                  readOnly: true,
                  onTap: () async {
                    DateTime today = DateTime.now();
                    DateTime datePicker = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1950),
                      lastDate: today,
                    );
                    if (datePicker != null) {
                      date = datePicker;
                      _tglLahirController.text =
                          DateFormat('dd MMMM yyyy').format(date);
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Invalid Tanggal Lahir';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _tglLahirController.text = value;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _alamatController,
                  decoration: InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Invalid Alamat';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _alamatController.text = value;
                  },
                ),
                SizedBox(height: 16),
                DropdownButton(
                  items: _listStatus
                      .map((value) =>
                          DropdownMenuItem(child: Text(value), value: value))
                      .toList(),
                  onChanged: (selected) {
                    setState(() {
                      _selectedStatus = selected;
                    });
                  },
                  value: _selectedStatus,
                  isExpanded: true,
                  hint: Text('Status'),
                ),
                SizedBox(height: 8),
                DropdownButton(
                  items: _listPekerjaan
                      .map((value) => DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          ))
                      .toList(),
                  onChanged: (selected) {
                    setState(() {
                      _selectedPekerjaan = selected;
                    });
                  },
                  value: _selectedPekerjaan,
                  isExpanded: true,
                  hint: Text('Pekerjaan'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _noTeleponController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'No.Telepon'),
                  validator: (value) {
                    if (value.isEmpty || value.length < 12) {
                      return 'Invalid No.Telepon';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _noTeleponController.text = value;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _emailController.text = value;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Kata Sandi'),
                  validator: (value) {
                    if (value.isEmpty || value.length < 7) {
                      return 'Invalid Kata Sandi';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _passwordController.text = value;
                  },
                ),
                SizedBox(height: 4),
                Text(
                  'Minimal 7 Karakter',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration:
                      InputDecoration(labelText: 'Konfirmasi Kata Sandi'),
                  validator: (value) {
                    if (value.isEmpty || value != _passwordController.text) {
                      return 'Invalid Kata Sandi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
        ButtonTheme(
          height: 60,
          child: RaisedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                if (_passwordController.text ==
                    _confirmPasswordController.text) {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then((currentUser) => Firestore.instance
                          .collection('Users')
                          .document(currentUser.user.uid)
                          .setData({
                            'Uid': currentUser.user.uid,
                            'Identitas': _idController.text,
                            'Nama Lengkap': _namaController.text,
                            'Tanggal Lahir': _tglLahirController.text,
                            'Alamat': _alamatController.text,
                            'Status': _selectedStatus,
                            'Pekerjaan': _selectedPekerjaan,
                            'No.Telepon': _noTeleponController.text,
                            'Email': _emailController.text,
                            'Kata Sandi': _passwordController.text
                          })
                          .then((result) => {showSuccess()})
                          .catchError((err) => print(err)))
                      .catchError((err) => print(err));
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Kata Sandi Tidak Sesuai'),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Tutup'))
                          ],
                        );
                      });
                }
              }
            },
            color: Colors.blue,
            child: Center(
              child: Text(
                'DAFTAR',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void showSuccess() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Registrasi Berhasil'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Login.routeName);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}
