import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sweld/globals.dart';
import 'dart:io';

class WsPortion extends StatefulWidget {
  const WsPortion({Key? key}) : super(key: key);

  @override
  _WsPortionState createState() => _WsPortionState();
}

class _WsPortionState extends State<WsPortion> {
  final pageNum = 215;

  @override
  Widget build(BuildContext context) {
    var _ssc = ScreenshotController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Weld Setup"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Globals.gotoHome(context),
            icon: Icon(Icons.railway_alert),
          ),
        ],
      ),
      persistentFooterButtons: [
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.popAndPushNamed(context, "/214"),
                child: Text("Prev"),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () async {
                  Globals.ss215 = await _ssc.captureAndSave(Globals.appDir,
                      fileName: "ss215.png",
                      pixelRatio: MediaQuery.of(context).devicePixelRatio,
                      delay: Duration(milliseconds: 250));

                  // Globals.setData('ss215.jpg', Globals.ss215);

                  // Globals.setData('pms', Globals.pms);
                  // Globals.setData('datepor', Globals.datepor);
                  // Globals.setData('porno', Globals.porno);
                  // Globals.setData('utsd', Globals.utsd);
                  // Globals.setData('cpp', Globals.cpp);
                  // Globals.setData('cop', Globals.cop);
                  // Globals.setData('mould', Globals.mould);
                  // Globals.setData('msfc', Globals.msfc);
                  // Globals.saveImg(Globals.wsPimg1, 'wsPimg1.jpg');
                  // Globals.saveImg(Globals.wsPimg2, "wsPimg2.jpg");

                  Globals.gotoWsph(context);
                },
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ],
      extendBody: true,
      body: SingleChildScrollView(
          child: Screenshot(child: WsPBody(), controller: _ssc)),
    );
  }
}

class WsPBody extends StatefulWidget {
  const WsPBody({Key? key}) : super(key: key);

  @override
  _WsPBodyState createState() => _WsPBodyState();
}

class _WsPBodyState extends State<WsPBody> {
  Future getImg1(int op) async {
    if (op == 1) {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          Globals.wsPimg1 = image.path;
        });
      }
    } else {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          Globals.wsPimg1 = image.path;
        });
      }
    }
    Navigator.pop(context);
  }

  Future getImg2(int op) async {
    if (op == 1) {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          Globals.wsPimg2 = image.path;
        });
      }
    } else {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          Globals.wsPimg2 = image.path;
        });
      }
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Portion & Moulds",
                textScaleFactor: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Divider(
            thickness: 2,
            height: 30,
          ),
          Container(
            child: Form(
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                      ),
                    ),
                    hint: Text(Globals.pms ?? "Portion Manufacturer"),
                    isExpanded: true,
                    items: <String>[
                      'Select Manufacturer',
                      'A.K. Construction Company',
                      'Chakradhar Industuries LLP',
                      'Harshad Thermic Industries pvt ltd',
                      'Ms Perfect Thermit Engg. Works',
                      'Raybon Metals P. ltd',
                      'Oberoi Thermit P. ltd',
                      'Rajasthan Engg. Works',
                      'Sagar Infra Rail International Limited',
                      'The Indian Thermit Corporation',
                      'TPP Lucknow',
                      'ORA Indian pvt. Ltd',
                      'Indian Ferros Alloys Ltd',
                      'Phooltas Technologies pvt. Ltd',
                      'Agency Not Filled Up'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.pms = val;
                      });
                    },
                  ),
                  Divider(
                    height: 5,
                  ),
                  TextFormField(
                    initialValue: Globals.datepor,
                    onChanged: (val) {
                      setState(() {
                        Globals.datepor = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Date of Portion Manufacture",
                      // hintText: "within +- 0.5mm",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(),
                        gapPadding: 5,
                      ),
                    ),
                  ),
                  Divider(
                    height: 5,
                  ),
                  TextFormField(
                    initialValue: Globals.porno,
                    onChanged: (val) {
                      setState(() {
                        Globals.porno = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Portion Number",
                      // hintText: "within +- 0.5mm",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(),
                        gapPadding: 5,
                      ),
                    ),
                  ),
                  Divider(
                    height: 5,
                  ),
                  TextFormField(
                    initialValue: Globals.utsd,
                    onChanged: (val) {
                      setState(() {
                        Globals.utsd = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "UTS",
                      // hintText: "within +- 0.5mm",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(),
                        gapPadding: 5,
                      ),
                    ),
                  ),
                  Divider(
                    height: 5,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                      ),
                    ),
                    hint: Text(Globals.cpp ?? "Condition of Polythene Packing"),
                    isExpanded: true,
                    items: <String>[
                      'Select Condition',
                      'Sealed Polythene Packing',
                      'Broken Polythene Packing'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.cpp = val;
                      });
                    },
                  ),
                  Divider(
                    height: 5,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                      ),
                    ),
                    hint: Text(Globals.cop ?? "Condition of Portion"),
                    isExpanded: true,
                    items: <String>[
                      'Select Condition',
                      'Wet Portion',
                      'Dry Portion'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.cop = val;
                      });
                    },
                  ),
                  Divider(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (builder) => AlertDialog(
                        title: Text("Select Image of Packet From"),
                        actions: [
                          TextButton(
                            onPressed: () => getImg1(1),
                            child: Text("Camera"),
                          ),
                          TextButton(
                            onPressed: () => getImg1(2),
                            child: Text("Gallery"),
                          ),
                          Globals.wsPimg1 != null
                              ? TextButton(
                                  onPressed: () => showDialog(
                                      context: context,
                                      builder: (builder) => AlertDialog(
                                            title: Text("Image Preview"),
                                            content: Image.file(
                                                File(Globals.wsPimg1)),
                                          )),
                                  child: Text("Preview"),
                                )
                              : Text("Select"),
                        ],
                      ),
                      barrierDismissible: true,
                      useSafeArea: true,
                      useRootNavigator: true,
                    ),
                    // ignore: unnecessary_null_comparison
                    child: Globals.wsPimg1 == null
                        ? Text("Select Image")
                        : Text("Image Uploaded!"),
                  ),
                  Divider(
                    height: 5,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                      ),
                    ),
                    hint: Text(Globals.mould ?? "Mould"),
                    isExpanded: true,
                    items: <String>[
                      'Select Mould',
                      '2 piece Mould',
                      '3 Piece Mould',
                      'Combination Mould'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.mould = val;
                      });
                    },
                  ),
                  Divider(
                    height: 5,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                      ),
                    ),
                    hint: Text(Globals.msfc ?? "Mould Shoe Fixed Correctly"),
                    isExpanded: true,
                    items: <String>[
                      'Mould shoe Fixed',
                      'Yes Mould Shoe Fixed Correctly',
                      'No Mould Shoe Fixed Correctly'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      Globals.msfc = val;
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 10,
          ),
          TextButton(
            onPressed: () => showDialog(
              context: context,
              builder: (builder) => AlertDialog(
                title: Text("Select Mould Image From"),
                actions: [
                  TextButton(
                    onPressed: () => getImg2(1),
                    child: Text("Camera"),
                  ),
                  TextButton(
                    onPressed: () => getImg2(2),
                    child: Text("Gallery"),
                  ),
                  Globals.wsPimg2 != null
                      ? TextButton(
                          onPressed: () => showDialog(
                              context: context,
                              builder: (builder) => AlertDialog(
                                    title: Text("Image Preview"),
                                    content: Image.file(File(Globals.wsPimg2)),
                                  )),
                          child: Text("Preview"),
                        )
                      : Text("Select"),
                ],
              ),
              barrierDismissible: true,
              useSafeArea: true,
              useRootNavigator: true,
            ),
            // ignore: unnecessary_null_comparison
            child: Globals.wsPimg2 == null
                ? Text("Select Image")
                : Text("Image Uploaded!"),
          ),
          Divider(
            height: 50,
          ),
        ],
      ),
    );
  }
}
