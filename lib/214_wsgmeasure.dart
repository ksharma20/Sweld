import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sweld/globals.dart';

class WsGmeasure extends StatefulWidget {
  const WsGmeasure({Key? key}) : super(key: key);

  @override
  _WsGmeasureState createState() => _WsGmeasureState();
}

class _WsGmeasureState extends State<WsGmeasure> {
  final pageNum = 214;

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
                onPressed: () => Navigator.popAndPushNamed(context, "/213"),
                child: Text("Prev"),
              ),
              ElevatedButton(
                onPressed: () async {
                  Globals.ss214 = await _ssc.captureAndSave(Globals.appDir,
                      fileName: "ss214.png",
                      pixelRatio: MediaQuery.of(context).devicePixelRatio,
                      delay: Duration(milliseconds: 250));
                  // await Globals.setData('ss214.jpg', Globals.ss214);

                  // Globals.setData('gap', Globals.gap);
                  // Globals.setData('battering', Globals.battering);
                  // Globals.setData('hogging', Globals.hogging);
                  // Globals.setData('ecv', Globals.ecv);
                  // Globals.setData('eckw', Globals.eckw);
                  // Globals.setData('fbe', Globals.fbe);
                  // Globals.setData('lateral', Globals.lateral);
                  // Globals.setData('vertical', Globals.vertical);
                  // Globals.setData('fasr', Globals.fasr);
                  // Globals.saveImg(Globals.wsGimg1, 'wsGimg1.jpg');
                  // Globals.saveImg(Globals.wsGimg2, "wsGimg2.jpg");

                  Globals.gotoWsp(context);
                },
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ],
      extendBody: true,
      body: SingleChildScrollView(
          child: Screenshot(child: WsGmBody(), controller: _ssc)),
    );
  }
}

class WsGmBody extends StatefulWidget {
  const WsGmBody({Key? key}) : super(key: key);

  @override
  _WsGmBodyState createState() => _WsGmBodyState();
}

class _WsGmBodyState extends State<WsGmBody> {
  Future getImg1(int op) async {
    if (op == 1) {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          Globals.wsGimg1 = image.path;
        });
      }
    } else {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          Globals.wsGimg1 = image.path;
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
          Globals.wsGimg2 = image.path;
        });
      }
    } else {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          Globals.wsGimg2 = image.path;
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
                "Gap Measurement",
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
                  TextFormField(
                    initialValue: Globals.gap,
                    onChanged: (val) {
                      setState(() {
                        Globals.gap = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Gap",
                      hintText: "In mm",
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
                    initialValue: Globals.battering,
                    onChanged: (val) {
                      setState(() {
                        Globals.battering = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Battering",
                      hintText: "In mm",
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
                    initialValue: Globals.hogging,
                    onChanged: (val) {
                      setState(() {
                        Globals.hogging = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Hogging",
                      hintText: "In mm",
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
                    hint: Text(Globals.ecv ?? "End Cuts Vertical"),
                    isExpanded: true,
                    items: <String>[
                      'Select End Cuts Vertical',
                      'Yes End Cuts Vertical',
                      'No End Cuts Vertical'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.ecv = val;
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
                    hint: Text(
                        Globals.eckw ?? "Ends Cleaned by koil & wire-brush"),
                    isExpanded: true,
                    items: <String>[
                      'Select Ends Cleaned by..',
                      'Yes Ends Cleaned by kwb',
                      'No Ends Cleaned by kwb'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.eckw = val;
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
                    hint: Text(Globals.fbe ?? "Fish Bolts Eliminated"),
                    isExpanded: true,
                    items: <String>[
                      'Select Fish bolts eliminated',
                      'Yes Fish Bolts Eliminated',
                      'No Fish Bolts Eliminated'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.fbe = val;
                      });
                    },
                  ),
                  Divider(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Alignment of Rail \nwith 1m straight edge",
                textScaleFactor: 1.5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Divider(
            thickness: 2,
            height: 20,
          ),
          Container(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    initialValue: Globals.lateral,
                    onChanged: (val) {
                      setState(() {
                        Globals.lateral = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Lateral",
                      hintText: "within +- 0.5mm",
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
                  TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (builder) => AlertDialog(
                        title: Text("Select Lateral Alignment Image From"),
                        actions: [
                          TextButton(
                            onPressed: () => getImg1(1),
                            child: Text("Camera"),
                          ),
                          TextButton(
                            onPressed: () => getImg1(2),
                            child: Text("Gallery"),
                          ),
                          Globals.wsGimg1 != null
                              ? TextButton(
                                  onPressed: () => showDialog(
                                      context: context,
                                      builder: (builder) => AlertDialog(
                                            title: Text("Image Preview"),
                                            content: Image.file(
                                                File(Globals.wsGimg1)),
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
                    child: Globals.wsGimg1 == null
                        ? Text("Select Image")
                        : Text("Image Uploaded!"),
                  ),
                  Divider(
                    height: 5,
                  ),
                  TextFormField(
                    initialValue: Globals.vertical,
                    onChanged: (val) {
                      setState(() {
                        Globals.vertical = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Vertical",
                      hintText: "In mm",
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
                  TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (builder) => AlertDialog(
                        title: Text("Select Vertical Alignment Image From"),
                        actions: [
                          TextButton(
                            onPressed: () => getImg2(1),
                            child: Text("Camera"),
                          ),
                          TextButton(
                            onPressed: () => getImg2(2),
                            child: Text("Gallery"),
                          ),
                          Globals.wsGimg2 != null
                              ? TextButton(
                                  onPressed: () => showDialog(
                                      context: context,
                                      builder: (builder) => AlertDialog(
                                            title: Text("Image Preview"),
                                            content: Image.file(
                                                File(Globals.wsGimg2)),
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
                    child: Globals.wsGimg2 == null
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
                    hint: Text("Fastening of 5 adjacent sleeper reward"),
                    isExpanded: true,
                    items: <String>[
                      'Select Sleeper reward',
                      'Yes 5 adjacent sleeper reward',
                      'No 5 adjacent sleeper reward'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.fasr = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 50,
          ),
        ],
      ),
    );
  }
}
