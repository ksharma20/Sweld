// @dart=2.9
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'globals.dart';
import 'package:share/share.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FinishedWelds(), //call MyPDF List file
    );
  }
}

//apply this class on home: attribute at MaterialApp()
class FinishedWelds extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FinishedWelds(); //create state
  }
}

class _FinishedWelds extends State<FinishedWelds> {
  var files;

  void getFiles() async {
    //asyn function to get list of files
    var fm = FileManager(root: Directory(Globals.appDir)); //
    files = await fm.filesTree(
        // excludedPaths: [Globals.appDir],
        extensions: ["pdf"] //optional, to filter files, list only pdf files
        );
    // Directory(Globals.appDir).listSync();

    setState(() {}); //update the UI
  }

  @override
  void initState() {
    getFiles(); //call getFiles() function on initial state.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Finished Welds"), backgroundColor: Colors.redAccent),
        body: files == null
            ? Center(
                child: Text(
                "Searching Files",
                textScaleFactor: 2,
              ))
            : ListView.builder(
                //if file/folder list is grabbed, then show here
                itemCount: files?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(files[index].path.split('/').last),
                    leading: Icon(Icons.picture_as_pdf),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.blueGrey,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ViewPDF(pathPDF: files[index].path.toString());
                        //open viewPDF page on click
                      }));
                    },
                  ));
                },
              ));
  }
}

class ViewPDF extends StatelessWidget {
  final String pathPDF;
  ViewPDF({@required this.pathPDF});

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
