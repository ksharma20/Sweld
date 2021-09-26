import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:sweld/globals.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  initState() {
    getReqData();
    super.initState();
  }

  Widget inPro() {
    if (Globals.pageNum == 100) {
      return Text("No Process Started Yet \nStart a New Weld");
    } else if (Globals.pageNum < 260) {
      return Text(
          "Weld Started at ${Globals.dt211} \nProcess ID : ${Globals.pageNum} ");
    } else {
      return Text(
          "Started Process has Already passed the Setup Process !. \nTherefore Start a New Weld");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Navigator.canPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Smart Weld"),
          actions: [
            // IconButton(
            //   icon: Icon(
            //     Icons.refresh_outlined,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //     setState(() {});
            //   },
            // ),
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.railway_alert_sharp))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text("Menu")),
              ListTile(
                title: Text("Home"),
                onTap: () => Globals.gotoHome(context),
              ),
              ListTile(
                title: Text("Start New Weld"),
                onTap: () => Globals.gotoWs(context),
              ),
              ListTile(
                title: Text("Finished Weld"),
                onTap: () => Globals.gotoFin(context),
              ),
              ListTile(
                title: Text("Manuals"),
                onTap: () => Globals.gotoMan(context),
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "IN PROCESS",
                      textScaleFactor: 3,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      if (Globals.pageNum == 211) {
                        Navigator.pushNamed(context, "/211");
                      } else if (Globals.pageNum == 212) {
                        Navigator.pushNamed(context, "/212");
                      } else if (Globals.pageNum == 213) {
                        Navigator.pushNamed(context, "/213");
                      } else if (Globals.pageNum == 214) {
                        Navigator.pushNamed(context, "/214");
                      } else if (Globals.pageNum == 215) {
                        Navigator.pushNamed(context, "/215");
                      } else if (Globals.pageNum == 216) {
                        Navigator.pushNamed(context, "/216");
                      } else if (Globals.pageNum == 220) {
                        Navigator.pushNamed(context, "/220");
                      } else if (Globals.pageNum == 230) {
                        Navigator.pushNamed(context, "/230");
                      } else if (Globals.pageNum == 240) {
                        Navigator.pushNamed(context, "/240");
                      } else if (Globals.pageNum == 250) {
                        Navigator.pushNamed(context, "/250");
                      } else {
                        Globals.gotoWs(context);
                      }
                    },
                    child: inPro(),
                  ),
                ],
              ),
              Divider(
                thickness: 4,
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "FINISHED WELD",
                      textScaleFactor: 3,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Globals.opdfName == null
                        ? Center(
                            child:
                                Text("Finished PDF files will be Shown Here."),
                          )
                        : TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ViewPDF(pathPDF: Globals.opdfName);
                                //open viewPDF page on click
                              }));
                            },
                            child: Text(
                                "Click to view Latest Generated pdf Report"),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
        persistentFooterButtons: [
          ElevatedButton(
            onPressed: () {
              clearData();

              Globals.gotoWs(context);
            },
            child: Text(
              "Start a New Weld",
            ),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size.fromWidth(1000)),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getReqData() async {
    if (Globals.appDir == "/storage/emulated/0/sweld/") {
      final storagePre = await Permission.storage.request();
      final exStoragePre = await Permission.manageExternalStorage.request();
      if (await Directory("storage/emulated/0/sweld").exists()) {
        Globals.appDir = Directory("storage/emulated/0/sweld").path;
      } else {
        if (storagePre.isGranted && exStoragePre.isGranted) {
          final path = await Directory("storage/emulated/0/sweld").create();
          Globals.appDir = path.path;
        } else {
          await Permission.manageExternalStorage.request();
          showDialog(
              context: context,
              builder: (context) => Text(
                  "Permissions Not Granted. ThereFore App is Not going to Work"));
          final path = await Directory("storage/emulated/0/sweld").create();
          Globals.appDir = path.path;
        }
      }
    } else {
      Globals.appDir = "storage/emulated/0/sweld";
    }

    if (Globals.pageNum == 0) {
      setState(() {
        Globals.pageNum = 100;
      });
    } else {
      var pgn = Globals.pageNum;
      var dt = Globals.dt211;
      setState(() {
        Globals.pageNum = pgn;
        Globals.dt211 = dt;
      });
    }
  }

  void clearData() {
    Globals.longitude = null;
    Globals.latitude = null;
    Globals.section = null;
    Globals.division = null;
    Globals.distance = null;
    Globals.line = null;
    Globals.stime = null;
    Globals.etime = null;
    Globals.welder = null;
    Globals.deptcont = null;
    Globals.dept = null;
    Globals.agency = null;
    Globals.avc = null;
    Globals.supervisor = null;
    Globals.svc = null;
    Globals.weight = null;
    Globals.uts = null;
    Globals.rails = null;
    Globals.condrails = null;
    Globals.utbw = null;
    Globals.tru = null;
    Globals.vwleft = null;
    Globals.vwright = null;
    Globals.lwleft = null;
    Globals.lwright = null;
    Globals.oldGMT = null;
    Globals.gap = null;
    Globals.battering = null;
    Globals.hogging = null;
    Globals.ecv = null;
    Globals.eckw = null;
    Globals.fbe = null;
    Globals.lateral = null;
    Globals.vertical = null;
    Globals.fasr = null;
    Globals.pms = null;
    Globals.datepor = null;
    Globals.porno = null;
    Globals.utsd = null;
    Globals.cpp = null;
    Globals.cop = null;
    Globals.mould = null;
    Globals.msfc = null;
    Globals.pretec = null;
    Globals.airpre = null;
    Globals.oxygenpre = null;
    Globals.lpgpre = null;
    Globals.grinding = null;
    Globals.ftpa = null;
    Globals.ftpasr = null;
    Globals.gva = null;
    Globals.gla = null;
    Globals.gfts = null;
    Globals.gfsr = null;

    Globals.wsWimg1 = null;
    Globals.wsWimg2 = null;
    Globals.wsGimg1 = null;
    Globals.wsGimg2 = null;
    Globals.wsPimg1 = null;
    Globals.wsPimg2 = null;
    Globals.rimg1 = null;
    Globals.rimg2 = null;
    Globals.iimg1 = null;
    Globals.wTimg1 = null;
    Globals.gimg1 = null;

    Globals.opdfName = Globals.pdfName;
    Globals.pdfName = null;
  }
}

// cnr(int pageNo) async {
//   if (pageNo == 211) {
//     if (Globals.section == null) {
//       Globals.longitude = await Globals.getData('longitude');
//       Globals.latitude = await Globals.getData('latitude');
//       Globals.section = await Globals.getData('section');
//       Globals.division = await Globals.getData('division');
//       Globals.distance = await Globals.getData('distance');
//       Globals.line = await Globals.getData('line');
//       Globals.stime = await Globals.getData('stime');
//       Globals.etime = await Globals.getData('etime');
//       Navigator.pushNamed(context, "/211");
//     } else {
//       Navigator.pushNamedAndRemoveUntil(
//           context, "/211", ModalRoute.withName("/211"));
//     }
//   } else if (pageNo == 212) {
//     if (Globals.welder == null) {
//       Globals.longitude = await Globals.getData('longitude');
//       Globals.latitude = await Globals.getData('latitude');
//       Globals.section = await Globals.getData('section');
//       Globals.division = await Globals.getData('division');
//       Globals.distance = await Globals.getData('distance');
//       Globals.line = await Globals.getData('line');
//       Globals.stime = await Globals.getData('stime');
//       Globals.etime = await Globals.getData('etime');
//       Globals.welder = await Globals.getData('welder');
//       Globals.deptcont = await Globals.getData('deptcont');
//       Globals.dept = await Globals.getData('dept');
//       Globals.agency = await Globals.getData('agency');
//       Globals.avc = await Globals.getData('avc');
//       Globals.supervisor = await Globals.getData('supervisor');
//       Globals.svc = await Globals.getData('svc');

//       var imgPath1 = await Globals.getData('wsWimg1.jpg');
//       if (imgPath1 != null) {
//         Globals.wsWimg1 = File(imgPath1);
//       }
//       var imgPath2 = await Globals.getData('wsWimg2.jpg');
//       if (imgPath2 != null) {
//         Globals.wsWimg2 = File(imgPath2);
//       }

//       Navigator.pushNamed(context, "/212");
//     } else {
//       Navigator.pushNamedAndRemoveUntil(
//           context, "/212", ModalRoute.withName("/212"));
//     }
//   } else if (pageNo == 213) {
//     if (Globals.weight == null) {
//       Globals.longitude = await Globals.getData('longitude');
//       Globals.latitude = await Globals.getData('latitude');
//       Globals.section = await Globals.getData('section');
//       Globals.division = await Globals.getData('division');
//       Globals.distance = await Globals.getData('distance');
//       Globals.line = await Globals.getData('line');
//       Globals.stime = await Globals.getData('stime');
//       Globals.etime = await Globals.getData('etime');
//       Globals.welder = await Globals.getData('welder');
//       Globals.deptcont = await Globals.getData('deptcont');
//       Globals.dept = await Globals.getData('dept');
//       Globals.agency = await Globals.getData('agency');
//       Globals.avc = await Globals.getData('avc');
//       Globals.supervisor = await Globals.getData('supervisor');
//       Globals.svc = await Globals.getData('svc');

//       var imgPath1 = await Globals.getData('wsWimg1.jpg');
//       if (imgPath1 != null) {
//         Globals.wsWimg1 = File(imgPath1);
//       }
//       var imgPath2 = await Globals.getData('wsWimg2.jpg');
//       if (imgPath2 != null) {
//         Globals.wsWimg2 = File(imgPath2);
//       }

//       Globals.weight = await Globals.getData('weight');
//       Globals.uts = await Globals.getData('uts');
//       Globals.rails = await Globals.getData('rails');
//       Globals.condrails = await Globals.getData('condrails');
//       Globals.utbw = await Globals.getData('utbw');
//       Globals.tru = await Globals.getData('tru');
//       Globals.vwleft = await Globals.getData('vwleft');
//       Globals.vwright = await Globals.getData('vwright');
//       Globals.lwleft = await Globals.getData('lwleft');
//       Globals.lwright = await Globals.getData('lwright');
//       Globals.oldGMT = await Globals.getData('oldGMT');
//       Navigator.pushNamed(context, "/213");
//     } else {
//       Navigator.pushNamedAndRemoveUntil(
//           context, "/213", ModalRoute.withName("/213"));
//     }
//   } else if (pageNo == 214) {
//     if (Globals.gap == null) {
//       Globals.longitude = await Globals.getData('longitude');
//       Globals.latitude = await Globals.getData('latitude');
//       Globals.section = await Globals.getData('section');
//       Globals.division = await Globals.getData('division');
//       Globals.distance = await Globals.getData('distance');
//       Globals.line = await Globals.getData('line');
//       Globals.stime = await Globals.getData('stime');
//       Globals.etime = await Globals.getData('etime');
//       Globals.welder = await Globals.getData('welder');
//       Globals.deptcont = await Globals.getData('deptcont');
//       Globals.dept = await Globals.getData('dept');
//       Globals.agency = await Globals.getData('agency');
//       Globals.avc = await Globals.getData('avc');
//       Globals.supervisor = await Globals.getData('supervisor');
//       Globals.svc = await Globals.getData('svc');

//       var imgPath1 = await Globals.getData('wsWimg1.jpg');
//       if (imgPath1 != null) {
//         Globals.wsWimg1 = File(imgPath1);
//       }
//       var imgPath2 = await Globals.getData('wsWimg2.jpg');
//       if (imgPath2 != null) {
//         Globals.wsWimg2 = File(imgPath2);
//       }

//       Globals.weight = await Globals.getData('weight');
//       Globals.uts = await Globals.getData('uts');
//       Globals.rails = await Globals.getData('rails');
//       Globals.condrails = await Globals.getData('condrails');
//       Globals.utbw = await Globals.getData('utbw');
//       Globals.tru = await Globals.getData('tru');
//       Globals.vwleft = await Globals.getData('vwleft');
//       Globals.vwright = await Globals.getData('vwright');
//       Globals.lwleft = await Globals.getData('lwleft');
//       Globals.lwright = await Globals.getData('lwright');
//       Globals.oldGMT = await Globals.getData('oldGMT');
//       Globals.gap = await Globals.getData('gap');
//       Globals.battering = await Globals.getData('battering');
//       Globals.hogging = await Globals.getData('hogging');
//       Globals.ecv = await Globals.getData('ecv');
//       Globals.eckw = await Globals.getData('eckw');
//       Globals.fbe = await Globals.getData('fbe');
//       Globals.lateral = await Globals.getData('lateral');
//       Globals.vertical = await Globals.getData('vertical');
//       Globals.fasr = await Globals.getData('fasr');

//       var imgPath3 = await Globals.getData('wsGimg1.jpg');
//       if (imgPath3 != null) {
//         Globals.wsGimg1 = File(imgPath3);
//       }
//       var imgPath4 = await Globals.getData('wsGimg2.jpg');
//       if (imgPath4 != null) {
//         Globals.wsGimg2 = File(imgPath4);
//       }

//       Navigator.pushNamed(context, "/214");
//     } else {
//       Navigator.pushNamedAndRemoveUntil(
//           context, "/214", ModalRoute.withName("/214"));
//     }
//   } else if (pageNo == 215) {
//     if (Globals.pms == null) {
//       Globals.longitude = await Globals.getData('longitude');
//       Globals.latitude = await Globals.getData('latitude');
//       Globals.section = await Globals.getData('section');
//       Globals.division = await Globals.getData('division');
//       Globals.distance = await Globals.getData('distance');
//       Globals.line = await Globals.getData('line');
//       Globals.stime = await Globals.getData('stime');
//       Globals.etime = await Globals.getData('etime');
//       Globals.welder = await Globals.getData('welder');
//       Globals.deptcont = await Globals.getData('deptcont');
//       Globals.dept = await Globals.getData('dept');
//       Globals.agency = await Globals.getData('agency');
//       Globals.avc = await Globals.getData('avc');
//       Globals.supervisor = await Globals.getData('supervisor');
//       Globals.svc = await Globals.getData('svc');

//       var imgPath1 = await Globals.getData('wsWimg1.jpg');
//       if (imgPath1 != null) {
//         Globals.wsWimg1 = File(imgPath1);
//       }
//       var imgPath2 = await Globals.getData('wsWimg2.jpg');
//       if (imgPath2 != null) {
//         Globals.wsWimg2 = File(imgPath2);
//       }

//       Globals.weight = await Globals.getData('weight');
//       Globals.uts = await Globals.getData('uts');
//       Globals.rails = await Globals.getData('rails');
//       Globals.condrails = await Globals.getData('condrails');
//       Globals.utbw = await Globals.getData('utbw');
//       Globals.tru = await Globals.getData('tru');
//       Globals.vwleft = await Globals.getData('vwleft');
//       Globals.vwright = await Globals.getData('vwright');
//       Globals.lwleft = await Globals.getData('lwleft');
//       Globals.lwright = await Globals.getData('lwright');
//       Globals.oldGMT = await Globals.getData('oldGMT');
//       Globals.gap = await Globals.getData('gap');
//       Globals.battering = await Globals.getData('battering');
//       Globals.hogging = await Globals.getData('hogging');
//       Globals.ecv = await Globals.getData('ecv');
//       Globals.eckw = await Globals.getData('eckw');
//       Globals.fbe = await Globals.getData('fbe');
//       Globals.lateral = await Globals.getData('lateral');
//       Globals.vertical = await Globals.getData('vertical');
//       Globals.fasr = await Globals.getData('fasr');

//       var imgPath3 = await Globals.getData('wsGimg1.jpg');
//       if (imgPath3 != null) {
//         Globals.wsGimg1 = File(imgPath3);
//       }
//       var imgPath4 = await Globals.getData('wsGimg2.jpg');
//       if (imgPath4 != null) {
//         Globals.wsGimg2 = File(imgPath4);
//       }

//       Globals.pms = await Globals.getData('pms');
//       Globals.datepor = await Globals.getData('datepor');
//       Globals.porno = await Globals.getData('porno');
//       Globals.utsd = await Globals.getData('utsd');
//       Globals.cpp = await Globals.getData('cpp');
//       Globals.cop = await Globals.getData('cop');
//       Globals.mould = await Globals.getData('mould');
//       Globals.msfc = await Globals.getData('msfc');

//       var imgPath5 = await Globals.getData('wsPimg1.jpg');
//       if (imgPath5 != null) {
//         Globals.wsPimg1 = File(imgPath5);
//       }
//       var imgPath6 = await Globals.getData('wsPimg2.jpg');
//       if (imgPath6 != null) {
//         Globals.wsPimg2 = File(imgPath6);
//       }
//       Navigator.pushNamed(context, "/215");
//     } else {
//       Navigator.pushNamedAndRemoveUntil(
//           context, "/215", ModalRoute.withName("/215"));
//     }
//   } else if (pageNo == 216) {
//     if (Globals.pretec == null) {
//       Globals.longitude = await Globals.getData('longitude');
//       Globals.latitude = await Globals.getData('latitude');
//       Globals.section = await Globals.getData('section');
//       Globals.division = await Globals.getData('division');
//       Globals.distance = await Globals.getData('distance');
//       Globals.line = await Globals.getData('line');
//       Globals.stime = await Globals.getData('stime');
//       Globals.etime = await Globals.getData('etime');
//       Globals.welder = await Globals.getData('welder');
//       Globals.deptcont = await Globals.getData('deptcont');
//       Globals.dept = await Globals.getData('dept');
//       Globals.agency = await Globals.getData('agency');
//       Globals.avc = await Globals.getData('avc');
//       Globals.supervisor = await Globals.getData('supervisor');
//       Globals.svc = await Globals.getData('svc');

//       var imgPath1 = await Globals.getData('wsWimg1.jpg');
//       if (imgPath1 != null) {
//         Globals.wsWimg1 = File(imgPath1);
//       }
//       var imgPath2 = await Globals.getData('wsWimg2.jpg');
//       if (imgPath2 != null) {
//         Globals.wsWimg2 = File(imgPath2);
//       }

//       Globals.gap = await Globals.getData('gap');
//       Globals.battering = await Globals.getData('battering');
//       Globals.hogging = await Globals.getData('hogging');
//       Globals.ecv = await Globals.getData('ecv');
//       Globals.eckw = await Globals.getData('eckw');
//       Globals.fbe = await Globals.getData('fbe');
//       Globals.lateral = await Globals.getData('lateral');
//       Globals.vertical = await Globals.getData('vertical');
//       Globals.fasr = await Globals.getData('fasr');

//       var imgPath3 = await Globals.getData('wsGimg1.jpg');
//       if (imgPath3 != null) {
//         Globals.wsGimg1 = File(imgPath3);
//       }
//       var imgPath4 = await Globals.getData('wsGimg2.jpg');
//       if (imgPath4 != null) {
//         Globals.wsGimg2 = File(imgPath4);
//       }

//       Globals.pms = await Globals.getData('pms');
//       Globals.datepor = await Globals.getData('datepor');
//       Globals.porno = await Globals.getData('porno');
//       Globals.utsd = await Globals.getData('utsd');
//       Globals.cpp = await Globals.getData('cpp');
//       Globals.cop = await Globals.getData('cop');
//       Globals.mould = await Globals.getData('mould');
//       Globals.msfc = await Globals.getData('msfc');

//       var imgPath5 = await Globals.getData('wsPimg1.jpg');
//       if (imgPath5 != null) {
//         Globals.wsPimg1 = File(imgPath5);
//       }
//       var imgPath6 = await Globals.getData('wsPimg2.jpg');
//       if (imgPath6 != null) {
//         Globals.wsPimg2 = File(imgPath6);
//       }
//       Globals.pretec = await Globals.getData('pretec');
//       Globals.pretime = await Globals.getData('pretime');
//       Globals.airpre = await Globals.getData('airpre');
//       Globals.oxygenpre = await Globals.getData('oxygenpre');
//       Globals.lpgpre = await Globals.getData('lpgpre');

//       Navigator.pushNamed(context, "/216");
//     } else {
//       Navigator.pushNamedAndRemoveUntil(
//           context, "/216", ModalRoute.withName("/216"));
//     }
//   } else if (pageNo > 216) {
//     Globals.gotoWs(context);
//   } else {
//     Globals.gotoHome(context);
//   }
// }

class ViewPDF extends StatelessWidget {
  final String pathPDF;
  ViewPDF({required this.pathPDF});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //view PDF
        appBar: AppBar(
          title: Text("PDF Document Report"),
          actions: [
            IconButton(
                onPressed: () =>
                    Share.shareFiles([pathPDF], text: "My PDF Report"),
                icon: Icon(Icons.share)),
          ],
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: SfPdfViewer.file(File(pathPDF)));
  }
}
