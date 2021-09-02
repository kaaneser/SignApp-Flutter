import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  GlobalKey<SfSignaturePadState> _signaturePadStateKey = GlobalKey();
  int _counter = 0;

  void countIncrease() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final signCount = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenSize.width * 0.9,
                  height: screenSize.height * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: SfSignaturePad(
                    key: _signaturePadStateKey,
                    minimumStrokeWidth: 4,
                    maximumStrokeWidth: 4,
                  ),
                ),
                Container(
                  width: screenSize.width * 0.75,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          _counter + 1 == signCount
                              ? showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Tebrikler!"),
                                      content: Text(
                                          "Katılımınız alındı, teşekkür ederiz."),
                                      actions: [
                                        TextButton(
                                          child: Text("Tamam"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  })
                              : setState(() {
                                  countIncrease();
                                });
                          ui.Image image = await _signaturePadStateKey
                              .currentState
                              .toImage();
                          final byteData = await image.toByteData(
                              format: ui.ImageByteFormat.png);
                          final Uint8List imageBytes = byteData.buffer
                              .asUint8List(byteData.offsetInBytes,
                                  byteData.lengthInBytes);
                          final String path =
                              (await getApplicationSupportDirectory()).path;
                          final String fileName = "$path/sign_$_counter.png";
                          final File file = File(fileName);
                          await file.writeAsBytes(imageBytes, flush: true);
                          OpenFile.open(fileName);
                          await _signaturePadStateKey.currentState.clear();
                        },
                        child: Text("Kaydet"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blueGrey),
                        ),
                      ),
                      Container(
                        child: Text(
                          "$_counter / $signCount",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          _signaturePadStateKey.currentState.clear();
                        },
                        child: Text("Sil"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
