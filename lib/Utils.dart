import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

class Utils{

  storeDropdownData(List<List<String>> dropdowns) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for(int i=0; i<dropdowns.length; i++) {
      prefs.setStringList("dropdown$i", dropdowns[i]);
    }
  }

  storeSliderData(List<List<String>> sliderList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for(int i=0; i<sliderList.length; i++) {
      prefs.setStringList("sliders$i", sliderList[i]);
    }
  }

  storeCheckboxData(List<List<String>> checkboxList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for(int i=0; i<checkboxList.length; i++) {
      prefs.setStringList("checkbox$i", checkboxList[i]);
    }
  }

  storeAddedTextData(List<String> addedTextList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList("addedtext", addedTextList);
  }

  storePresetTextData(List<String> presetTextList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList("presettext", presetTextList);
  }

  storeTotalPages(int count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("pages", count);
  }

  Future< List<List<String>> > readDropdownData(int totalDropdown) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<List<String>> selectedDropdowns = [];
    //LoginResponse loginResponse = new LoginResponse();

    for(int i=0; i<totalDropdown; i++)
      {
        List<String> dropdowns = prefs.getStringList("dropdown$i");
        selectedDropdowns.add(dropdowns);
      }


    return selectedDropdowns;
  }

  Future< List<List<String>> > readSliderData(int totalSlider) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<List<String>> sliderValues = [];
    //LoginResponse loginResponse = new LoginResponse();

    for(int i=0; i<totalSlider; i++)
    {
      List<String> slider = prefs.getStringList("sliders$i");
      sliderValues.add(slider);
    }


    return sliderValues;
  }

  Future< List<List<String>> > readCheckboxData(int totalCheckbox) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<List<String>> checkboxValues = [];
    //LoginResponse loginResponse = new LoginResponse();

    for(int i=0; i<totalCheckbox; i++)
    {
      List<String> slider = prefs.getStringList("checkbox$i");
      checkboxValues.add(slider);
    }


    return checkboxValues;
  }

  Future<List<String>> readAddedTextData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> addedTextList = prefs.getStringList("addedtext");

    return addedTextList;
  }

  Future<List<String>> readPresetTextData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> presetTextList = prefs.getStringList("presettext");

    return presetTextList;
  }

  Future< int > readTotalPages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int totalPages = prefs.getInt("pages");


    return totalPages;
  }

}