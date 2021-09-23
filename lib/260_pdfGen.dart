import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'globals.dart';

class PdfGen extends StatefulWidget {
  const PdfGen({Key? key}) : super(key: key);

  @override
  _PdfGenState createState() => _PdfGenState();
}

class _PdfGenState extends State<PdfGen> {
  //Create a new PDF document
  PdfDocument document = PdfDocument();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check, Create and Save Pdf"),
        actions: [
          IconButton(
              onPressed: () => Globals.gotoHome(context),
              icon: Icon(Icons.home_work))
        ],
      ),
      body: Globals.pdfName == null
          ? SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Check your Uploaded Images \nIf not Clear then Upload again",
                      textScaleFactor: 1.5,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Divider(
                      height: 50,
                    ),
                    Globals.wsWimg1 != null
                        ? Image.file(File(Globals.wsWimg1))
                        : Text("No Image Uploaded"),
                    Divider(
                      height: 15,
                    ),
                    Globals.wsWimg2 != null
                        ? Image.file(File(Globals.wsWimg2))
                        : Text("No Image Uploaded"),
                    Divider(
                      height: 15,
                    ),
                    Globals.wsGimg1 != null
                        ? Image.file(File(Globals.wsGimg1))
                        : Text("No Image Uploaded"),
                    Divider(
                      height: 15,
                    ),
                    Globals.wsGimg2 != null
                        ? Image.file(File(Globals.wsGimg2))
                        : Text("No Image Uploaded"),
                    Divider(
                      height: 15,
                    ),
                    Globals.wsPimg1 != null
                        ? Image.file(File(Globals.wsPimg1))
                        : Text("No Image Uploaded"),
                    Divider(
                      height: 15,
                    ),
                    Globals.wsPimg2 != null
                        ? Image.file(File(Globals.wsPimg2))
                        : Text("No Image Uploaded"),
                    Divider(
                      height: 15,
                    ),
                    Globals.rimg1 != null
                        ? Image.file(File(Globals.rimg1))
                        : Text("No Image Uploaded"),
                    Divider(
                      height: 15,
                    ),
                    Globals.rimg2 != null
                        ? Image.file(File(Globals.rimg2))
                        : Text("No Image Uploaded"),
                    Divider(
                      height: 15,
                    ),
                    Globals.iimg1 != null
                        ? Image.file(File(Globals.iimg1))
                        : Text("No Image Uploaded"),
                    Divider(
                      height: 15,
                    ),
                    Globals.wTimg1 != null
                        ? Image.file(File(Globals.wTimg1))
                        : Text("No Image Uploaded"),
                    Divider(
                      height: 15,
                    ),
                    Globals.gimg1 != null
                        ? Image.file(File(Globals.gimg1))
                        : Text("No Image Uploaded"),
                    Divider(
                      height: 50,
                    ),
                    Center(
                        child: Text(
                      "PDF Creation Requires Few Seconds\n Therefore Wait Paitently ...!!...😊",
                      textScaleFactor: 1.3,
                    )),
                    Divider(
                      height: 35,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: TextButton(
                          style: ButtonStyle(
                            enableFeedback: true,
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(12)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () => createPdf(),
                          child: Text(
                            "Create PDF!",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pdf Report Created \n.....SuccessFully.....",
                    textScaleFactor: 1.5,
                  ),
                  TextButton(
                    onPressed: () => Globals.gotoHome(context),
                    child: Text(
                      "Click Here to go Home",
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  createPdf() async {
    //Add Pages
    addPage(Globals.ss211);
    addPage(Globals.ss212);

    if (Globals.wsWimg1 != null) {
      addPage(Globals.wsWimg1);
    }
    if (Globals.wsWimg2 != null) {
      addPage(Globals.wsWimg2);
    }
    addPage(Globals.ss213);
    addPage(Globals.ss214);

    if (Globals.wsGimg1 != null) {
      addPage(Globals.wsGimg1);
    }
    if (Globals.wsGimg2 != null) {
      addPage(Globals.wsGimg2);
    }
    addPage(Globals.ss215);

    if (Globals.wsPimg1 != null) {
      addPage(Globals.wsPimg1);
    }
    if (Globals.wsPimg2 != null) {
      addPage(Globals.wsPimg2);
    }
    addPage(Globals.ss216);

    if (Globals.rimg1 != null) {
      addPage(Globals.rimg1);
    }
    if (Globals.rimg2 != null) {
      addPage(Globals.rimg2);
    }
    if (Globals.iimg1 != null) {
      addPage(Globals.iimg1);
    }
    if (Globals.wTimg1 != null) {
      addPage(Globals.wTimg1);
    }
    addPage(Globals.ss250);

    if (Globals.gimg1 != null) {
      addPage(Globals.gimg1);
    }
    addTable();

//Saves the document
    await File('${Globals.appDir}/Sweld-${Globals.dt260}.pdf')
        .writeAsBytes(document.save());

//Disposes the document
    document.dispose();

    setState(() {
      Globals.pdfName = '${Globals.appDir}/Sweld-${Globals.dt260}.pdf';
      Globals.opdfName = Globals.pdfName;
    });
  }

  addPage(imgPath) async {
//Adds a page to the document
    PdfPage page = document.pages.add();

//Draw the image
    page.graphics.drawImage(
      PdfBitmap(File(imgPath).readAsBytesSync()),
      Rect.fromLTWH(
          0, 0, page.getClientSize().width, page.getClientSize().height),
    );
  }

  addTable() {
    PdfGrid grid = PdfGrid();

//Add the columns to the grid
    grid.columns.add(count: 3);

//Add header to the grid
    grid.headers.add(1);

//Add the rows to the grid
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Page Id_Name';
    header.cells[1].value = 'Started On';
    header.cells[2].value = 'Submitted On';

//Add rows to grid
    PdfGridRow row = grid.rows.add();
    row.cells[0].value = '211_Location';
    row.cells[1].value = Globals.dt211;
    row.cells[2].value = Globals.dt212;

    row = grid.rows.add();
    row.cells[0].value = '212_Welder\nName';
    row.cells[1].value = Globals.dt212;
    row.cells[2].value = Globals.dt213;

    row = grid.rows.add();
    row.cells[0].value = '213_Rails\nSection';
    row.cells[1].value = Globals.dt213;
    row.cells[2].value = Globals.dt214;

    row = grid.rows.add();
    row.cells[0].value = '214_Gap\nMeasurment';
    row.cells[1].value = Globals.dt214;
    row.cells[2].value = Globals.dt215;

    row = grid.rows.add();
    row.cells[0].value = '215_Portion\nDetails';
    row.cells[1].value = Globals.dt215;
    row.cells[2].value = Globals.dt216;

    row = grid.rows.add();
    row.cells[0].value = '216_PreHeat';
    row.cells[1].value = Globals.dt216;
    row.cells[2].value = Globals.dt220;

    row = grid.rows.add();
    row.cells[0].value = '220_Rail\nPreHeat';
    row.cells[1].value = Globals.dt220;
    row.cells[2].value = Globals.dt230;

    row = grid.rows.add();
    row.cells[0].value = '230_Ignition\nTime';
    row.cells[1].value = Globals.dt230;
    row.cells[2].value = Globals.dt240;

    row = grid.rows.add();
    row.cells[0].value = '240_Weld\nTrimming';
    row.cells[1].value = Globals.dt240;
    row.cells[2].value = Globals.dt250;

    row = grid.rows.add();
    row.cells[0].value = '250_Grinding';
    row.cells[1].value = Globals.dt250;
    row.cells[2].value = Globals.dt260;

//Set the grid style
    grid.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
        backgroundBrush: PdfBrushes.antiqueWhite,
        textBrush: PdfBrushes.black,
        font: PdfStandardFont(PdfFontFamily.timesRoman, 25));

//Draw the grid
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
  }
}
