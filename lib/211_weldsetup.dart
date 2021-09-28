import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sweld/globals.dart';
import 'package:geolocator/geolocator.dart';

class WeldSetup extends StatefulWidget {
  WeldSetup({Key? key}) : super(key: key);

  @override
  State<WeldSetup> createState() => _WeldSetupState();
}

class _WeldSetupState extends State<WeldSetup> {
  final pageNum = 211;

  @override
  Widget build(BuildContext context) {
    final _ssc = ScreenshotController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Weld Setup"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Globals.gotoHome(context),
            icon: Icon(Icons.railway_alert_rounded),
          ),
        ],
      ),
      body: Screenshot(controller: _ssc, child: WsLocation()),
      persistentFooterButtons: [
        ElevatedButton(
            onPressed: () async {
              Globals.ss211 = await _ssc.captureAndSave(Globals.appDir,
                  fileName: "ss211.png",
                  pixelRatio: MediaQuery.of(context).devicePixelRatio,
                  delay: Duration(milliseconds: 100));

              // Globals.setData('longitude', Globals.longitude);
              // Globals.setData('latitude', Globals.latitude);
              // Globals.setData('section', Globals.section);
              // Globals.setData('division', Globals.division);
              // Globals.setData('distance', Globals.distance);
              // Globals.setData('line', Globals.line);
              // Globals.setData('stime', Globals.stime);
              // Globals.setData('etime', Globals.etime);

              Globals.gotoWsw(context);
            },
            child: Text("Next"))
      ],
      extendBody: true,
    );
  }
}

class WsLocation extends StatefulWidget {
  const WsLocation({Key? key}) : super(key: key);

  @override
  _WsLocationState createState() => _WsLocationState();
}

class _WsLocationState extends State<WsLocation> {
  late Position curPos;
  var longitute = Globals.longitude;
  var latitude = Globals.latitude;
  TimeOfDay sTime = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay eTime = TimeOfDay(hour: 00, minute: 00);

  Widget selectTime(time) {
    if (time == TimeOfDay(hour: 00, minute: 00)) {
      return Text("Select");
    } else {
      if (time == sTime) {
        return Text("${Globals.stime}");
      } else {
        return Text("${Globals.etime}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "LOCATION",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: TextFormField(
                            initialValue: Globals.longitude,
                            decoration: InputDecoration(
                              labelText: "Longitude",
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
                                Globals.longitude = val;
                              });
                            },
                          ),
                        ),
                        Divider(
                          indent: 5,
                        ),
                        Flexible(
                          child: TextFormField(
                            initialValue: Globals.latitude,
                            decoration: InputDecoration(
                              labelText: "Latitude",
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
                                Globals.latitude = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0,
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: Globals.section,
                      decoration: InputDecoration(
                        labelText: "Section",
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
                          Globals.section = val;
                        });
                      },
                    ),
                    Divider(
                      thickness: 0,
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: Globals.division,
                      decoration: InputDecoration(
                        labelText: "Division",
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
                        Globals.division = val;
                      },
                    ),
                    Divider(
                      thickness: 0,
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: Globals.distance,
                      decoration: InputDecoration(
                        labelText: "Kilometerage",
                        hintText: "In kilometers(km)",
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
                        Globals.distance = val;
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
                      hint: Text("Line"),
                      isExpanded: true,
                      items: <String>['Single', 'Up-Line', 'Down-Line']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        Globals.line = val;
                      },
                    ),
                    Divider(
                      thickness: 0,
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Divider(
                            indent: 5,
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Divider(
                                  indent: 15,
                                  endIndent: 5,
                                ),
                                Text("Block of\nStart Time"),
                                TextButton(
                                  onPressed: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: sTime)
                                        .then((value) {
                                      if (value != null) {
                                        setState(() {
                                          sTime = value;
                                          Globals.stime = value.format(context);
                                        });
                                      }
                                    });
                                  },
                                  child: Globals.stime == null
                                      ? selectTime(sTime)
                                      : Text(" ${Globals.stime} "),
                                ),
                              ],
                            ),
                          ),
                          // Divider(
                          //   thickness: 0,
                          //   indent: 5,
                          // ),
                          Flexible(
                            child: Row(
                              children: [
                                Divider(
                                  indent: 30,
                                ),
                                Text("Block of\nEnd Time"),
                                TextButton(
                                  onPressed: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: eTime)
                                        .then((value) {
                                      if (value != null) {
                                        setState(() {
                                          eTime = value;
                                          Globals.etime = value.format(context);
                                        });
                                      }
                                    });
                                  },
                                  child: Globals.etime == null
                                      ? selectTime(eTime)
                                      : Text(" ${Globals.etime} "),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
      ),
    );
  }
}
