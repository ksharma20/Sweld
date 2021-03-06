import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:sweld/globals.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onClicked;

  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onClicked,
      this.color = Colors.white,
      this.backgroundColor = Colors.black})
      : super(key: key);
  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: color),
      ));
}

class IgnitionTime extends StatefulWidget {
  @override
  _IgnitionTimeState createState() => _IgnitionTimeState();
}

class _IgnitionTimeState extends State<IgnitionTime> {
  final pageNum = 230;

  var countdownDuration = Duration(minutes: Globals.gow);
  Duration duration = Duration();
  Timer? timer;

  bool countDown = true;

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(
        Duration(
          seconds: 1,
        ),
        (_) => addTime());
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  Future getImg1() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        Globals.iimg1 = image.path;
      });
    }
    Globals.dti1 =
        "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}-${DateTime.now().minute.toString().padLeft(2, '0')}";
  }

  Future getImg2() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        Globals.iimg2 = image.path;
      });
    }
    Globals.dti2 =
        "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}-${DateTime.now().minute.toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    super.initState();
    reset();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Ignition & Mould Waiting Time"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Divider(
                height: 20,
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
                hint: Text(Globals.sgow ?? "Select Gap of Welding"),
                isExpanded: true,
                items: <String>[
                  'Select Gap of Welding',
                  '25 mm Gap',
                  '75 mm Gap',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (val) {
                  Globals.sgow = val;
                  if (val == '25 mm Gap') {
                    setState(() {
                      Globals.gow = 6;
                    });
                  } else if (val == '75 mm Gap') {
                    setState(() {
                      Globals.gow = 12;
                    });
                  } else {
                    Globals.gow = 0;
                  }
                  Navigator.pushReplacementNamed(context, "/230");
                },
              ),
              Divider(
                height: 20,
              ),
              Text("Ignition Time = 20min ?? 3sec"),
              Divider(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTime(),
                  SizedBox(
                    height: 50,
                  ),
                  buildButtons()
                ],
              ),
              Divider(
                height: 35,
              ),
              Center(
                child: Text(
                  "Click the Picture of Rails When Moulds \nJust About to be Removed !",
                  textScaleFactor: 1.2,
                ),
              ),
              Divider(
                height: 25,
              ),
              TextButton(
                onPressed: () => getImg1(),
                child: Globals.iimg1 == null
                    ? Text("Left Rail")
                    : Image.file(File(Globals.iimg1!)),
              ),
              Divider(
                height: 25,
              ),
              TextButton(
                onPressed: () => getImg2(),
                child: Globals.iimg2 == null
                    ? Text("Right Rail")
                    : Image.file(File(Globals.iimg2!)),
              ),
              Divider(
                height: 50,
              ),
            ],
          ),
        ),
        persistentFooterButtons: [
          Container(
            color: Colors.white,
            child: ElevatedButton(
              onPressed: () {
                Globals.saveImg(Globals.iimg1, 'iimg1.jpg');

                Globals.gotoWt(context);
              },
              child: Text("Proceed to STAGE 4"),
            ),
          ),
        ],
      );

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    // final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      // buildTimeCard(time: hours, header:'HOURS'),
      // SizedBox(width: 8,),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      SizedBox(
        width: 8,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(header, style: TextStyle(color: Colors.black45)),
        ],
      );

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;
    return isRunning || isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                  text: 'Pause',
                  onClicked: () {
                    if (isRunning) {
                      stopTimer(resets: false);
                    }
                  }),
              SizedBox(
                width: 12,
              ),
              ButtonWidget(text: "Reset", onClicked: stopTimer),
            ],
          )
        : ButtonWidget(
            text: "Start Timer!",
            color: Colors.black,
            backgroundColor: Colors.white,
            onClicked: () {
              startTimer();
            });
  }
}
