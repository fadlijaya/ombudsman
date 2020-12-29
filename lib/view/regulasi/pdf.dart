import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:ombudsman/models/regulasi.dart';

class PDF extends StatefulWidget {
  final String title;
  final String desc;
  final String docs;

  const PDF({Key key, this.title, this.desc, this.docs}) : super(key: key);
  @override
  _PDFState createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  bool _isLoading = true;
  PDFDocument _document;

  // ignore: unused_field
  List<Regulasi> _list;

  Future<void> loadDocument() async {
    _document = await PDFDocument.fromAsset(widget.docs);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    loadDocument();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : PDFViewer(
                    document: _document,
                    zoomSteps: 1,
                  )),
      ),
    );
  }
}
