import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sweld/globals.dart';

class WsRail extends StatefulWidget {
  const WsRail({Key? key}) : super(key: key);

  @override
  _WsRailState createState() => _WsRailState();
}

class _WsRailState extends State<WsRail> {
  final pageNum = 213;

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
                onPressed: () => Navigator.popAndPushNamed(context, "/212"),
                child: Text("Prev"),
              ),
              ElevatedButton(
                onPressed: () async {
                  Globals.ss213 = await _ssc.captureAndSave(Globals.appDir,
                      fileName: "ss213.png",
                      pixelRatio: MediaQuery.of(context).devicePixelRatio,
                      delay: Duration(milliseconds: 100));

                  // Globals.setData('ss213.jpg', Globals.ss213);

                  // Globals.setData('weight', Globals.weight);
                  // Globals.setData('uts', Globals.uts);
                  // Globals.setData('rails', Globals.rails);
                  // Globals.setData('condrails', Globals.condrails);
                  // Globals.setData('utbw', Globals.utbw);
                  // Globals.setData('tru', Globals.tru);
                  // Globals.setData('vwleft', Globals.vwleft);
                  // Globals.setData('vwright', Globals.vwright);
                  // Globals.setData('lwleft', Globals.lwleft);
                  // Globals.setData('lwright', Globals.lwright);
                  // Globals.setData('oldGMT', Globals.oldGMT);

                  Globals.gotoWsgm(context);
                },
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ],
      extendBody: true,
      body: SingleChildScrollView(
        child: Screenshot(child: WsRailBody(), controller: _ssc),
      ),
    );
  }
}

class WsRailBody extends StatefulWidget {
  const WsRailBody({Key? key}) : super(key: key);

  @override
  _WsRailBodyState createState() => _WsRailBodyState();
}

class _WsRailBodyState extends State<WsRailBody> {
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
                "Rail",
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
          Row(
            children: [
              Text(
                "RAIL SECTION",
                textScaleFactor: 1.5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0,
            height: 10,
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
                    hint: Text(Globals.weight ?? "Weight"),
                    isExpanded: true,
                    items: <String>['Select Weight', '60 kg', '52 kg', '90 R']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.weight = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 0,
            height: 10,
          ),
          Row(
            children: [
              Text(
                "RAIL UTS",
                textScaleFactor: 1.5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0,
            height: 10,
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
                    hint: Text(Globals.uts ?? "UTS"),
                    isExpanded: true,
                    items: <String>['Select UTS', '110 UTS', '90 UTS', '72 UTS']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.uts = val;
                      });
                    },
                  ),
                  Divider(
                    thickness: 0,
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
                    hint: Text(Globals.rails ?? "Rails"),
                    isExpanded: true,
                    items: <String>['Select Rails', 'OLD Rails', 'NEW Rails']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.rails = val;
                      });
                    },
                  ),
                  Divider(
                    thickness: 0,
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
                    hint: Text(Globals.condrails ?? "Condition of Rails"),
                    isExpanded: true,
                    items: <String>[
                      'Select Condition ',
                      'Good Condition of Rails',
                      'Satisfactory Condition of Rails',
                      'Not Satisfactory Condition of Rails'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.condrails = val;
                      });
                    },
                  ),
                  Divider(
                    thickness: 0,
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
                    hint: Text(Globals.utbw ?? "USFD Testing Before Welding"),
                    isExpanded: true,
                    items: <String>[
                      'USFD Testing',
                      'Yes USFD Testing Before Welding',
                      'Not USFD Testing Before Welding'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.utbw = val;
                      });
                    },
                  ),
                  Divider(
                    thickness: 0,
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
                    hint: Text(Globals.tru ?? "Test Result USFD"),
                    isExpanded: true,
                    items: <String>[
                      'Test Result',
                      'Test Result USFD OK',
                      'Test Result USFD Not OK'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        Globals.tru = val;
                      });
                    },
                  ),
                  Divider(
                    thickness: 0,
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Vertical Wear",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 0,
                    height: 10,
                  ),
                  Container(
                    child: Form(
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              initialValue: Globals.vwleft,
                              decoration: InputDecoration(
                                labelText: "Left",
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
                                  Globals.vwleft = val;
                                });
                              },
                            ),
                          ),
                          Divider(
                            thickness: 0,
                            indent: 8,
                          ),
                          Flexible(
                            child: TextFormField(
                              initialValue: Globals.vwright,
                              decoration: InputDecoration(
                                labelText: "Right",
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
                                  Globals.vwright = val;
                                });
                              },
                            ),
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
                        "Lateral Wear",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 0,
                    height: 10,
                  ),
                  Container(
                    child: Form(
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              initialValue: Globals.lwleft,
                              decoration: InputDecoration(
                                labelText: "Left",
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
                                  Globals.lwleft = val;
                                });
                              },
                            ),
                          ),
                          Divider(
                            thickness: 0,
                            indent: 8,
                          ),
                          Flexible(
                            child: TextFormField(
                              initialValue: Globals.lwright,
                              decoration: InputDecoration(
                                labelText: "Right",
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
                                  Globals.lwright = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: Globals.oldGMT,
                    decoration: InputDecoration(
                      labelText: "If Old GMT Carried by Rails",
                      hintText: "Mention Its values",
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
                        Globals.oldGMT = val;
                      });
                    },
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
