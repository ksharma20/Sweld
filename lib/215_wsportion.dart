import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sweld/globals.dart';

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
  Future getImg1() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        Globals.wsPimg1 = image.path;
      });
    }
    Globals.dtwsP1 =
        "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}-${DateTime.now().minute.toString().padLeft(2, '0')}";
  }

  Future getImg2() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        Globals.wsPimg2 = image.path;
      });
    }
    Globals.dtwsP2 =
        "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}-${DateTime.now().minute.toString().padLeft(2, '0')}";
  }

  Future getImg3() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        Globals.wsPimg3 = image.path;
      });
    }
    Globals.dtwsP3 =
        "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}-${DateTime.now().minute.toString().padLeft(2, '0')}";
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Date of Portion Manufacture"),
                      TextButton(
                          onPressed: () {
                            showDatePicker(
                              initialDatePickerMode: DatePickerMode.year,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              context: context,
                              initialDate: DateTime(2019),
                              firstDate: DateTime(2018),
                              lastDate: DateTime(2050),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  var navc = value.toString().split(" ");
                                  Globals.datepor = navc[0];
                                });
                              }
                            });
                          },
                          child: Globals.datepor != null
                              ? Text(Globals.datepor)
                              : Text("Select Date"))
                    ],
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
                    onPressed: () => getImg1(),
                    child: Globals.wsPimg1 == null
                        ? Text("Image of Portion Slip")
                        : Text("Image Uploaded! for Packet"),
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
            onPressed: () => getImg2(),
            child: Globals.wsPimg2 == null
                ? Text("Select Mould Left Image")
                : Text("Image Uploaded! for Mould - Left"),
          ),
          Divider(
            height: 10,
          ),
          TextButton(
            onPressed: () => getImg3(),
            child: Globals.wsPimg3 == null
                ? Text("Select Mould Right Image")
                : Text("Image Uploaded! for Mould - Right"),
          ),
          Divider(
            height: 50,
          ),
        ],
      ),
    );
  }
}
