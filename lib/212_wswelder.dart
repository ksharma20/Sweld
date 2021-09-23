import 'dart:io';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sweld/globals.dart';
import 'package:image_picker/image_picker.dart';

class WsWelder extends StatefulWidget {
  const WsWelder({Key? key}) : super(key: key);

  @override
  _WsWelderState createState() => _WsWelderState();
}

class _WsWelderState extends State<WsWelder> {
  final pageNum = 212;

  @override
  Widget build(BuildContext context) {
    ScreenshotController _ssc = ScreenshotController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Setup"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.popUntil(context, ModalRoute.withName('/')),
            icon: Icon(Icons.railway_alert_outlined),
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
                  onPressed: () => Navigator.popAndPushNamed(context, "/211"),
                  child: Text("Prev")),
              ElevatedButton(
                  onPressed: () async {
                    Globals.ss212 = await _ssc.captureAndSave(Globals.appDir,
                        fileName: "ss212.png",
                        pixelRatio: MediaQuery.of(context).devicePixelRatio,
                        delay: Duration(milliseconds: 250));
                    // Globals.saveImg(Globals.ss212, "ss212.png");

                    // Globals.setData('welder', Globals.welder);
                    // Globals.setData('deptcont', Globals.deptcont);
                    // Globals.setData('agency', Globals.agency);
                    // Globals.setData('avc', Globals.avc);
                    // Globals.setData('supervisor', Globals.supervisor);
                    // Globals.setData('svc', Globals.svc);
                    Globals.saveImg(Globals.wsWimg1, "wsWimg1.jpg");
                    Globals.saveImg(Globals.wsWimg2, "wsWimg2.jpg");

                    Globals.gotoWsr(context);
                  },
                  child: Text("Next")),
            ],
          ),
        ),
      ],
      extendBody: true,
      body: SingleChildScrollView(
        child: Screenshot(controller: _ssc, child: WsWelderBody()),
      ),
    );
  }
}

class WsWelderBody extends StatefulWidget {
  const WsWelderBody({Key? key}) : super(key: key);

  @override
  _WsWelderBodyState createState() => _WsWelderBodyState();
}

class _WsWelderBodyState extends State<WsWelderBody> {
  DateTime avctr = DateTime(2019);
  DateTime svctr = DateTime(2019);

  Widget selectVC(vctr) {
    if (vctr == DateTime(2019)) {
      return Text("Select Date");
    } else {
      if (vctr == avctr) {
        var navc = avctr.toString().split(" ");
        Globals.avc = navc[0];
        return Text("${Globals.avc}");
      } else if (vctr == svctr) {
        var nsvc = svctr.toString().split(" ");
        Globals.svc = nsvc[0];
        return Text("${Globals.svc}");
      }
      // Globals.setData("avc", Globals.avc);
      // Globals.setData("svc", Globals.svc);
    }

    return Text("$vctr");
  }

  Future getImg1(int op) async {
    if (op == 1) {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          Globals.wsWimg1 = image.path;
        });
      }
    } else {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          Globals.wsWimg1 = image.path;
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
          Globals.wsWimg2 = image.path;
        });
      }
    } else {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          Globals.wsWimg2 = image.path;
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
                "Welder / Supervisor",
                textScaleFactor: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Divider(
            thickness: 2,
            height: 50,
          ),
          Container(
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    initialValue: Globals.welder,
                    decoration: InputDecoration(
                      labelText: "Name of Welder",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        Globals.welder = val;
                      });
                    },
                  ),
                  Divider(
                    thickness: 0,
                    height: 10,
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
                    hint:
                        Text(Globals.deptcont ?? "Departmental / Contractual"),
                    isExpanded: true,
                    items: <String>['Select', 'Departmental', 'Contractual']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.deptcont = val;
                      });
                    },
                  ),
                  Divider(
                    thickness: 0,
                    height: 10,
                  ),
                  Globals.deptcont == 'Contractual'
                      ? DropdownButtonFormField<String>(
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
                          hint: Text(Globals.agency ?? "Name of Agency"),
                          isExpanded: true,
                          items: <String>[
                            'Select Agency',
                            'A.K. Construction Company',
                            'Chakradhar Industuries LLP',
                            'Harshad Thermic Industries pvt ltd',
                            'Ms Perfect Thermit Engg. Works',
                            'Raybon Metals P. ltd',
                            'Oberoi Thermit P. ltd',
                            'Rajasthan Engg. Works',
                            'Sagar Infra Rail International Limited',
                            'The Indian Thermit Corporation'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              Globals.agency = val;
                            });
                          },
                        )
                      : Divider(),
                  Divider(
                    thickness: 0,
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Validity Of Certificate "),
                      TextButton(
                          onPressed: () {
                            showDatePicker(
                              initialDatePickerMode: DatePickerMode.year,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              context: context,
                              initialDate: avctr,
                              firstDate: DateTime(2018),
                              lastDate: DateTime(2050),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  avctr = value;
                                  setState(() {
                                    var navc = value.toString().split(" ");
                                    Globals.avc = navc[0];
                                  });
                                });
                              }
                            });
                          },
                          child: Globals.avc != null
                              ? Text(Globals.avc)
                              : selectVC(avctr))
                    ],
                  ),
                  Divider(
                    thickness: 0,
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (builder) => AlertDialog(
                        title: Text("Select From"),
                        actions: [
                          TextButton(
                            onPressed: () => getImg1(1),
                            child: Text("Camera"),
                          ),
                          TextButton(
                            onPressed: () => getImg1(2),
                            child: Text("Gallery"),
                          ),
                          Globals.wsWimg1 != null
                              ? TextButton(
                                  onPressed: () => showDialog(
                                      context: context,
                                      builder: (builder) => AlertDialog(
                                            title: Text("Image Preview"),
                                            content: Image.file(
                                                File(Globals.wsWimg1)),
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
                    child: Globals.wsWimg1 == null
                        ? Text("Select Image")
                        : Text("Image Uploaded!"),
                  ),
                  Divider(
                    thickness: 0,
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: Globals.supervisor,
                    decoration: InputDecoration(
                      labelText: "Name of Supervisor",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        Globals.supervisor = val;
                      });
                    },
                  ),
                  Divider(
                    thickness: 0,
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Validity Of Certificate "),
                      TextButton(
                          onPressed: () {
                            showDatePicker(
                              initialDatePickerMode: DatePickerMode.year,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              context: context,
                              initialDate: svctr,
                              firstDate: DateTime(2018),
                              lastDate: DateTime(2050),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  svctr = value;
                                  setState(() {
                                    var navc = value.toString().split(" ");
                                    Globals.svc = navc[0];
                                  });
                                });
                              }
                            });
                          },
                          child: Globals.svc != null
                              ? Text(Globals.svc)
                              : selectVC(svctr))
                    ],
                  ),
                  Divider(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (builder) => AlertDialog(
                        title: Text("Select From"),
                        actions: [
                          TextButton(
                            onPressed: () => getImg2(1),
                            child: Text("Camera"),
                          ),
                          TextButton(
                            onPressed: () => getImg2(2),
                            child: Text("Gallery"),
                          ),
                          Globals.wsWimg2 != null
                              ? TextButton(
                                  onPressed: () => showDialog(
                                      context: context,
                                      builder: (builder) => AlertDialog(
                                            title: Text("Image Preview"),
                                            content: Image.file(
                                                File(Globals.wsWimg2)),
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
                    child: Globals.wsWimg2 == null
                        ? Text("Select Image")
                        : Text("Image Uploaded!"),
                  ),
                  Divider(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
