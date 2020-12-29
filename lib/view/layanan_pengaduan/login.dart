import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ombudsman/view/layanan_pengaduan/layanan_pengaduan.dart';
import 'package:ombudsman/view/layanan_pengaduan/register.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidePassword = true;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: 100, left: 60, right: 60, bottom: 40),
                  child: Image.asset('images/logo.png')),
              Padding(
                padding: EdgeInsets.only(left: 30, bottom: 30),
                child: Text(
                    'Untuk mengajukan layanan pengaduan dugaan maladministrasi pelayanan publik, silahkan login.'),
              ),
              Container(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Kata Sandi',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                _togglePasswordVisibility();
                              },
                              child: Icon(
                                  _isHidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: _isHidePassword
                                      ? Colors.grey
                                      : Colors.blue)),
                        ),
                        obscureText: _isHidePassword,
                        validator: (value) {
                          if (value.isEmpty || value.length < 7) {
                            return 'Invalid Kata Sandi';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 32),
                      ButtonTheme(
                        minWidth: 310,
                        height: 48,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        child: RaisedButton(
                          onPressed: () {
                            login();
                          },
                          color: Colors.blue,
                          child: Container(
                            margin: EdgeInsets.only(left: 24, right: 24),
                            child: Text(
                              'MASUK',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum Punya Akun ?',
                    style: TextStyle(fontSize: 12),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Register.routeName);
                      },
                      child: Text(
                        'DAFTAR',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ))
                ],
              ),
            ]),
      ),
    );
  }

  void login() async {
    if (_formKey.currentState.validate()) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((currentUser) => Firestore.instance
              .collection('Users')
              .document(currentUser.user.uid)
              .get()
              .then((DocumentSnapshot result) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LayananPengaduan(
                          uid: currentUser.user.uid,
                          identitas: result['Identitas'],
                          namaLengkap: result['Nama Lengkap'],
                          tglLahir: result['Tanggal Lahir'],
                          alamat: result['Alamat'],
                          status: result['Status'],
                          pekerjaan: result['Pekerjaan'],
                          noTelepon: result['No.Telepon'],
                          email: result['Email'],
                          password: result['Kata Sandi']))))
              .catchError((err) => print(err)))
          .catchError((err) => print(err));
    }
  }
}
