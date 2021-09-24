import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sweld/globals.dart';

class WsPreHeat extends StatefulWidget {
  const WsPreHeat({Key? key}) : super(key: key);

  @override
  _WsPreHeatState createState() => _WsPreHeatState();
}

class _WsPreHeatState extends State<WsPreHeat> {
  final pageNum = 216;

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
          child: ElevatedButton(
            onPressed: () async {
              Globals.ss216 = await _ssc.captureAndSave(Globals.appDir,
                  fileName: "ss216.png",
                  pixelRatio: MediaQuery.of(context).devicePixelRatio,
                  delay: Duration(milliseconds: 100));
              // Globals.setData('ss216.jpg', Globals.ss216);

              // Globals.setData('pretec', Globals.pretec);
              // Globals.setData('pretime', Globals.pretime);
              // Globals.setData('airpre', Globals.airpre);
              // Globals.setData('oxygenpre', Globals.oxygenpre);
              // Globals.setData('lpgpre', Globals.lpgpre);

              Globals.gotoRph(context);
            },
            child: Text("Proceed to STAGE 2"),
          ),
        ),
      ],
      extendBody: true,
      body: SingleChildScrollView(
          child: Screenshot(child: WsPhBody(), controller: _ssc)),
    );
  }
}

class WsPhBody extends StatefulWidget {
  const WsPhBody({Key? key}) : super(key: key);

  @override
  _WsPhBodyState createState() => _WsPhBodyState();
}

class _WsPhBodyState extends State<WsPhBody> {
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
                "Preheating Parameters",
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
                    hint: Text("Preheating Technique"),
                    isExpanded: true,
                    items: <String>[
                      'Select Technique',
                      'Air Petrol Mixture',
                      'Compress Air Petrol',
                      'Oxy - LPG Mix'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        setState(() {
                          Globals.pretec = val;
                        });
                      });
                    },
                  ),
                  Divider(
                    height: 5,
                  ),
                  TextFormField(
                    initialValue: Globals.pretime.toString(),
                    onChanged: (val) {
                      Globals.pretime = int.parse(val);
                    },
                    decoration: InputDecoration(
                      labelText: "Preheating Time",
                      hintText: "in mins",
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
                  (Globals.pretec == 'Air Petrol Mixture' ||
                          Globals.pretec == 'Compress Air Petrol')
                      ? TextFormField(
                          initialValue: Globals.airpre,
                          onChanged: (val) {
                            setState(() {
                              Globals.airpre = val;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Air Pressure",
                            hintText: "In kg/cm^2",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(),
                              gapPadding: 5,
                            ),
                          ),
                        )
                      : Divider(),
                  Divider(
                    height: 5,
                  ),
                  Globals.pretec == 'Oxy - LPG Mix'
                      ? TextFormField(
                          initialValue: Globals.oxygenpre,
                          onChanged: (val) {
                            setState(() {
                              Globals.oxygenpre = val;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Oxygen Pressure",
                            hintText: "In kg/cm^2",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(),
                              gapPadding: 5,
                            ),
                          ),
                        )
                      : Divider(),
                  Divider(
                    height: 5,
                  ),
                  Globals.pretec == 'Oxy - LPG Mix'
                      ? TextFormField(
                          initialValue: Globals.lpgpre,
                          onChanged: (val) {
                            setState(() {
                              Globals.lpgpre = val;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "LPG Pressure",
                            hintText: "In kg/cm^2",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(),
                              gapPadding: 5,
                            ),
                          ),
                        )
                      : Divider(),
                  Divider(
                    height: 5,
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
