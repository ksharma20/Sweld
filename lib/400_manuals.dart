import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Manuals extends StatelessWidget {
  const Manuals({Key? key}) : super(key: key);

  final pageNum = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Manuals"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: 30,
            ),
            Text(
              "ATW manual-2012 Corrected Upto CS no 01 Pdf",
              textScaleFactor: 1.2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 2,
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewPDF(pathPDF: "assests/ATW_Manual2012.pdf");
                }));
                //open viewPDF page on click
              },
              child: Text("View PDF"),
            ),
            Divider(
              height: 50,
            ),
            Text(
              "IRS-T-19 2012 incorporating up to A_C SLIP 2 Pdf",
              textScaleFactor: 1.1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 2,
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewPDF(pathPDF: "assests/IRS_T_19.pdf");
                }));
                //open viewPDF page on click
              },
              child: Text("View PDF"),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewPDF extends StatelessWidget {
  final String pathPDF;
  ViewPDF({required this.pathPDF});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //view PDF
        appBar: AppBar(
          title: Text("PDF Document Report"),
          actions: [
            IconButton(
                onPressed: () =>
                    Share.shareFiles([pathPDF], text: "My PDF Report"),
                icon: Icon(Icons.share)),
          ],
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: SfPdfViewer.asset(pathPDF));
  }
}
