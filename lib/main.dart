import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:custom_switch/custom_switch.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:ui' as ui;
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qr Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Qr Code'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String _selectedCategory;

  bool checkBox1;
  String checkBox1Value;
  bool checkBox2;
  String checkBox2Value;
  bool checkBox3;
  String checkBox3Value;

  bool slider1;
  String slider1Value;
  bool slider2;
  String slider2Value;
  bool slider3;
  String slider3Value;
  bool slider4;
  String slider4Value;

  String addedText;
  String presetName;

  TextEditingController addedTextController = new TextEditingController();
  TextEditingController presetController = new TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey globalKey = new GlobalKey();

  List<String> categories = [

    "Dropdown 1",
    "Dropdown 2",
    "Dropdown 3"

  ];

  @override
  void initState() {
    _selectedCategory = "Dropdown 1";
    checkBox1 = false;
    checkBox1Value = "";
    checkBox2 = false;
    checkBox2Value = "";
    checkBox3 = false;
    checkBox3Value = "";


    slider1 = false;
    slider1Value = "";
    slider2 = false;
    slider2Value = "";
    slider3 = false;
    slider3Value = "";
    slider4 = false;
    slider4Value = "";

    addedText = "";
    presetName = "";

    presetController.text = "";
    addedTextController.text = "";

    super.initState();
  }

  Widget checkBoxOne()
  {
    return new Container(
      padding: EdgeInsets.only(
          top: 10,
          left: 20
      ),
      child: new Row(
        children: <Widget>[
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: Checkbox(
              value: checkBox1,
              onChanged: (bool value) {
                setState(() {
                  checkBox1 = value;
                  if(value)
                  {
                    checkBox1Value= "Checkbox1";
                  }
                  else {
                    checkBox1Value= "";
                  }
                });
              },
            ),
          ),


        ],
      ),
    );
  }

  Widget checkBoxTwo()
  {
    return new Container(
      padding: EdgeInsets.only(
          top: 10,
          left: 20
      ),
      child: new Row(
        children: <Widget>[
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: Checkbox(
              value: checkBox2,
              onChanged: (bool value) {
                setState(() {
                  checkBox2 = value;
                  if(value)
                  {
                    checkBox2Value= "Checkbox2";
                  }
                  else {
                    checkBox2Value= "";
                  }
                });
              },
            ),
          ),


        ],
      ),
    );
  }

  Widget checkBoxThree()
  {
    return new Container(
      padding: EdgeInsets.only(
          top: 10,
          left: 20
      ),
      child: new Row(
        children: <Widget>[
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: Checkbox(
              value: checkBox3,
              onChanged: (bool value) {
                setState(() {
                  checkBox3 = value;
                  if(value)
                  {
                    checkBox3Value= "Checkbox3";
                  }
                  else {
                    checkBox3Value= "";
                  }
                });
              },
            ),
          ),


        ],
      ),
    );
  }

  Widget dropDown()
  {
    return new Container(
      padding: EdgeInsets.only(bottom: 10, top: 20),
      child: new Container(
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            border: new Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: new Container(
            padding: EdgeInsets.only(left: 5, right: 5),

            child: DropdownButton<String>(
              hint:  Text("Select item"),
              value: _selectedCategory,
              onChanged: (String Value) {
                setState(() {
                  _selectedCategory = Value;
                });
              },
              items: categories.map((String category) {
                return  DropdownMenuItem<String>(
                    value: category,
                    child: new Container(
                      width: MediaQuery.of(context).size.width - 76,
                      child: Text(
                        category,
                        style:  TextStyle(color: Colors.black),
                      ),
                    )
                );
              }).toList(),
            ),
          )
      ),
    );
  }

  Widget switchSliderOne()
  {
    return new Container(
      padding: EdgeInsets.only(
          top: 10,
          left: 20
      ),
      child: new Row(
        children: <Widget>[
          Switch(
            activeColor: Colors.blueGrey,
            value: slider1,
            onChanged: (value) {
              print("VALUE : $value");
              setState(() {
                slider1 = value;
                if(value)
                  {
                    slider1Value = "Slider1";
                  }
                else {
                  slider1Value = "";
                }
              });
            },

          ),


        ],
      ),
    );
  }

  Widget switchSliderTwo()
  {
    return new Container(
      padding: EdgeInsets.only(
          top: 0,
          left: 20
      ),
      child: new Row(
        children: <Widget>[
          Switch(
            activeColor: Colors.blueGrey,
            value: slider2,
            onChanged: (value) {
              print("VALUE : $value");
              setState(() {
                slider2 = value;
                if(value)
                {
                  slider2Value = "Slider2";
                }
                else {
                  slider2Value = "";
                }
              });
            },
          ),


        ],
      ),
    );
  }

  Widget switchSliderThree()
  {
    return new Container(
      padding: EdgeInsets.only(
          top: 0,
          left: 20
      ),
      child: new Row(
        children: <Widget>[
          Switch(
            activeColor: Colors.blueGrey,
            value: slider3,
            onChanged: (value) {
              print("VALUE : $value");
              setState(() {
                slider3 = value;
                if(value)
                {
                  slider3Value = "Slider3";
                }
                else {
                  slider3Value = "";
                }
              });
            },
          ),


        ],
      ),
    );
  }

  Widget switchSliderFour()
  {
    return new Container(
      padding: EdgeInsets.only(
          top: 0,
          left: 20
      ),
      child: new Row(
        children: <Widget>[
          Switch(
            activeColor: Colors.blueGrey,
            value: slider4,
            onChanged: (value) {
              print("VALUE : $value");
              setState(() {
                slider4 = value;
                if(value)
                {
                  slider4Value = "Slider4";
                }
                else {
                  slider4Value = "";
                }
              });
            },
          ),


        ],
      ),
    );
  }

  Widget widgetBankOne()
  {
    return Column(
      children: <Widget>[

        Expanded(
          flex: 6,
          child: new Container(
            child: new Column(
              children: <Widget>[
                switchSliderOne(),
                switchSliderTwo(),
                switchSliderThree(),
                switchSliderFour(),
              ],
            ),
          ),
        ),

        Expanded(
          flex: 3,
          child: textFields(),
        ),



//          Padding(
//              padding: const EdgeInsets.only(
//                  top: 10,
//                  left: 40,
//                  right: 40,
//                  bottom: 10
//              ),
//              child: GestureDetector(
//                onTap: (){
//                  setState(() {
//                    presetName = presetController.text;
//                    addedText = addedTextController.text;
//                  });
//                  //dbStart();
//                  //Navigator.of(context).pushAndRemoveUntil(_createRouteToHome(app), (Route<dynamic> route) => false);
//                },
//                child: new Container(
//                  alignment: Alignment.center,
//                  height: 50,
//                  //width: 150,
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                    color: Color.fromRGBO(208, 216, 220, 1.0),
//                  ),
//                  child: Text('GENERATE', style: TextStyle(
//                      fontSize: 14,
//                      fontWeight: FontWeight.bold,
//                      color: Color.fromRGBO(123, 141, 147, 1.0)
//                  ),),
//                ),
//              )
//          ),

      Expanded(
        flex: 7,
        child: Column(
          children: <Widget>[
            RepaintBoundary(
              key: globalKey,
              child: Container(
                color: Colors.white,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    QrImage(
                      data: "10:23:24,$slider1Value,$slider2Value,$slider3Value,$slider4Value,$addedText",
                      version: QrVersions.auto,
                      size: 150.0,
                    ),

                    new Container(
                      child: new Text("$presetName", style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                      bottom: 10
                  ),
                  child: GestureDetector(
                    onTap: (){
                      _saveScreen();
                      //_getHttp();
                      //_captureAndSharePng();
                      //dbStart();
                      //Navigator.of(context).pushAndRemoveUntil(_createRouteToHome(app), (Route<dynamic> route) => false);
                    },
                    child: new Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      //width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color.fromRGBO(208, 216, 220, 1.0),
                      ),
                      child: Text('SAVE IMAGE', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(123, 141, 147, 1.0)
                      ),),
                    ),
                  )
              ),

            )
          ],
        ),
      )

      ],
    );
  }

  Widget widgetBankThree()
  {
    return Column(
      children: <Widget>[

        dropDown(),
        checkBoxOne(),
        checkBoxTwo(),
        checkBoxThree(),

        QrImage(
          data: "10:23:24,$_selectedCategory,$checkBox1Value,$checkBox2Value,$checkBox3Value,$slider1Value,$slider2Value,$slider3Value,$slider4Value",
          version: QrVersions.auto,
          size: 200.0,
        ),
      ],
    );
  }

  Widget textFields()
  {
    return Column(
      children: <Widget>[
//        new Container(
//          alignment: Alignment.centerLeft,
//          padding: EdgeInsets.only(bottom: 10, top: 5, left: 20, right: 20),
//          child: new Text('Added Text', style: TextStyle(
//              fontSize: 14,
//              color: Colors.blue,
//              fontWeight: FontWeight.bold
//          ),),
//        ),
        new Container(
          padding: EdgeInsets.only(bottom: 10,left: 20, right: 20),
          child: new Container(
              height: 45,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                border: new Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: new Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: new TextField(
                  style: TextStyle(
                    fontSize: 12
                  ),
                  controller: addedTextController,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: new InputDecoration(
                    hintText: 'Added Text',
                    border: InputBorder.none,
                  ),
                ),
              )
          ),
        ),

//        new Container(
//          alignment: Alignment.centerLeft,
//          padding: EdgeInsets.only(bottom: 10, top: 5, left: 20, right: 20),
//          child: new Text('Preset Name', style: TextStyle(
//              fontSize: 14,
//              color: Colors.blue,
//              fontWeight: FontWeight.bold
//          ),),
//        ),
        new Container(
          padding: EdgeInsets.only(bottom: 0,left: 20, right: 20),
          child: new Container(
              height: 45,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                border: new Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: new Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: new TextField(
                  style: TextStyle(
                      fontSize: 12
                  ),
                  controller: presetController,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: new InputDecoration(
                    hintText: 'Preset Name',
                    border: InputBorder.none,
                  ),
                ),
              )
          ),
        ),
      ],
    );
  }

  _getHttp() async {
    var response = await Dio().get("https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg", options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
  }

  _saveScreen() async {
    RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 10.0);

    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List()).then((data){
      SnackBar(content: Text('Image saved successfully!'));
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Image saved successfully!')));
    });
    print(result);
  }

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image1.png').create();
      await file.writeAsBytes(pngBytes);

      File compressedFile = await FlutterNativeImage.compressImage(file.path, quality: 10,
          targetWidth: 600, targetHeight: 600);

      GallerySaver.saveImage(file.path).then((data){
        SnackBar(content: Text('Image saved successfully!'));
        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Image saved successfully!')));
      });


//      Directory tempAppDir = await getApplicationDocumentsDirectory();
//      String path = tempAppDir.path;
//      final File newImage = await file.copy('$path/image1.png');
//      final myImagePath = '$path/QRImages';
//
//      var img = Image.memory(pngBytes);

//      final channel = const MethodChannel('channel:me.alfian.share/share');
//      channel.invokeMethod('shareFile', 'image.png');

    } catch(e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,

      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        //bottomNavigationBar: menu(),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
            child: TabBarView(
              children: <Widget>[
                widgetBankOne(),
                widgetBankThree(),
                widgetBankThree()
              ],
            )
        ),

      ),
    );
  }

  Widget menu() {
    return Container(
      color: Colors.blueAccent,
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.white70,
        tabs: [
          Tab(
            text: "WidgetBank 1",
            icon: Icon(Icons.widgets),
          ),
          Tab(
            text: "WidgetBank 2",
            icon: Icon(Icons.widgets),
          ),
          Tab(
            text: "WidgetBank 3",
            icon: Icon(Icons.widgets),
          ),
        ],
      ),
    );
  }

}
