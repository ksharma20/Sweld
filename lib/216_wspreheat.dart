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
                    hint: Text(Globals.pretec ?? "Preheating Technique"),
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
                        Globals.pretec = val;
                      });
                      if (val == 'Air Petrol Mixture') {
                        setState(() {
                          Globals.pretimeMin = 12;
                          Globals.pretimeSec = 0;
                        });
                        Globals.airpre = "7 ± 0.7 kg/cm²";
                      } else if (val == 'Compress Air Petrol') {
                        setState(() {
                          Globals.pretimeMin = 4;
                          Globals.pretimeSec = 30;
                        });
                        Globals.airpre = "0.2 - 0.3 kg/cm²";
                      } else if (val == 'Oxy - LPG Mix') {
                        setState(() {
                          Globals.pretimeMin = 2;
                          Globals.pretimeSec = 30;
                        });
                        Globals.oxygenpre = "7 - 8 kg/cm²";
                        Globals.lpgpre = "2 - 2.5 kg/cm²";
                      }
                    },
                  ),
                  Divider(
                    height: 30,
                  ),
                  preHeatTime(),
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

  Widget preHeatTime() {
    if (Globals.pretec == 'Air Petrol Mixture') {
      // setState(() {
      //   Globals.pretimeMin = 12;
      //   Globals.pretimeSec = 0;
      // });
      Globals.airpre = "7 ± 0.7 kg/cm²";
      return Column(
        children: [
          Text(
            "Preheating Time = ${Globals.pretimeMin}min ${Globals.pretimeSec}sec",
            textScaleFactor: 1.5,
          ),
          Divider(
            height: 25,
          ),
          Text(
            "Air Pressure = ${Globals.airpre}",
            textScaleFactor: 1.5,
          ),
        ],
      );
    } else if (Globals.pretec == 'Compress Air Petrol') {
      // setState(() {
      //   Globals.pretimeMin = 4;
      //   Globals.pretimeSec = 30;
      // });
      Globals.airpre = "0.2 - 0.3 kg/cm²";
      return Column(
        children: [
          Text(
            "Preheating Time = ${Globals.pretimeMin}min ${Globals.pretimeSec}sec",
            textScaleFactor: 1.5,
          ),
          Divider(
            height: 25,
          ),
          Text(
            "Air Pressure = ${Globals.airpre}",
            textScaleFactor: 1.5,
          ),
        ],
      );
    } else if (Globals.pretec == 'Oxy - LPG Mix') {
      // setState(() {
      //   Globals.pretimeMin = 2;
      //   Globals.pretimeSec = 30;
      // });
      Globals.oxygenpre = "7 - 8 kg/cm²";
      Globals.lpgpre = "2 - 2.5 kg/cm²";
      return Column(
        children: [
          Text(
            "Preheating Time = ${Globals.pretimeMin}min ${Globals.pretimeSec}sec",
            textScaleFactor: 1.5,
          ),
          Divider(
            height: 25,
          ),
          Text(
            "Oxygen Pressure = ${Globals.oxygenpre}",
            textScaleFactor: 1.5,
          ),
          Divider(
            height: 25,
          ),
          Text(
            "LPG Pressure = ${Globals.lpgpre}",
            textScaleFactor: 1.5,
          ),
        ],
      );
    } else {
      return Text(
        "Technique Yet to Be Selected...",
        textScaleFactor: 1.5,
      );
    }
  }
}
