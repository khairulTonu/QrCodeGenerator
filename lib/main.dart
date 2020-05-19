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
import 'package:qrcodegen/Utils.dart';
import 'package:page_indicator/page_indicator.dart';

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

//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  String _selectedDropdownOne;
//  String _selectedDropdownTwo;
//  String _selectedDropdownThree;
//
//  List<bool> slider = [];
//  List<String> sliderValue = [];
//
//  List<bool> checkBox = [];
//  List<String> checkBoxValue = [];
//
//  String addedText;
//  String presetName;
//
//  TextEditingController addedTextController = new TextEditingController();
//  TextEditingController presetController = new TextEditingController();
//
//  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//
//  GlobalKey globalKey = new GlobalKey();
//
//  List<String> dropDownOneList = [
//
//    "Dropdown 1",
//    "Dropdown 2",
//    "Dropdown 3"
//
//  ];
//
//  List<String> dropDownTwoList = [
//
//    "Dropdown 1",
//    "Dropdown 2",
//    "Dropdown 3"
//
//  ];
//
//  List<String> dropDownThreeList = [
//
//    "Dropdown 1",
//    "Dropdown 2",
//    "Dropdown 3"
//
//  ];
//
//
//  Timer _timer;
//  String _timeString;
//
//  @override
//  void initState() {
//    _selectedDropdownOne = "Dropdown 1";
//    _selectedDropdownTwo = "Dropdown 1";
//    _selectedDropdownThree = "Dropdown 1";
//
//    slider = [false, false, false, false];
//    sliderValue = ["", "", "", ""];
//
//    checkBox = [false, false, false, false, false, false];
//    checkBoxValue = ["", "", "", "", "", ""];
//
//    addedText = "";
//    presetName = "";
//
//    presetController.text = "";
//    addedTextController.text = "";
//
//    _timeString = _formatDateTime(DateTime.now());
//    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
//
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    if(_timer != null){
//      _timer.cancel();
//    }
//    super.dispose();
//  }
//
//  void _getTime() {
//    final DateTime now = DateTime.now();
//    final String formattedDateTime = _formatDateTime(now);
//    setState(() {
//      _timeString = formattedDateTime;
//    });
//  }
//
//  String _formatDateTime(DateTime dateTime) {
//    return DateFormat('HH:mm:ss').format(dateTime);
//  }
//
//  Widget dropDown()
//  {
//    return new Container(
//      padding: EdgeInsets.only(bottom: 0, top: 20),
//      child: new Container(
//          decoration: new BoxDecoration(
//            shape: BoxShape.rectangle,
//            border: new Border.all(
//              color: Colors.grey,
//              width: 1.0,
//            ),
//          ),
//          child: new Container(
//            padding: EdgeInsets.only(left: 5, right: 5),
//
//            child: DropdownButton<String>(
//              hint:  Text("Select item"),
//              value: _selectedDropdownOne,
//              onChanged: (String Value) {
//                setState(() {
//                  _selectedDropdownOne = Value;
//                });
//              },
//              items: dropDownOneList.map((String category) {
//                return  DropdownMenuItem<String>(
//                    value: category,
//                    child: new Container(
//                      width: MediaQuery.of(context).size.width - 76,
//                      child: Text(
//                        category,
//                        style:  TextStyle(color: Colors.black),
//                      ),
//                    )
//                );
//              }).toList(),
//            ),
//          )
//      ),
//    );
//  }
//
//  Widget dropDownTwo()
//  {
//    return new Container(
//      padding: EdgeInsets.only(bottom: 0, top: 10),
//      child: new Container(
//          decoration: new BoxDecoration(
//            shape: BoxShape.rectangle,
//            border: new Border.all(
//              color: Colors.grey,
//              width: 1.0,
//            ),
//          ),
//          child: new Container(
//            padding: EdgeInsets.only(left: 5, right: 5),
//
//            child: DropdownButton<String>(
//              hint:  Text("Select item"),
//              value: _selectedDropdownTwo,
//              onChanged: (String Value) {
//                setState(() {
//                  _selectedDropdownTwo = Value;
//                });
//              },
//              items: dropDownTwoList.map((String category) {
//                return  DropdownMenuItem<String>(
//                    value: category,
//                    child: new Container(
//                      width: MediaQuery.of(context).size.width - 76,
//                      child: Text(
//                        category,
//                        style:  TextStyle(color: Colors.black),
//                      ),
//                    )
//                );
//              }).toList(),
//            ),
//          )
//      ),
//    );
//  }
//
//  Widget dropDownThree()
//  {
//    return new Container(
//      padding: EdgeInsets.only(bottom: 0, top: 10),
//      child: new Container(
//          decoration: new BoxDecoration(
//            shape: BoxShape.rectangle,
//            border: new Border.all(
//              color: Colors.grey,
//              width: 1.0,
//            ),
//          ),
//          child: new Container(
//            padding: EdgeInsets.only(left: 5, right: 5),
//
//            child: DropdownButton<String>(
//              hint:  Text("Select item"),
//              value: _selectedDropdownThree,
//              onChanged: (String Value) {
//                setState(() {
//                  _selectedDropdownThree = Value;
//                });
//              },
//              items: dropDownThreeList.map((String category) {
//                return  DropdownMenuItem<String>(
//                    value: category,
//                    child: new Container(
//                      width: MediaQuery.of(context).size.width - 76,
//                      child: Text(
//                        category,
//                        style:  TextStyle(color: Colors.black),
//                      ),
//                    )
//                );
//              }).toList(),
//            ),
//          )
//      ),
//    );
//  }
//
//  Widget sliderWidget()
//  {
//    return new Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children : List<int>.generate(4, (index) => index)
//          .map((item) =>  new Container(
//        padding: EdgeInsets.only(
//            top: 0,
//            left: 20
//        ),
//        child: new Row(
//          children: <Widget>[
//            Switch(
//              activeColor: Colors.blueGrey,
//              value: slider[item],
//              onChanged: (value) {
//                print("VALUE : $value");
//                setState(() {
//                  slider[item] = value;
//                  if(slider[item])
//                  {
//                    sliderValue[item] = "Slider${item+1},";
//                  }
//                  else {
//                    sliderValue[item] = "";
//                  }
//                });
//              },
//            ),
//          ],
//        ),
//      )
//      ).toList(),
//    );
//  }
//
//  Widget checkBoxWidget()
//  {
//    return new Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children : List<int>.generate(4, (index) => index)
//          .map((item) =>  new Container(
//        padding: EdgeInsets.only(
//            top: 10,
//            left: 20
//        ),
//        child: new Row(
//          children: <Widget>[
//            SizedBox(
//              height: 24.0,
//              width: 24.0,
//              child: Checkbox(
//                value: checkBox[item],
//                onChanged: (bool value) {
//                  setState(() {
//                    checkBox[item] = value;
//                    if(value)
//                    {
//                      checkBoxValue[item] = "Checkbox${item+1},";
//                    }
//                    else {
//                      checkBoxValue[item] = "";
//                    }
//                  });
//                },
//              ),
//            ),
//
//
//          ],
//        ),
//      )
//      ).toList(),
//    );
//  }
//
//  Widget checkBoxWidgetTwo()
//  {
//    return new Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children : List<int>.generate(2, (index) => index)
//          .map((item) =>  new Container(
//        padding: EdgeInsets.only(
//            top: 10,
//            left: 20
//        ),
//        child: new Row(
//          children: <Widget>[
//            SizedBox(
//              height: 24.0,
//              width: 24.0,
//              child: Checkbox(
//                value: checkBox[item+4],
//                onChanged: (bool value) {
//                  setState(() {
//                    checkBox[item+4] = value;
//                    if(value)
//                    {
//                      checkBoxValue[item+4] = "Checkbox${item+4},";
//                    }
//                    else {
//                      checkBoxValue[item+4] = "";
//                    }
//                  });
//                },
//              ),
//            ),
//
//
//          ],
//        ),
//      )
//      ).toList(),
//    );
//  }
//
//
//  Widget widgetBankOne()
//  {
//    return Column(
//      children: <Widget>[
//
//        Expanded(
//          flex: 6,
//          child: sliderWidget(),
//        ),
//
//
////        Expanded(
////          flex: 3,
////          child: textFields(),
////        ),
//
//
//      ],
//    );
//  }
//
//  Widget widgetBankTwo()
//  {
//    return Column(
//      children: <Widget>[
//
//        dropDown(),
//
//        dropDownTwo(),
//
//        Expanded(
//          flex: 2,
//          child: checkBoxWidgetTwo(),
//        ),
//
////        Expanded(
////          flex: 3,
////          child: textFields(),
////        ),
//
//      ],
//    );
//  }
//
//  Widget widgetBankThree()
//  {
//    return Column(
//      children: <Widget>[
//
//        dropDownThree(),
//
//        Expanded(
//          flex: 4,
//          child: checkBoxWidget(),
//        ),
//
////        Expanded(
////          flex: 3,
////          child: textFields(),
////        ),
//
//      ],
//    );
//  }
//
//  Widget textFields()
//  {
//    return Column(
//      children: <Widget>[
//        new Container(
//          padding: EdgeInsets.only(bottom: 10,left: 20, right: 20),
//          child: new Container(
//              height: 45,
//              decoration: new BoxDecoration(
//                shape: BoxShape.rectangle,
//                border: new Border.all(
//                  color: Colors.grey,
//                  width: 1.0,
//                ),
//              ),
//              child: new Container(
//                padding: EdgeInsets.only(left: 5, right: 5),
//                child: new TextField(
//                  onChanged: (text) {
//                    print("Added text field: $text");
//                    setState(() {
//                      addedText = text;
//                    });
//                  },
//                  style: TextStyle(
//                      fontSize: 12
//                  ),
//                  controller: addedTextController,
//                  textAlign: TextAlign.start,
//                  decoration: new InputDecoration(
//                    hintText: 'Added Text',
//                    border: InputBorder.none,
//                  ),
//                ),
//              )
//          ),
//        ),
//
//        new Container(
//          padding: EdgeInsets.only(bottom: 10,left: 20, right: 20),
//          child: new Container(
//              height: 45,
//              decoration: new BoxDecoration(
//                shape: BoxShape.rectangle,
//                border: new Border.all(
//                  color: Colors.grey,
//                  width: 1.0,
//                ),
//              ),
//              child: new Container(
//                padding: EdgeInsets.only(left: 5, right: 5),
//                child: new TextField(
//                  onChanged: (text) {
//                    print("First text field: $text");
//                    setState(() {
//                      presetName = text;
//                    });
//                  },
//                  style: TextStyle(
//                      fontSize: 12
//                  ),
//                  controller: presetController,
//                  textAlign: TextAlign.start,
//                  decoration: new InputDecoration(
//                    hintText: 'Preset Name',
//                    border: InputBorder.none,
//                  ),
//                ),
//              )
//          ),
//        ),
//      ],
//    );
//  }
//
//  _saveScreen(GlobalKey globalKey) async {
//    RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
//    ui.Image image = await boundary.toImage(pixelRatio: 10.0);
//
//    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//    final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List()).then((data){
//      SnackBar(content: Text('Image saved successfully!'));
//      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Image saved successfully!')));
//    });
//    print(result);
//  }
//
//  Future<void> _captureAndSharePng(GlobalKey globalKey) async {
//    try {
//      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
//      var image = await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);
//      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
//      Uint8List pngBytes = byteData.buffer.asUint8List();
//
//      String imgName = "$presetName _$_timeString";
//
//      final tempDir = await getTemporaryDirectory();
//      final file = await new File('${tempDir.path}/$imgName.png').create();
//      await file.writeAsBytes(pngBytes);
//
//      GallerySaver.saveImage(file.path).then((data){
//        SnackBar(content: Text('Image saved successfully!'));
//        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Image saved successfully!')));
//      });
//
//    } catch(e) {
//      print(e.toString());
//    }
//  }
//
//  void resetAll()
//  {
//    setState(() {
//      _selectedDropdownOne = "Dropdown 1";
//      _selectedDropdownTwo = "Dropdown 1";
//      _selectedDropdownThree = "Dropdown 1";
//
//      slider = [false, false, false, false];
//      sliderValue = ["", "", "", ""];
//
//      checkBox = [false, false, false, false, false, false];
//      checkBoxValue = ["", "", "", "", "", ""];
//
//      addedText = "";
//      presetName = "";
//
//      presetController.text = "";
//      addedTextController.text = "";
//
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    String qrData = "$_timeString,$_selectedDropdownOne,$_selectedDropdownTwo,$_selectedDropdownThree,${sliderValue[0]}${sliderValue[1]}${sliderValue[2]}${sliderValue[3]}${checkBoxValue[0]}${checkBoxValue[1]}${checkBoxValue[2]}${checkBoxValue[3]}${checkBoxValue[4]}${checkBoxValue[5]}$addedText";
//
//    return new Scaffold(
//      //appBar: AppBar(),
//      key: scaffoldKey,
//      resizeToAvoidBottomPadding: false,
//      body: new Column(
//        children: <Widget>[
//          Expanded(
//            flex: 4,
//            child: DefaultTabController(
//              length: 3,
//
//              child: Scaffold(
//
//                resizeToAvoidBottomPadding: false,
//
//                appBar: AppBar(
//                  title: Text(widget.title),
//                ),
//                //bottomNavigationBar: menu(),
//                body: Center(
//                    child: TabBarView(
//                      children: <Widget>[
//                        widgetBankOne(),
//                        widgetBankTwo(),
//                        widgetBankThree(),
//                      ],
//                    )
//                ),
//
//              ),
//            ),
//          ),
//          Expanded(
//            flex: 5,
//            child: Column(
//              children: <Widget>[
//                textFields(),
//                RepaintBoundary(
//                  key: globalKey,
//                  child: Container(
//                    color: Colors.white,
//                    child:  Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        QrImage(
//                          data: "$qrData",
//                          version: QrVersions.auto,
//                          size: 160.0,
//                        ),
//
//                        new Container(
//                          child: new Text("$presetName", style: TextStyle(
//                              fontSize: 14,
//                              fontWeight: FontWeight.bold
//                          ),
//                          ),
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//
//                new Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Padding(
//                        padding: const EdgeInsets.only(
//                            top: 5,
//                            left: 20,
//                            right: 20,
//                            bottom: 10
//                        ),
//                        child: GestureDetector(
//                          onTap: (){
//                            //_saveScreen(globalKey1);
//                            _captureAndSharePng(globalKey);
//                          },
//                          child: new Container(
//                            alignment: Alignment.center,
//                            height: 40,
//                            width: 100,
//                            //width: 150,
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                              color: Color.fromRGBO(208, 216, 220, 1.0),
//                            ),
//                            child: Text('SAVE IMAGE', style: TextStyle(
//                                fontSize: 12,
//                                fontWeight: FontWeight.bold,
//                                color: Color.fromRGBO(123, 141, 147, 1.0)
//                            ),),
//                          ),
//                        )
//                    ),
//                    Padding(
//                        padding: const EdgeInsets.only(
//                            top: 5,
//                            left: 20,
//                            right: 20,
//                            bottom: 10
//                        ),
//                        child: GestureDetector(
//                          onTap: (){
//                            resetAll();
//                          },
//                          child: new Container(
//                              alignment: Alignment.center,
//                              height: 40,
//                              width: 40,
//                              //width: 150,
//                              decoration: BoxDecoration(
//                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                                color: Color.fromRGBO(208, 216, 220, 1.0),
//                              ),
//                              child: Icon(Icons.add, color: Color.fromRGBO(123, 141, 147, 1.0),)
//                          ),
//                        )
//                    ),
//                  ],
//                )
//              ],
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  Widget menu() {
//    return Container(
//      color: Colors.blueAccent,
//      child: TabBar(
//        labelColor: Colors.white,
//        unselectedLabelColor: Colors.white70,
//        indicatorSize: TabBarIndicatorSize.tab,
//        indicatorPadding: EdgeInsets.all(5.0),
//        indicatorColor: Colors.white70,
//        tabs: [
//          Tab(
//            text: "WidgetBank 1",
//            icon: Icon(Icons.widgets),
//          ),
//          Tab(
//            text: "WidgetBank 2",
//            icon: Icon(Icons.widgets),
//          ),
//          Tab(
//            text: "WidgetBank 3",
//            icon: Icon(Icons.widgets),
//          ),
//        ],
//      ),
//    );
//  }
//
//}

class _MyHomePageState extends State<MyHomePage>  with WidgetsBindingObserver{
  int _counter = 0;

  List<String> _selectedDropdownOne;
  List<String> _selectedDropdownTwo;
  List<String> _selectedDropdownThree;

  List<List<bool>> slider = [];
  List<List<String>> sliderValue = [];

  List<List<bool>> checkBox = [];
  List<List<String>> checkBoxValue = [];


  List<String> addedText;
  List<String> presetName;

  List<bool> pages;

  List<TextEditingController> addedTextController = [];
  List<TextEditingController> presetController = [];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _pageController = PageController(initialPage: 0, keepPage: false);

  List<GlobalKey> globalKey;

  GlobalKey globalKey1;

  List<String> qrData;
  String qrStr;

  List<Widget> qrWidgetList;

  int count = 0;

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


  Timer timer;

  List<Timer> _timer;

  List<String> _timeString;

  @override
  void initState() {
    count = 0;

    _selectedDropdownOne = [];
    _selectedDropdownTwo = [];
    _selectedDropdownThree = [];

    _selectedDropdownOne.add("Dropdown 1");
    _selectedDropdownTwo.add("Dropdown 1");
    _selectedDropdownThree.add("Dropdown 1");

    //setDropdowns();

    globalKey = [];

    qrData = [];

    qrWidgetList = [];

    slider.add([false, false, false, false]);
    sliderValue.add(["", "", "", ""]);

    checkBox.add([false, false, false, false, false, false]);
    checkBoxValue.add(["", "", "", "", "", ""]);

    addedText = [];
    addedText.add("");

    presetName = [];
    presetName.add("");

    qrStr = "";

    presetController.add(new TextEditingController());
    addedTextController.add(new TextEditingController());

    _timer = [];
    _timer.add(Timer.periodic(Duration(days: 1), (Timer t) => {}));

    _timeString = [];
    _timeString.add(_formatDateTime(DateTime.now()));

    pages= [];
    pages.add(false);

    //addQrWidget();

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      _getTime();
    });

    WidgetsBinding.instance.addObserver(this);

    getPreviousStates();

    super.initState();
  }

  void getPreviousStates()
  {
    Utils().readTotalPages().then((int totalPages){
      Utils().readDropdownData(3).then((List<List<String>> dropdowns){
        print(dropdowns);
        if(dropdowns[0] != null && dropdowns[1]!= null && dropdowns[2] != null && dropdowns != null) {
          Utils().readSliderData(totalPages+1).then((List<List<String>> sliderList){
            bool sliderExist = true;
            for(int i=0; i<=totalPages; i++)
              {
                if(sliderList[i] == null){
                  sliderExist = false;
                  break;
                }

              }
            if(sliderExist)
              Utils().readCheckboxData(totalPages+1).then((List<List<String>> checkboxList){
                bool checkboxExist = true;
                for(int i=0; i<=totalPages; i++)
                {
                  if(checkboxList[i] == null){
                    checkboxExist = false;
                    break;
                  }

                }
                if(checkboxExist) {
                  Utils().readAddedTextData().then((List<String> addedTextList){
                    Utils().readPresetTextData().then((List<String> presetTextList){
                      getPersistedWidget(totalPages, dropdowns, sliderList, checkboxList, addedTextList, presetTextList);
                    });
                  });
                }
              });

          });

        }
      });
    });
  }

  void setDropdowns()
  {
    List<List<String>> dropdowns = [];
    dropdowns.add(_selectedDropdownOne);
    dropdowns.add(_selectedDropdownTwo);
    dropdowns.add(_selectedDropdownThree);
    Utils().storeDropdownData(dropdowns);
  }
  
  void setSliders()
  {
    List<List<String>> sliderValueList = [];

    for(int i=0; i<sliderValue.length; i++){
      sliderValueList.add(sliderValue[i]);
//      sliderValueList.add(sliderValue[1]);
//      sliderValueList.add(sliderValue[2]);
//      sliderValueList.add(sliderValue[3]);
    }
    Utils().storeSliderData(sliderValueList);
  }

  void setCheckBox()
  {
    List<List<String>> checkboxValueList = [];

    for (int i=0; i<checkBoxValue.length; i++) {
      checkboxValueList.add(checkBoxValue[i]);
//      checkboxValueList.add(checkBoxValue[1]);
//      checkboxValueList.add(checkBoxValue[2]);
//      checkboxValueList.add(checkBoxValue[3]);
//      checkboxValueList.add(checkBoxValue[4]);
//      checkboxValueList.add(checkBoxValue[5]);
    }
    Utils().storeCheckboxData(checkboxValueList);
  }

  void setTotalPages(){
    Utils().storeTotalPages(count);
  }

  void setAddedText(){
    Utils().storeAddedTextData(addedText);
  }

  void setPresetText(){
    Utils().storePresetTextData(presetName);
  }

  void getPersistedWidget(int totalPages,
      List<List<String>> dropdowns,
      List<List<String>> sliderValueList,
      List<List<String>> checkboxValueList,
      List<String> addedTextList,
      List<String> presetTextList
      )
  {
    setState(() {
      _selectedDropdownOne = [];
      _selectedDropdownTwo = [];
      _selectedDropdownThree = [];
      slider = [];
      sliderValue = [];

      checkBox = [];
      checkBoxValue = [];
      addedText = [];


      presetName = [];


      qrData = [];

      qrWidgetList = [];

      qrStr = "";

      _timeString = [];


      count = totalPages;
      for(int i=0; i<=count; i++)
        {
          _selectedDropdownOne.add("${dropdowns[0][i]}");
          _selectedDropdownTwo.add("${dropdowns[1][i]}");
          _selectedDropdownThree.add("${dropdowns[2][i]}");

          globalKey = [];

          slider.add(
              [sliderValueList[i][0] == "" ? false : true,
            sliderValueList[i][1] == "" ? false : true,
            sliderValueList[i][2] == "" ? false : true,
            sliderValueList[i][3] == "" ? false : true]);
          sliderValue.add(
              ["${sliderValueList[i][0]}",
            "${sliderValueList[i][1]}",
            "${sliderValueList[i][2]}",
            "${sliderValueList[i][3]}"]);

          checkBox.add(
              [checkboxValueList[i][0] == "" ? false : true,
                checkboxValueList[i][1] == "" ? false : true,
                checkboxValueList[i][2] == "" ? false : true,
                checkboxValueList[i][3] == "" ? false : true,
                checkboxValueList[i][4] == "" ? false : true,
                checkboxValueList[i][5] == "" ? false : true]);
          checkBoxValue.add(
              ["${checkboxValueList[i][0]}",
            "${checkboxValueList[i][1]}",
            "${checkboxValueList[i][2]}",
            "${checkboxValueList[i][3]}",
            "${checkboxValueList[i][4]}",
            "${checkboxValueList[i][5]}"]);

          presetController.add(new TextEditingController());
          addedTextController.add(new TextEditingController());

          addedText.add(addedTextList[i]);
          presetName.add(presetTextList[i]);

          addedTextController[i].text = addedTextList[i];
          presetController[i].text = presetTextList[i];

          _timeString.add(_formatDateTime(DateTime.now()));

        }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //TODO: set status to online here in firestore
    }
    else {
      setTotalPages();
      setDropdowns();
      setSliders();
      setCheckBox();
      setAddedText();
      setPresetText();
    }
  }

  @override
  void dispose() {
    if(timer != null){
      timer.cancel();
    }
    super.dispose();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      for(int index = 0; index<=count; index ++ ) {
        if(slider[index][0]) {
          _timeString[index] = formattedDateTime;
        }
      }
      //updateQrWidget(count);
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  Widget dropDown(int ind)
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
              value: _selectedDropdownOne[ind],
              onChanged: (String Value) {
                setState(() {
                  _selectedDropdownOne[ind] = Value;
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

  Widget dropDownTwo(int ind)
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
              value: _selectedDropdownTwo[ind],
              onChanged: (String Value) {
                setState(() {
                  _selectedDropdownTwo[ind] = Value;
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

  Widget dropDownThree(int ind)
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
              value: _selectedDropdownThree[ind],
              onChanged: (String Value) {
                setState(() {
                  _selectedDropdownThree[ind] = Value;
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

  Widget sliderWidget(int ind)
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
              value: slider[ind][item],

              onChanged: (value) {
                print("VALUE : $value");
                setState(() {
                  slider[ind][item] = value;
                  if(slider[ind][item])
                  {

                    sliderValue[ind][item] = "Slider${item+1},";
                  }
                  else {

                    sliderValue[ind][item] = "";
                  }

                });
              },
            ),

            item == 0? new Container(
              padding: EdgeInsets.only(left: 0),
              child: new Text('Set Date + Time automatically', style: TextStyle(
                color: Colors.black,
                fontSize: 12
              ),),
            ) : new Container()

          ],
        ),
      )
      ).toList(),
    );
  }

  Widget checkBoxWidget(int ind)
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
                value: checkBox[ind][item+2],
                onChanged: (bool value) {
                  setState(() {
                    checkBox[ind][item+2] = value;
                    if(value)
                    {
                      checkBoxValue[ind][item+2] = "Checkbox${item+3},";
                    }
                    else {
                      checkBoxValue[ind][item+2] = "";
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

  Widget checkBoxWidgetTwo(int ind)
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
                value: checkBox[ind][item],
                onChanged: (bool value) {
                  setState(() {
                    checkBox[ind][item] = value;
                    if(value)
                    {
                      checkBoxValue[ind][item] = "Checkbox${item+1},";
                    }
                    else {
                      checkBoxValue[ind][item] = "";
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


  Widget widgetBankOne(int index)
  {
    return Column(
      children: <Widget>[

        Expanded(
          child: sliderWidget(index),
        ),

      ],
    );
  }

  Widget widgetBankTwo(int index)
  {
    return Column(
      children: <Widget>[

        dropDown(index),

        dropDownTwo(index),

        Expanded(
          child: checkBoxWidgetTwo(index),
        ),

      ],
    );
  }

  Widget widgetBankThree(int index)
  {
    return Column(
      children: <Widget>[

        dropDownThree(index),

        Expanded(
          child: checkBoxWidget(index),
        ),

      ],
    );
  }

  Widget textFields(int ind)
  {
    return Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            Expanded(
              child: new Container(
                padding: EdgeInsets.only(bottom: 10,left: 20, right: 0),
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
                            addedText[ind] = text;
                            //addedTextController[ind].text = text;
                          });
                        },
                        style: TextStyle(
                            fontSize: 12
                        ),
                        controller: addedTextController[ind],
                        textAlign: TextAlign.start,
                        decoration: new InputDecoration(
                          hintText: 'Added Text',
                          border: InputBorder.none,
                        ),
                      ),
                    )
                ),
              ),
            ),
            new Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                        top: 0,
                        left: 20,
                        bottom: 10,
                        right: 5
                    ),
                    child: GestureDetector(
                      onTap: (){
                        removePage(ind);
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
                          child: Icon(Icons.indeterminate_check_box, color: Color.fromRGBO(123, 141, 147, 1.0),)
                      ),
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 0,
                        left: 5,
                        right: 20,
                        bottom: 10
                    ),
                    child: GestureDetector(
                      onTap: (){
                        resetAll();
                        onAddButtonTapped();
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
            ),
          ],
        ),
        new Row(
          children: <Widget>[
            Expanded(
              child: new Container(
                padding: EdgeInsets.only(bottom: 10,left: 20, right: 0),
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
                            presetName[ind] = text;
                          });
                        },
                        style: TextStyle(
                            fontSize: 12
                        ),
                        controller: presetController[ind],
                        textAlign: TextAlign.start,
                        decoration: new InputDecoration(
                          hintText: 'Preset Name',
                          border: InputBorder.none,
                        ),
                      ),
                    )
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 10,
                    right: 20,
                    bottom: 10
                ),
                child: GestureDetector(
                  onTap: (){
                    //_saveScreen(globalKey1);
                    if(slider[ind][0]){
                      //scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Please disable Autometic date time set'),backgroundColor: Colors.red,));
                    }
                    else {
                      _captureAndSharePng(globalKey[ind], ind);
                    }
                  },
                  child: new Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    //width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: slider[ind][0] ? Colors.grey : Color.fromRGBO(208, 216, 220, 1.0),
                    ),
                    child: Text('SAVE IMAGE', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(123, 141, 147, 1.0)
                    ),),
                  ),
                )
            ),
          ],
        )
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

  Future<void> _captureAndSharePng(GlobalKey globalKey, int index) async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      String imgName = "Qr_${presetName[index]}" + "_${_timeString[index]}";

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
      _selectedDropdownOne.add("Dropdown 1");
      _selectedDropdownTwo.add("Dropdown 1");
      _selectedDropdownThree.add("Dropdown 1");

      //setDropdowns();

      slider.add([false, false, false, false]);
      sliderValue.add(["", "", "", ""]);

      checkBox.add([false, false, false, false, false, false]);
      checkBoxValue.add(["", "", "", "", "", ""]);

      addedText.add("");
      presetName.add("");

      presetController.add(new TextEditingController());
      addedTextController.add(new TextEditingController());

      _timer.add(Timer.periodic(Duration(days: 1), (Timer t) => {}));

      _timeString.add(_formatDateTime(DateTime.now()));

      pages.add(false);

      count +=1;

      //addQrWidget();

    });
  }

  void removePage(int index){
    if(count>0) {
      setState(() {

        count -= 1;

        _selectedDropdownOne.removeAt(index);
        _selectedDropdownTwo.removeAt(index);
        _selectedDropdownThree.removeAt(index);

        slider.removeAt(index);
        sliderValue.removeAt(index);

        checkBox.removeAt(index);
        checkBoxValue.removeAt(index);

        addedText.removeAt(index);
        presetName.removeAt(index);

        presetController.removeAt(index);
        addedTextController.removeAt(index);

//        if(_timer[index] != null)
//          {
//            _timer[index].cancel();
//            _timer.removeAt(index);
//          }

        if(timer != null){
          timer.cancel();
        }
        timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
          _getTime();
        });
        _timeString.removeAt(index);

        print(slider);

      });

    }
  }

  void onAddButtonTapped() {
    //_pageController.jumpToPage(count);
    _pageController.animateToPage(count, duration: Duration(milliseconds: 1000),curve: Curves.ease);
  }

  Widget qrSingleWidget(int index) {
//    if(!pages[index]) {
//      Timer.periodic(Duration(seconds: 1), (Timer t) {
//        if (slider[index][0]) {
//          _getTime(index);
//        }
//      });
//      pages[index] = true;
//    }
    qrStr ="${_timeString[index]},${_selectedDropdownOne[index]},${_selectedDropdownTwo[index]},${_selectedDropdownThree[index]},${sliderValue[index][0]}${sliderValue[index][1]}${sliderValue[index][2]}${sliderValue[index][3]}${checkBoxValue[index][0]}${checkBoxValue[index][1]}${checkBoxValue[index][2]}${checkBoxValue[index][3]}${checkBoxValue[index][4]}${checkBoxValue[index][5]}${addedText[index]}";
    globalKey.add(new GlobalKey());
    return new Column(
      children: <Widget>[
        RepaintBoundary(
          key: globalKey[index],
          child: Container(
            color: Colors.white,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                QrImage(
                  data: "$qrStr",
                  version: QrVersions.auto,
                  size: 210.0,
                ),

                new Container(
                  child: new Text("${presetName[index]}", style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      //appBar: AppBar(),
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
//      body: PageIndicatorContainer(
//        child: PageView(
//          controller: _pageController,
//          onPageChanged: (int index){
//            setState(() {
//
//            });
//          },
//          children: List<int>.generate(count+1, (index) => index)
//              .map((item) =>  new Column(
//            children: <Widget>[
//              Expanded(
//                flex: 4,
//                child: DefaultTabController(
//                  length: 3,
//
//                  child: Scaffold(
//
//                    resizeToAvoidBottomPadding: false,
//
//                    appBar: AppBar(
//                      title: Text(widget.title),
//                    ),
//                    //bottomNavigationBar: menu(),
//                    body: Center(
//                        child: TabBarView(
//                          children: <Widget>[
//                            widgetBankOne(item),
//                            widgetBankTwo(item),
//                            widgetBankThree(item),
//                          ],
//                        )
//                    ),
//
//                  ),
//                ),
//              ),
//              Expanded(
//                flex: 5,
//                child: Column(
//                  children: <Widget>[
//                    textFields(item),
//                    Expanded(
//                      child: new Container(
//                        //height: 200,
//                        child: qrSingleWidget(item),
//
//                      ),
//                    )
//
//
//                  ],
//                ),
//              )
//            ],
//          ),
//          ).toList(),
//        ),
//        length: count + 1,
//        indicatorColor: Colors.grey,
//        indicatorSelectorColor: Colors.blue,
//        shape: IndicatorShape.circle(size: 8.0),
//      )
      body: PageView(
      controller: _pageController,
      onPageChanged: (int index){
        setState(() {

        });
      },
      children: List<int>.generate(count+1, (index) => index)
          .map((item) =>  new Column(
        children: <Widget>[
          Expanded(
            flex: 4,
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
                        widgetBankOne(item),
                        widgetBankTwo(item),
                        widgetBankThree(item),
                      ],
                    )
                ),

              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                textFields(item),
                Expanded(
                  child: new Container(
                    //height: 200,
                    child: qrSingleWidget(item),

                  ),
                )


              ],
            ),
          )
        ],
      ),
      ).toList(),
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