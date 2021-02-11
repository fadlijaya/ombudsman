import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ombudsman/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ombudsman/users/view/layanan_pengaduan/layanan_pengaduan.dart';

class Laporan extends StatefulWidget {
  static const routeName = '/laporan';

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

  const Laporan(
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
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  int _currentStep = 0;

  bool _disable1 = false;
  bool _disable2 = false;

  var _selectedMode;

  List<String> _listMode = [
    'Surat',
    'Datang Langsung',
    'Telepon',
    'Lainnya',
  ];

  String _identitas;

  DateTime _dateTime = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  TextEditingController _namaController1 = TextEditingController();
  TextEditingController _jabatanController1 = TextEditingController();
  TextEditingController _instansiController1 = TextEditingController();
  TextEditingController _alamatController1 = TextEditingController();
  TextEditingController _tglPeristiwaController2 = TextEditingController();
  TextEditingController _namaController2 = TextEditingController();
  TextEditingController _jabatanController2 = TextEditingController();
  TextEditingController _instansiController2 = TextEditingController();
  TextEditingController _tglTerlaporController2 = TextEditingController();
  TextEditingController _pengadilanController2 = TextEditingController();
  TextEditingController _noRegisController2 = TextEditingController();
  TextEditingController _tglController3 = TextEditingController();
  TextEditingController _peristiwaController3 = TextEditingController();
  TextEditingController _alamatController3 = TextEditingController();
  TextEditingController _harapanController4 = TextEditingController();
  TextEditingController _catatanController5 = TextEditingController();
  TextEditingController _tglLaporanController5 = TextEditingController();

  String _imageUrl;

  Future uploadImage() async {
    var _storage = FirebaseStorage.instance;

    final _picker = ImagePicker();
    PickedFile image;

    image = await _picker.getImage(source: ImageSource.gallery);
    var file = File(image.path);

    if (image != null) {
      var snapshot = await _storage
          .ref()
          .child('$_imageUrl')
          .putFile(file)
          .onComplete;

      var downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _imageUrl = downloadUrl;
      });
    } else {
      print('No Print Received');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity, child: Stack(children: [_widgetStepper()])),
    );
  }

  Widget _widgetStepper() {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          Stepper(
            steps: _stepper(),
            physics: ClampingScrollPhysics(),
            type: StepperType.vertical,
            currentStep: this._currentStep,
            onStepTapped: (step) {
              setState(() {
                this._currentStep = step;
              });
            },
            onStepContinue: () {
              setState(() {
                if (this._currentStep < this._stepper().length - 1) {
                  this._currentStep = this._currentStep + 1;
                } else {
                  this._currentStep = 0;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (this._currentStep > 0) {
                  this._currentStep = this._currentStep - 1;
                } else {
                  this._currentStep = 0;
                }
              });
            },
          ),
          ButtonTheme(
            height: 60,
            child: RaisedButton(
                child: Text('SUBMIT',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    Firestore.instance.collection('Laporan').add({
                      'Identitas': widget.identitas,
                      'Nama Lengkap': widget.namaLengkap,
                      'Tanggal Lahir': widget.tglLahir,
                      'Alamat': widget.alamat,
                      'Status': widget.status,
                      'Pekerjaan': widget.pekerjaan,
                      'No.Telepon': widget.noTelepon,
                      'Email': widget.email,
                      'Kata Sandi': widget.password,
                      'Nama Terlapor': _namaController1.text,
                      'Jabatan': _jabatanController1.text,
                      'Instansi Terlapor': _instansiController1.text,
                      'Alamat Terlapor': _alamatController1.text,
                      'Waktu Peristiwa': _tglPeristiwaController2.text,
                      'Nama Petugas': _namaController2.text,
                      'Jabatan Petugas': _jabatanController2.text,
                      'Instansi': _instansiController2.text,
                      'Tanggal Instansi Terlapor': _tglTerlaporController2.text,
                      'Mode Laporan': _selectedMode,
                      'Pengadilan': _pengadilanController2.text,
                      'No.Registrasi Perkara': _noRegisController2.text,
                      'Tanggal Peristiwa': _tglController3.text,
                      'Peristiwa': _peristiwaController3.text,
                      'Alamat Terlapor Peristiwa': _alamatController3.text,
                      'Harapan Pelapor': _harapanController4.text,
                      'Rahasiakan Identitas': _identitas,
                      'Catatan': _catatanController5.text,
                      'Tanggal Laporan': _tglLaporanController5.text,
                      'Bukti File': _imageUrl
                    }).then((result) => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('Laporan Berhasil Terkirim!'),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _namaController1.clear();
                                    _jabatanController1.clear();
                                    _instansiController1.clear();
                                    _alamatController1.clear();
                                    _tglPeristiwaController2.clear();
                                    _namaController2.clear();
                                    _jabatanController2.clear();
                                    _instansiController2.clear();
                                    _tglTerlaporController2.clear();
                                    _pengadilanController2.clear();
                                    _noRegisController2.clear();
                                    _tglController3.clear();
                                    _peristiwaController3.clear();
                                    _alamatController3.clear();
                                    _harapanController4.clear();
                                    _catatanController5.clear();
                                    _tglLaporanController5.clear();
                                    //_imageUrl

                                    Navigator.pushReplacementNamed(context, Fitur.routeName);
                                  },
                                  child: Text('OK'))
                            ],
                          );
                        }));
                  }
                }),
          )
        ]),
      ),
    );
  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(
          title: Text('Terlapor'),
          content: Column(
            children: [
              TextFormField(
                controller: _namaController1,
                decoration: InputDecoration(labelText: 'Nama Terlapor'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _namaController1.text = value;
                },
              ),
              TextFormField(
                controller: _jabatanController1,
                decoration: InputDecoration(labelText: 'Jabatan'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _jabatanController1.text = value;
                },
              ),
              TextFormField(
                controller: _instansiController1,
                decoration: InputDecoration(labelText: 'Instansi Terlapor'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _instansiController1.text = value;
                },
              ),
              TextFormField(
                controller: _alamatController1,
                decoration: InputDecoration(labelText: 'Alamat Terlapor'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _alamatController1.text = value;
                },
              ),
            ],
          ),
          isActive: _currentStep >= 0,
          state: StepState.complete),
      Step(
          title: Text('Waktu Peristiwa'),
          content: Column(
            children: [
              Text(
                'Kapan Peristiwa, Tindakan atau Keputusan yang dilaporkan terjadi ?',
                style: TextStyle(color: cFont),
              ),
              TextFormField(
                controller: _tglPeristiwaController2,
                decoration: InputDecoration(
                    hintText: 'Tanggal/Bulan/Tahun',
                    suffixIcon: Icon(Icons.today)),
                readOnly: true,
                onTap: () async {
                  DateTime today = DateTime.now();
                  DateTime datePicker = await showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime(1950),
                    lastDate: today,
                  );
                  if (datePicker != null) {
                    _dateTime = datePicker;
                    _tglPeristiwaController2.text =
                        DateFormat('dd MMMM yyyy').format(_dateTime);
                  }
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _tglPeristiwaController2.text = value;
                },
              ),
              SizedBox(height: 8),
              Text(
                'Apakah Saudara sudah menyampaikan Laporan kepada Instansi Terlapor ?',
                style: TextStyle(color: cFont),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      value: true,
                      groupValue: _disable1,
                      onChanged: (value) {
                        setState(() {
                          _disable1 = value;
                        });
                      }),
                  Text('Ya'),
                  Radio(
                      value: false,
                      groupValue: _disable1,
                      onChanged: (value) {
                        setState(() {
                          _disable1 = value;
                        });
                      }),
                  Text('Tidak')
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text('Keterangan', style: TextStyle(fontWeight: FontWeight.w500),),
                ],
              ),
              TextFormField(
                enabled: _disable1,
                controller: _namaController2,
                decoration: InputDecoration(labelText: 'Nama Petugas'),
                onSaved: (String value) {
                  _alamatController1.text = value;
                },
              ),
              TextFormField(
                enabled: _disable1,
                controller: _jabatanController2,
                decoration: InputDecoration(labelText: 'Jabatan'),
                onSaved: (String value) {
                  _alamatController1.text = value;
                },
              ),
              TextFormField(
                enabled: _disable1,
                controller: _instansiController2,
                decoration: InputDecoration(labelText: 'Instansi'),
                onSaved: (String value) {
                  _alamatController1.text = value;
                },
              ),
              TextFormField(
                enabled: _disable1,
                controller: _tglTerlaporController2,
                decoration: InputDecoration(
                    hintText: 'Tanggal/Bulan/Tahun',
                    suffixIcon: Icon(Icons.today)),
                readOnly: true,
                onTap: () async {
                  DateTime today = DateTime.now();
                  DateTime datePicker = await showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime(1950),
                    lastDate: today,
                  );
                  if (datePicker != null) {
                    _dateTime = datePicker;
                    _tglTerlaporController2.text =
                        DateFormat('dd MMMM yyyy').format(_dateTime);
                  }
                },
              ),
              DropdownButton(
                items: _listMode
                    .map((value) => DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        ))
                    .toList(),
                onChanged: (selected) {
                  setState(() {
                    _selectedMode = selected;
                  });
                },
                value: _selectedMode,
                isExpanded: true,
                hint: Text('Mode Laporan'),
              ),
              SizedBox(height: 8),
              Text(
                'Apakah substansi Laporan sudah pernah atau sedang diajukan gugatan ke Pengadilan ?',
                style: TextStyle(color: cFont),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      value: true,
                      groupValue: _disable2,
                      onChanged: (value) {
                        setState(() {
                          _disable2 = value;
                        });
                      }),
                  Text('Ya'),
                  Radio(
                      value: false,
                      groupValue: _disable2,
                      onChanged: (value) {
                        setState(() {
                          _disable2 = value;
                        });
                      }),
                  Text('Tidak')
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text('Keterangan', style: TextStyle(fontWeight: FontWeight.w500),),
                ],
              ),
              TextFormField(
                enabled: _disable2,
                controller: _pengadilanController2,
                decoration: InputDecoration(labelText: 'Pengadilan'),
                onSaved: (String value) {
                  _alamatController1.text = value;
                },
              ),
              TextFormField(
                enabled: _disable2,
                controller: _noRegisController2,
                decoration:
                    InputDecoration(labelText: 'Nomor Registrasi Perkara'),
                onSaved: (String value) {
                  _alamatController1.text = value;
                },
              ),
            ],
          ),
          isActive: _currentStep >= 1,
          state: StepState.complete),
      Step(
          title: Text('Uraian Peristiwa (Kronologi)'),
          content: Column(
            children: [
              TextFormField(
                controller: _tglController3,
                decoration: InputDecoration(
                    hintText: 'Tanggal/Bulan/Tahun',
                    suffixIcon: Icon(Icons.today)),
                readOnly: true,
                onTap: () async {
                  DateTime today = DateTime.now();
                  DateTime datePicker = await showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime(1950),
                    lastDate: today,
                  );
                  if (datePicker != null) {
                    _dateTime = datePicker;
                    _tglController3.text =
                        DateFormat('dd MMMM yyyy').format(_dateTime);
                  }
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _peristiwaController3,
                decoration: InputDecoration(labelText: 'Peristiwa'),
                maxLines: 5,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _peristiwaController3.text = value;
                },
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  Text('Catatan/Bukti'),
                  (_imageUrl != null) ? Image.network(_imageUrl) : Text(' '),
                  FlatButton(
                      onPressed: uploadImage,
                      child: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(0, 2))
                              ]),
                          child: Center(child: Text('Pilih File'))))
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _alamatController3,
                decoration: InputDecoration(labelText: 'Alamat Terlapor'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _alamatController3.text = value;
                },
              ),
            ],
          ),
          isActive: _currentStep >= 2,
          state: StepState.complete),
      Step(
          title: Text('Harapan Pelapor'),
          content: Column(
            children: [
              TextFormField(
                controller: _harapanController4,
                decoration: InputDecoration(labelText: 'Harapan Pelapor'),
                maxLines: 5,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _harapanController4.text = value;
                },
              ),
            ],
          ),
          isActive: _currentStep >= 3,
          state: StepState.complete),
      Step(
          title: Text('Dokumen Pendukung'),
          content: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Permintaan Identitas Dirahasiakan',
                    style: TextStyle(color: cFont),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: 'Ya',
                          groupValue: _identitas,
                          onChanged: (String value) {
                            setState(() {
                              _identitas = value;
                            });
                          }),
                      Text('Ya'),
                      Radio(
                          value: 'Tidak',
                          groupValue: _identitas,
                          onChanged: (String value) {
                            setState(() {
                              _identitas = value;
                            });
                          }),
                      Text('Tidak')
                    ],
                  ),
                ],
              ),
              TextFormField(
                controller: _catatanController5,
                decoration: InputDecoration(labelText: 'Catatan'),
                maxLines: 5,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _catatanController5.text = value;
                },
              ),
              TextFormField(
                controller: _tglLaporanController5,
                decoration: InputDecoration(
                    hintText: 'Tanggal Laporan', suffixIcon: Icon(Icons.today)),
                readOnly: true,
                onTap: () async {
                  DateTime today = DateTime.now();
                  DateTime datePicker = await showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime(1950),
                    lastDate: today,
                  );
                  if (datePicker != null) {
                    _dateTime = datePicker;
                    _tglLaporanController5.text =
                        DateFormat('dd MMMM yyyy').format(_dateTime);
                  }
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
              ),
            ],
          ),
          isActive: _currentStep >= 4,
          state: StepState.complete),
    ];
    return _steps;
  }
}
