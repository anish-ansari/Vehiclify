import 'package:flutter/material.dart';
//import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';



class Aclass extends StatefulWidget {
  @override
  _AclassState createState() => _AclassState();
}

class _AclassState extends State<Aclass> {

   String url = "https://www.collegenp.com/uploads/pdf/2021/06/class-b-car-jeep-and-delivery-van-questions-and-answer-for-driving-license.pdf";

//   PDFDocument _doc;

   bool _loading;


    @override
  void initState() {
    // TODO: implement initState
//      _pdfViewerController = PdfViewerController();
    super.initState();
//    showPdf();
  }

//  showPdf() async{
//      setState(() {
//        _loading = true;
//      });
//      final doc = await PDFDocument.fromURL(url);
//      setState(() {
//        _doc = doc;
//        _loading = false;
//      });
//  }
//


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
//        body: PDFDocument.fromURL(),
        appBar: AppBar(
          title: Text("A and K class question"),
      ),
//       body: _loading ? Center(
//         child: CircularProgressIndicator(),
//       ): PDFViewer(document: _doc,),
    );
  }
}

