import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sweld/400_manuals.dart';
import 'package:geolocator/geolocator.dart';

class Globals {
// Required Variable
  static var longitude;
  static var latitude;
  static var section;
  static var division;
  static var distance;
  static var line;
  static var stime;
  static var etime;
  static var welder;
  static var deptcont;
  static var dept;
  static var agency;
  static var avc;
  static var supervisor;
  static var svc;
  static var weight;
  static var uts;
  static var rails;
  static var condrails;
  static var utbw;
  static var tru;
  static var vwleft;
  static var vwright;
  static var lwleft;
  static var lwright;
  static var oldGMT;
  static var gap;
  static var battering;
  static var hogging;
  static var ecv;
  static var eckw;
  static var fbe;
  static var lateral;
  static var vertical;
  static var fasr;
  static var pms;
  static var datepor;
  static var porno;
  static var utsd;
  static var cpp;
  static var cop;
  static var mould;
  static var msfc;
  static var pretec;
  static var pretime = 5;
  static var airpre;
  static var oxygenpre;
  static var lpgpre;
  static var grinding;
  static var ftpa;
  static var ftpasr;
  static var gva;
  static var gla;
  static var gfts;
  static var gfsr;

//Directory path
  static String appDir = "/storage/emulated/0/sweld/";

// Hive Storage Box
  // static var storage = Hive.box('storage');

// Page Number Counter
  static int pageNum = 0;

// ScreenShot controller
  // static var ssc = ScreenshotController();

// Image Path for different Pages
  static var wsWimg1;
  static var wsWimg2;
  static var wsGimg1;
  static var wsGimg2;
  static var wsPimg1;
  static var wsPimg2;
  static var rimg1;
  static var rimg2;
  static var iimg1;
  static var wTimg1;
  static var gimg1;

// Pdf File
  static var pdfName;
  static var opdfName;

// DateTime for Every Page
  static var dt100;
  static var dt211;
  static var dt212;
  static var dt213;
  static var dt214;
  static var dt215;
  static var dt216;
  static var dt220;
  static var dt230;
  static var dt240;
  static var dt250;
  static var dt260;
  static var dt300;

// Screenshots
  static var ss211;
  static var ss212;
  static var ss213;
  static var ss214;
  static var ss215;
  static var ss216;
  static var ss250;

// Function to Get & retrive values
  // static setData(String key, value) async {
  //   await storage.put(key, value);
  // }

  static saveImg(imagepath, String name) async {
    if (imagepath != null) {
      File image = File(imagepath);
      File img = await image.copy('$appDir/$name');
      imagepath = img.path;
    } else {
      imagepath = null;
    }
  }

  // static getData(String key) async {
  //   return await storage.get(key);
  // }

// Functions to Chnage Route (One Page to Another)
  static Future<void> gotoHome(BuildContext context) async {
    final now = DateTime.now();
    dt100 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
  }

  static Future<void> gotoWs(BuildContext context) async {
    if (Globals.longitude == null) {
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        // forceAndroidLocationManager: true,
      ).then((Position position) async {
        longitude = position.longitude.toString();
        latitude = position.latitude.toString();
      });
    }
    // await Future.delayed(const Duration(seconds: 2));
    final now = DateTime.now();
    dt211 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    pageNum = 211;

    Navigator.pushNamed(context, "/211");
  }

  static Future<void> gotoWsw(BuildContext context) async {
    final now = DateTime.now();
    dt212 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    pageNum = 212;

    Navigator.pushNamed(context, "/212");
  }

  static void gotoWsr(BuildContext context) {
    final now = DateTime.now();
    dt213 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    pageNum = 213;

    Navigator.pushNamed(context, "/213");
  }

  static void gotoWsgm(BuildContext context) {
    final now = DateTime.now();
    dt214 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    pageNum = 214;

    Navigator.pushNamed(context, "/214");
  }

  static void gotoWsp(BuildContext context) {
    final now = DateTime.now();
    dt215 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    pageNum = 215;

    Navigator.pushNamed(context, "/215");
  }

  static void gotoWsph(BuildContext context) {
    final now = DateTime.now();
    dt216 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    pageNum = 216;

    Navigator.pushNamed(context, "/216");
  }

  static void gotoRph(BuildContext context) {
    final now = DateTime.now();
    dt220 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    pageNum = 220;
    Navigator.pushNamed(context, "/220");
  }

  static void gotoIt(BuildContext context) {
    final now = DateTime.now();
    dt230 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    pageNum = 230;
    Navigator.pushNamed(context, "/230");
  }

  static void gotoWt(BuildContext context) {
    final now = DateTime.now();
    dt240 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    pageNum = 240;
    Navigator.pushNamed(context, "/240");
  }

  static void gotoGri(BuildContext context) {
    final now = DateTime.now();
    dt250 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    pageNum = 250;
    Navigator.pushNamed(context, "/250");
  }

  static void gotopgf(BuildContext context) {
    final now = DateTime.now();
    dt260 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    pageNum = 260;
    Navigator.pushNamed(context, "/260");
  }

  static void gotoFin(BuildContext context) {
    final now = DateTime.now();
    dt300 =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    Navigator.pushNamed(context, "/300");
  }

  static void gotoMan(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Manuals()));
  }
}
