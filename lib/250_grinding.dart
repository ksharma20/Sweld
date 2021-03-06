import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sweld/globals.dart';

class Grinding extends StatefulWidget {
  const Grinding({Key? key}) : super(key: key);

  @override
  _GrindingState createState() => _GrindingState();
}

class _GrindingState extends State<Grinding> {
  final pageNum = 250;

  @override
  Widget build(BuildContext context) {
    var _ssc = ScreenshotController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Grinding & Finished Tolerance"),
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
              Globals.ss250 = await _ssc.captureAndSave(Globals.appDir,
                  fileName: "ss250.png",
                  pixelRatio: MediaQuery.of(context).devicePixelRatio,
                  delay: Duration(milliseconds: 750));

              // Globals.setData('ss250.jpg', Globals.ss250);

              // Globals.setData('grinding', Globals.grinding);
              // Globals.setData('ftpa', Globals.ftpa);
              // Globals.setData('gva', Globals.gva);
              // Globals.setData('gla', Globals.gla);
              // Globals.setData('gfts', Globals.gfts);
              // Globals.setData('gfsr', Globals.gfsr);

              Globals.saveImg(Globals.gimg1, "gimg1.jpg");

              Globals.gotopgf(context);
            },
            child: Text("Finish Weld"),
          ),
        ),
      ],
      extendBody: true,
      body: SingleChildScrollView(
        child: Screenshot(
          controller: _ssc,
          child: GrindingBody(),
        ),
      ),
    );
  }
}

class GrindingBody extends StatefulWidget {
  const GrindingBody({Key? key}) : super(key: key);

  @override
  _GrindingBodyState createState() => _GrindingBodyState();
}

class _GrindingBodyState extends State<GrindingBody> {
  Future getImg1() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        Globals.gimg1 = image.path;
      });
    }
    Globals.dtg1 =
        "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}-${DateTime.now().minute.toString().padLeft(2, '0')}";
  }

  Future getImg2() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        Globals.gimg2 = image.path;
      });
    }
    Globals.dtg2 =
        "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}-${DateTime.now().minute.toString().padLeft(2, '0')}";
  }

  Future getImg3() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        Globals.gimg3 = image.path;
      });
    }
    Globals.dtg3 =
        "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}-${DateTime.now().minute.toString().padLeft(2, '0')}";
  }

  Future getImg4() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        Globals.gimg4 = image.path;
      });
    }
    Globals.dtg4 =
        "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}-${DateTime.now().minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    initialValue: Globals.grinding,
                    onChanged: (val) {
                      Globals.grinding = val;
                    },
                    decoration: InputDecoration(
                      labelText: "Grinding",
                      hintText: "Mechanical Grinder/Manual",
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
                    initialValue: Globals.ftpa,
                    onChanged: (val) {
                      Globals.ftpa = val;
                    },
                    decoration: InputDecoration(
                      labelText: "First Train Passed After",
                      hintText: "In Mins",
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
                    initialValue: Globals.ftpasr,
                    onChanged: (val) {
                      Globals.ftpasr = val;
                    },
                    decoration: InputDecoration(
                      labelText: "First Train Passed with SR",
                      hintText: "In kmph",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(),
                        gapPadding: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 50,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tolerance of Finished Welds",
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
          TextFormField(
            initialValue: Globals.gva,
            decoration: InputDecoration(
              labelText: "Vertical Alignment",
              hintText: "with 1m st.edge",
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
                Globals.gva = val;
              });
            },
          ),
          TextButton(
            onPressed: () => getImg1(),
            child: Globals.gimg1 == null
                ? Text(
                    "Picture of Reading of Vertical Alignment",
                  )
                : Text("Image Uploaded! for reading "),
          ),
          Divider(
            thickness: 0,
            height: 10,
          ),
          TextFormField(
            initialValue: Globals.gla,
            decoration: InputDecoration(
              labelText: "Lateral Alignment",
              hintText: "with 1m st.edge",
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
                Globals.gla = val;
              });
            },
          ),
          TextButton(
            onPressed: () => getImg2(),
            child: Globals.gimg2 == null
                ? Text(
                    "Picture of Reading of Lateral Alignment",
                  )
                : Text("Image Uploaded! for reading "),
          ),
          Divider(
            thickness: 0,
            height: 10,
          ),
          TextFormField(
            initialValue: Globals.gfts,
            decoration: InputDecoration(
              labelText: "Finishing of Top Surface",
              hintText: "with 10cm st.edge",
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
                Globals.gfts = val;
              });
            },
          ),
          TextButton(
            onPressed: () => getImg3(),
            child: Globals.gimg3 == null
                ? Text(
                    "Picture of Reading of Finishing of Top Surface at the End",
                    textScaleFactor: 0.9,
                  )
                : Text("Image Uploaded! for reading "),
          ),
          Divider(
            thickness: 0,
            height: 10,
          ),
          TextFormField(
            initialValue: Globals.gfsr,
            decoration: InputDecoration(
              labelText: "Finishing on Side of Rail",
              hintText: "with 10cm st.edge",
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
                Globals.gfsr = val;
              });
            },
          ),
          Divider(
            thickness: 0,
            height: 10,
          ),
          TextButton(
            onPressed: () => getImg4(),
            child: Globals.gimg4 == null
                ? Text(
                    "Picture of Reading of Finishing of Top Surface at the center",
                    textScaleFactor: 0.9,
                  )
                : Text("Image Uploaded! for reading "),
          ),
          Divider(
            height: 50,
          ),
        ],
      ),
    );
  }
}
