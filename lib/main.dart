import 'dart:async';
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
import 'package:intl/intl.dart';

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

  String _selectedDropdownOne;
  String _selectedDropdownTwo;
  String _selectedDropdownThree;

  List<bool> slider = [];
  List<String> sliderValue = [];

  List<bool> checkBox = [];
  List<String> checkBoxValue = [];

  String addedText;
  String presetName;

  TextEditingController addedTextController = new TextEditingController();
  TextEditingController presetController = new TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey globalKey = new GlobalKey();

  List<String> dropDownOneList = [

    "Dropdown 1",
    "Dropdown 2",
    "Dropdown 3"

  ];

  List<String> dropDownTwoList = [

    "Dropdown 1",
    "Dropdown 2",
    "Dropdown 3"

  ];

  List<String> dropDownThreeList = [

    "Dropdown 1",
    "Dropdown 2",
    "Dropdown 3"

  ];


  Timer _timer;
  String _timeString;

  @override
  void initState() {
    _selectedDropdownOne = "Dropdown 1";
    _selectedDropdownTwo = "Dropdown 1";
    _selectedDropdownThree = "Dropdown 1";

    slider = [false, false, false, false];
    sliderValue = ["", "", "", ""];

    checkBox = [false, false, false, false, false, false];
    checkBoxValue = ["", "", "", "", "", ""];

    addedText = "";
    presetName = "";

    presetController.text = "";
    addedTextController.text = "";

    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());

    super.initState();
  }
  
  @override
  void dispose() {
    if(_timer != null){
      _timer.cancel();
    }
    super.dispose();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  Widget dropDown()
  {
    return new Container(
      padding: EdgeInsets.only(bottom: 0, top: 20),
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
              value: _selectedDropdownOne,
              onChanged: (String Value) {
                setState(() {
                  _selectedDropdownOne = Value;
                });
              },
              items: dropDownOneList.map((String category) {
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

  Widget dropDownTwo()
  {
    return new Container(
      padding: EdgeInsets.only(bottom: 0, top: 10),
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
              value: _selectedDropdownTwo,
              onChanged: (String Value) {
                setState(() {
                  _selectedDropdownTwo = Value;
                });
              },
              items: dropDownTwoList.map((String category) {
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

  Widget dropDownThree()
  {
    return new Container(
      padding: EdgeInsets.only(bottom: 0, top: 10),
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
              value: _selectedDropdownThree,
              onChanged: (String Value) {
                setState(() {
                  _selectedDropdownThree = Value;
                });
              },
              items: dropDownThreeList.map((String category) {
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

  Widget sliderWidget()
  {
    return new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children : List<int>.generate(4, (index) => index)
        .map((item) =>  new Container(
          padding: EdgeInsets.only(
              top: 0,
              left: 20
          ),
          child: new Row(
            children: <Widget>[
              Switch(
                activeColor: Colors.blueGrey,
                value: slider[item],
                onChanged: (value) {
                  print("VALUE : $value");
                  setState(() {
                    slider[item] = value;
                    if(slider[item])
                    {
                      sliderValue[item] = "Slider${item+1},";
                    }
                    else {
                      sliderValue[item] = "";
                    }
                  });
                },
              ),
            ],
          ),
        )
      ).toList(),
    );
  }

  Widget checkBoxWidget()
  {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children : List<int>.generate(4, (index) => index)
          .map((item) =>  new Container(
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
                value: checkBox[item],
                onChanged: (bool value) {
                  setState(() {
                    checkBox[item] = value;
                    if(value)
                    {
                      checkBoxValue[item] = "Checkbox${item+1},";
                    }
                    else {
                      checkBoxValue[item] = "";
                    }
                  });
                },
              ),
            ),


          ],
        ),
      )
      ).toList(),
    );
  }

  Widget checkBoxWidgetTwo()
  {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children : List<int>.generate(2, (index) => index)
          .map((item) =>  new Container(
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
                value: checkBox[item+4],
                onChanged: (bool value) {
                  setState(() {
                    checkBox[item+4] = value;
                    if(value)
                    {
                      checkBoxValue[item+4] = "Checkbox${item+4},";
                    }
                    else {
                      checkBoxValue[item+4] = "";
                    }
                  });
                },
              ),
            ),


          ],
        ),
      )
      ).toList(),
    );
  }


  Widget widgetBankOne()
  {
    return Column(
      children: <Widget>[

        Expanded(
          flex: 6,
          child: sliderWidget(),
        ),


        Expanded(
          flex: 3,
          child: textFields(),
        ),


      ],
    );
  }

  Widget widgetBankTwo()
  {
    return Column(
      children: <Widget>[

        dropDown(),

        dropDownTwo(),

        Expanded(
          flex: 2,
          child: checkBoxWidgetTwo(),
        ),

        Expanded(
          flex: 3,
          child: textFields(),
        ),

      ],
    );
  }

  Widget widgetBankThree()
  {
    return Column(
      children: <Widget>[

        dropDownThree(),

        Expanded(
          flex: 4,
          child: checkBoxWidget(),
        ),

        Expanded(
          flex: 3,
          child: textFields(),
        ),

      ],
    );
  }

  Widget textFields()
  {
    return Column(
      children: <Widget>[
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
                  onChanged: (text) {
                    print("Added text field: $text");
                    setState(() {
                      addedText = text;
                    });
                  },
                  style: TextStyle(
                    fontSize: 12
                  ),
                  controller: addedTextController,
                  textAlign: TextAlign.start,
                  decoration: new InputDecoration(
                    hintText: 'Added Text',
                    border: InputBorder.none,
                  ),
                ),
              )
          ),
        ),

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
                  onChanged: (text) {
                    print("First text field: $text");
                    setState(() {
                      presetName = text;
                    });
                  },
                  style: TextStyle(
                      fontSize: 12
                  ),
                  controller: presetController,
                  textAlign: TextAlign.start,
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

  _saveScreen(GlobalKey globalKey) async {
    RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 10.0);

    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List()).then((data){
      SnackBar(content: Text('Image saved successfully!'));
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Image saved successfully!')));
    });
    print(result);
  }

  Future<void> _captureAndSharePng(GlobalKey globalKey) async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      String imgName = "$presetName" + "_$_timeString";

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/$imgName.png').create();
      await file.writeAsBytes(pngBytes);

      GallerySaver.saveImage(file.path).then((data){
        SnackBar(content: Text('Image saved successfully!'));
        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Image saved successfully!')));
      });

    } catch(e) {
      print(e.toString());
    }
  }

  void resetAll()
  {
    setState(() {
      _selectedDropdownOne = "Dropdown 1";
      _selectedDropdownTwo = "Dropdown 1";
      _selectedDropdownThree = "Dropdown 1";

      slider = [false, false, false, false];
      sliderValue = ["", "", "", ""];

      checkBox = [false, false, false, false, false, false];
      checkBoxValue = ["", "", "", "", "", ""];

      addedText = "";
      presetName = "";

      presetController.text = "";
      addedTextController.text = "";

    });
  }

  @override
  Widget build(BuildContext context) {

    String qrData = "$_timeString,$_selectedDropdownOne,$_selectedDropdownTwo,$_selectedDropdownThree,${sliderValue[0]}${sliderValue[1]}${sliderValue[2]}${sliderValue[3]}${checkBoxValue[0]}${checkBoxValue[1]}${checkBoxValue[2]}${checkBoxValue[3]}${checkBoxValue[4]}${checkBoxValue[5]}$addedText";

    return new Scaffold(
      //appBar: AppBar(),
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: new Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: DefaultTabController(
              length: 3,

              child: Scaffold(

                resizeToAvoidBottomPadding: false,

                appBar: AppBar(
                  title: Text(widget.title),
                ),
                //bottomNavigationBar: menu(),
                body: Center(
                    child: TabBarView(
                      children: <Widget>[
                        widgetBankOne(),
                        widgetBankTwo(),
                        widgetBankThree(),
                      ],
                    )
                ),

              ),
            ),
          ),
          Expanded(
            flex: 3,
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
                          data: "$qrData",
                          version: QrVersions.auto,
                          size: 160.0,
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

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 5,
                            left: 20,
                            right: 20,
                            bottom: 10
                        ),
                        child: GestureDetector(
                          onTap: (){
                            //_saveScreen(globalKey1);
                            _captureAndSharePng(globalKey);
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
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 5,
                            left: 20,
                            right: 20,
                            bottom: 10
                        ),
                        child: GestureDetector(
                          onTap: (){
                            resetAll();
                          },
                          child: new Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            //width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              color: Color.fromRGBO(208, 216, 220, 1.0),
                            ),
                            child: Icon(Icons.add, color: Color.fromRGBO(123, 141, 147, 1.0),)
                          ),
                        )
                    ),
                  ],
                )
              ],
            ),
          )
        ],
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
