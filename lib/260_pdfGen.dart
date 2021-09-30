import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'globals.dart';
import 'dart:async';

class PdfGen extends StatefulWidget {
  const PdfGen({Key? key}) : super(key: key);

  @override
  _PdfGenState createState() => _PdfGenState();
}

class _PdfGenState extends State<PdfGen> {
  var pageNum = 260;
  var _loading = false;

  //Create a new PDF document
  PdfDocument document = PdfDocument();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create and Save Pdf"),
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
                    Divider(
                      height: 50,
                    ),
                    // Text(
                    //   "Check your Uploaded Images \nIf not Clear then Upload again",
                    //   textScaleFactor: 1.5,
                    //   style: TextStyle(fontWeight: FontWeight.w700),
                    // ),
                    // Divider(
                    //   height: 50,
                    // ),
                    // Globals.wsWimg1 != null
                    //     ? Image.file(File(Globals.wsWimg1))
                    //     : Text("No Image Uploaded"),
                    // Divider(
                    //   height: 15,
                    // ),
                    // Text("Image for validity certificate of Welder"),
                    // Divider(
                    //   height: 25,
                    // ),
                    // Globals.wsWimg2 != null
                    //     ? Image.file(File(Globals.wsWimg2))
                    //     : Text("No Image Uploaded"),
                    // Divider(
                    //   height: 15,
                    // ),
                    // Text("Image for validity certificate of supervisor"),
                    // Divider(
                    //   height: 25,
                    // ),
                    // Globals.wsGimg1 != null
                    //     ? Image.file(File(Globals.wsGimg1))
                    //     : Text("No Image Uploaded"),
                    // Divider(
                    //   height: 15,
                    // ),
                    // Text("Image for Lateral alignment"),
                    // Divider(
                    //   height: 25,
                    // ),
                    // Globals.wsGimg2 != null
                    //     ? Image.file(File(Globals.wsGimg2))
                    //     : Text("No Image Uploaded"),
                    // Divider(
                    //   height: 15,
                    // ),
                    // Text("Image for Vertical alignment"),
                    // Divider(
                    //   height: 25,
                    // ),
                    // Globals.wsPimg1 != null
                    //     ? Image.file(File(Globals.wsPimg1))
                    //     : Text("No Image Uploaded"),
                    // Divider(
                    //   height: 15,
                    // ),
                    // Text("Image for Packet"),
                    // Divider(
                    //   height: 25,
                    // ),
                    // Globals.wsPimg2 != null
                    //     ? Image.file(File(Globals.wsPimg2))
                    //     : Text("No Image Uploaded"),
                    // Divider(
                    //   height: 15,
                    // ),
                    // Text("Image for Mould"),
                    // Divider(
                    //   height: 25,
                    // ),
                    // Globals.rimg1 != null
                    //     ? Image.file(File(Globals.rimg1))
                    //     : Text("No Image Uploaded"),
                    // Divider(
                    //   height: 15,
                    // ),
                    // Text("Image During Preheat"),
                    // Divider(
                    //   height: 25,
                    // ),
                    // Globals.rimg2 != null
                    //     ? Image.file(File(Globals.rimg2))
                    //     : Text("No Image Uploaded"),
                    // Divider(
                    //   height: 15,
                    // ),
                    // Text("Image After Preheat is completed"),
                    // Divider(
                    //   height: 25,
                    // ),
                    // Globals.iimg1 != null
                    //     ? Image.file(File(Globals.iimg1))
                    //     : Text("No Image Uploaded"),
                    // Divider(
                    //   height: 15,
                    // ),
                    // Text("Image After Time is Complete"),
                    // Divider(
                    //   height: 25,
                    // ),
                    // Globals.wTimg1 != null
                    //     ? Image.file(File(Globals.wTimg1))
                    //     : Text("No Image Uploaded"),
                    // Divider(
                    //   height: 15,
                    // ),
                    // Text("Image After Time is Complete"),
                    // Divider(
                    //   height: 25,
                    // ),
                    // Globals.gimg1 != null
                    //     ? Image.file(File(Globals.gimg1))
                    //     : Text("No Image Uploaded"),
                    // Divider(
                    //   height: 15,
                    // ),
                    // Text("Image for Above Values"),
                    // Divider(
                    //   height: 50,
                    // ),
                    Center(
                        child: Text(
                      "PDF Creation Requires Few Seconds\n Therefore Wait Paitently ...!!...😊",
                      textScaleFactor: 1.3,
                    )),
                    Divider(
                      height: 20,
                    ),
                    _loading
                        ? CircularProgressIndicator(
                            color: Colors.redAccent,
                            strokeWidth: 5,
                            semanticsLabel: "Pdf Being Generated",
                          )
                        : Divider(
                            thickness: 0,
                          ),
                    Divider(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              enableFeedback: true,
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(12)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blueAccent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ))),
                          onPressed: () async {
                            setState(() {
                              _loading = true;
                            });
                            final snackBar = SnackBar(
                              content: Text(
                                  'PDF Creation Started..... Wait Patiently !..'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Future.delayed(
                              Duration(milliseconds: 300),
                              () => createPdf(),
                            );
                          },
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
                    Divider(
                      height: 50,
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
    addTable();

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

//Saves the document
    File('${Globals.appDir}/Sweld-${Globals.dt260}.pdf')
        .writeAsBytes(document.save());

//Disposes the document
    document.dispose();

    setState(() {
      Globals.pdfName = '${Globals.appDir}/Sweld-${Globals.dt260}.pdf';
      Globals.opdfName = Globals.pdfName;
    });
  }

  addPage(imgPath) {
    //Create PDF section.
    PdfSection section = document.sections!.add();
    //Load the image.
    final PdfImage image = PdfBitmap(File(imgPath).readAsBytesSync());

    //set section orientation according to image size width
    if (image.height >= image.width) {
      section.pageSettings.orientation = PdfPageOrientation.portrait;
    } else if (image.height < image.width) {
      section.pageSettings.orientation = PdfPageOrientation.landscape;
    }
    //setting section size
    section.pageSettings.size =
        Size(image.width.toDouble(), image.height.toDouble());

    //removing any margin from document
    section.pageSettings.margins.all = 0;

    //Add the page
    PdfPage page = section.pages.add();
    //Load the image.

    //draw image to the first page
    page.graphics.drawImage(
        image, Rect.fromLTWH(0, 0, page.size.width, page.size.height));
  }

  addTable() {
    PdfGrid grid = PdfGrid();

//Add the columns to the grid
    grid.columns.add(count: 3);

//Add header to the grid
    grid.headers.add(1);

//Add the rows to the grid
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Page Name';
    header.cells[1].value = 'Started On';
    header.cells[2].value = 'Submitted On';

//Add rows to grid
    PdfGridRow row = grid.rows.add();
    row.cells[0].value = 'Location';
    row.cells[1].value = Globals.dt211;
    row.cells[2].value = Globals.dt212;

    row = grid.rows.add();
    row.cells[0].value = 'Welder\nName';
    row.cells[1].value = Globals.dt212;
    row.cells[2].value = Globals.dt213;

    row = grid.rows.add();
    row.cells[0].value = 'Validity Certificate\nWelder';
    row.cells[1].value = Globals.dtwsW1 ?? "No Image";
    row.cells[2].value = Globals.dtwsW1 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Validity Certificate\nSupervisor';
    row.cells[1].value = Globals.dtwsW2 ?? "No Image";
    row.cells[2].value = Globals.dtwsW2 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Rails\nSection';
    row.cells[1].value = Globals.dt213;
    row.cells[2].value = Globals.dt214;

    row = grid.rows.add();
    row.cells[0].value = 'Gap\nMeasurment';
    row.cells[1].value = Globals.dt214;
    row.cells[2].value = Globals.dt215;

    row = grid.rows.add();
    row.cells[0].value = 'Lateral\nAlignment';
    row.cells[1].value = Globals.dtwsG1 ?? "No Image";
    row.cells[2].value = Globals.dtwsG1 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Vertical\nAlignment';
    row.cells[1].value = Globals.dtwsG2 ?? "No Image";
    row.cells[2].value = Globals.dtwsG2 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Portion\nDetails';
    row.cells[1].value = Globals.dt215;
    row.cells[2].value = Globals.dt216;

    row = grid.rows.add();
    row.cells[0].value = 'Packet\nImage';
    row.cells[1].value = Globals.dtwsP1 ?? "No Image";
    row.cells[2].value = Globals.dtwsP1 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Mould\nLeft';
    row.cells[1].value = Globals.dtwsP2 ?? "No Image";
    row.cells[2].value = Globals.dtwsP2 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Mould\nRight';
    row.cells[1].value = Globals.dtwsP3 ?? "No Image";
    row.cells[2].value = Globals.dtwsP3 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'PreHeat';
    row.cells[1].value = Globals.dt216;
    row.cells[2].value = Globals.dt220;

    row = grid.rows.add();
    row.cells[0].value = 'Rail\nPreHeat';
    row.cells[1].value = Globals.dt220;
    row.cells[2].value = Globals.dt230;

    row = grid.rows.add();
    row.cells[0].value = 'During\nPreHeat';
    row.cells[1].value = Globals.dtr1 ?? "No Image";
    row.cells[2].value = Globals.dtr1 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'After\nPreHeat';
    row.cells[1].value = Globals.dtr2 ?? "No Image";
    row.cells[2].value = Globals.dtr2 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Ignition\nTime';
    row.cells[1].value = Globals.dt230;
    row.cells[2].value = Globals.dt240;

    row = grid.rows.add();
    row.cells[0].value = 'Left Rail\nImage';
    row.cells[1].value = Globals.dti1 ?? "No Image";
    row.cells[2].value = Globals.dti1 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Right Rail\nImage';
    row.cells[1].value = Globals.dti2 ?? "No Image";
    row.cells[2].value = Globals.dti2 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Weld\nTrimming';
    row.cells[1].value = Globals.dt240;
    row.cells[2].value = Globals.dt250;

    row = grid.rows.add();
    row.cells[0].value = 'Left Rail\nImage';
    row.cells[1].value = Globals.dtwt1 ?? "No Image";
    row.cells[2].value = Globals.dtwt1 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Right Rail\nImage';
    row.cells[1].value = Globals.dtwt2 ?? "No Image";
    row.cells[2].value = Globals.dtwt2 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Grinding';
    row.cells[1].value = Globals.dt250;
    row.cells[2].value = Globals.dt260;

    row = grid.rows.add();
    row.cells[0].value = 'Vertical\nAlignment';
    row.cells[1].value = Globals.dtg1 ?? "No Image";
    row.cells[2].value = Globals.dtg1 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Lateral\nAlignment';
    row.cells[1].value = Globals.dtg2 ?? "No Image";
    row.cells[2].value = Globals.dtg2 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Top Surface\nAt End';
    row.cells[1].value = Globals.dtg3 ?? "No Image";
    row.cells[2].value = Globals.dtg3 ?? "No Image";

    row = grid.rows.add();
    row.cells[0].value = 'Top Surface\nAt Center';
    row.cells[1].value = Globals.dtg4 ?? "No Image";
    row.cells[2].value = Globals.dtg4 ?? "No Image";

//Set the grid style
    grid.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
        backgroundBrush: PdfBrushes.white,
        textBrush: PdfBrushes.black,
        font: PdfStandardFont(PdfFontFamily.helvetica, 20));

//Draw the grid
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
  }
}
