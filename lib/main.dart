import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:scanner/colors.dart';
import 'package:scanner/theme_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeClass.lightTheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final gamesessionController = TextEditingController();
  String? scanResult;
  String? scanResult_QR;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 10, top: 100),
            //  width: sWidthpercent * 69,
            //height: sHeightpercent * 13,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25, bottom: 5),
                  width: 100,
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text(
                          'Scan',
                          style: TextStyle(
                              color: yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                      ),
                      GestureDetector(
                          onTap: (() {
                            scancode();
                            print('Bar code');
                          }),
                          child:
                              Icon(Icons.camera_enhance, color: myiconcolor)),
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: myiconcolor),
                      //color: barcolor,
                      borderRadius: BorderRadius.circular(10),
                      color: stakebluebutton,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff3A3A3A),

                            /// color: Color.fromARGB(255, 74, 74, 75),
                            offset: Offset(2, 4),
                            blurRadius: 10,
                            spreadRadius: 1),
                      ]),
                ),
                SizedBox(
                    height: 20,
                    child: Text(
                      scanResult == null
                          ? "Scan a Bar-Code"
                          : "Scanned Result :" + scanResult.toString(),
                      style: TextStyle(fontSize: 18, color: myiconcolor),
                    )),
                SizedBox(
                  height: 9,
                ),

                /* ---------------------------------------------------------------------------------------------- JNJKN --------------------------------------------------------------------------------------------- */
                Container(
                  margin: EdgeInsets.only(top: 25, bottom: 5),
                  width: 100,
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text(
                          'Scan',
                          style: TextStyle(
                              color: yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                      ),
                      GestureDetector(
                          onTap: (() {
                            scancodeQrcode();
                            print('it has move');
                          }),
                          child:
                              Icon(Icons.camera_enhance, color: myiconcolor)),
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: myiconcolor),
                      //color: barcolor,
                      borderRadius: BorderRadius.circular(10),
                      color: stakebluebutton,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff3A3A3A),

                            /// color: Color.fromARGB(255, 74, 74, 75),
                            offset: Offset(2, 4),
                            blurRadius: 10,
                            spreadRadius: 1),
                      ]),
                ),
                SizedBox(
                    height: 20,
                    child: Text(
                      scanResult_QR == null
                          ? "Scan a QR-Code"
                          : "Scanned Result :" + scanResult_QR.toString(),
                      style: TextStyle(fontSize: 18, color: myiconcolor),
                    )),
                Text(
                  gamesessionController.text.toString(),
                  style: TextStyle(color: myiconcolor, fontSize: 20),
                ),
                SizedBox(height: 20),
                BarcodeWidget(
                    drawText: false,
                    width: 200,
                    height: 200,
                    color: myiconcolor,
                    data: gamesessionController.text.toString(),
                    barcode: Barcode.code128()),
                SizedBox(height: 20),
                TextField(
                    controller: gamesessionController,
                    keyboardType: TextInputType.text,
                    cursorColor: yellow,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Scanner',
                        labelStyle: TextStyle(color: myiconcolor),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        enabledBorder: OutlineInputBorder(
                          // borderSide:
                          //     BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: yellow),
                            borderRadius: BorderRadius.circular(10)),
                        prefixIconColor: Colors.amber,
                        prefixIcon:
                            Icon(Icons.scanner_rounded, color: myiconcolor),
                        //suffixText: '${ethaccount} bnb',
                        //hintText: "Enter Amount You Want To Stake",
                        //hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color(0xff101753)
                        //  hintStyle: ,
                        ),
                    onChanged: (String text) {
                      setState(() {});
                    },
                    onSubmitted: (_) {
                      setState(() {});
                    }),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future scancodeQrcode() async {
    String scanResults;
    try {
      scanResults = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', "Cancel", true, ScanMode.QR);
    } on PlatformException {
      scanResults = 'Failed to get platform';
    }
    if (!mounted) return;
    setState(() {
      scanResult_QR = scanResults;
    });
    // setState(() => this.scanResult_QR = scanResults);
  }

  Future scancode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', "Cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      scanResult = 'Failed to get platform';
    }
    if (!mounted) return;
    setState(() => this.scanResult = scanResult);
  }

  // Future scancode_Qrcode() async {
  //   String scanResult_QR;
  //   try {
  //     scanResult = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', "Cancel", true, ScanMode.QR);
  //   } on PlatformException {
  //     scanResult = 'Failed to get platform';
  //   }
  //   if (!mounted) return;
  //   setState(() => this.scanResult_QR = scanResult_QR);
  // }
}
