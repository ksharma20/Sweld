import 'package:flutter/material.dart';
import 'package:sweld/100_home.dart';
import 'package:sweld/211_weldsetup.dart';
import 'package:sweld/212_wswelder.dart';
import 'package:sweld/213_wsrail.dart';
import 'package:sweld/214_wsgmeasure.dart';
import 'package:sweld/215_wsportion.dart';
import 'package:sweld/216_wspreheat.dart';
import 'package:sweld/220_railpreheat.dart';
import 'package:sweld/230_ignition.dart';
import 'package:sweld/240_weldtriming.dart';
import 'package:sweld/250_grinding.dart';
import 'package:sweld/260_pdfGen.dart';
import 'package:sweld/300_finished.dart';

void main() => runApp(WeldApp());

class WeldApp extends StatelessWidget {
  const WeldApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sweld",
      home: Home(),
      routes: {
        "/211": (context) => WeldSetup(),
        "/212": (context) => WsWelder(),
        "/213": (context) => WsRail(),
        "/214": (context) => WsGmeasure(),
        "/215": (context) => WsPortion(),
        "/216": (context) => WsPreHeat(),
        "/220": (context) => RailPreHeat(),
        "/230": (context) => IgnitionTime(),
        "/240": (context) => WeldTrim(),
        "/250": (context) => Grinding(),
        "/260": (context) => PdfGen(),
        "/300": (context) => FinishedWelds(),
      },
      initialRoute: "/",
    );
  }
}
