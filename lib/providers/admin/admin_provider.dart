import 'dart:io';

import 'package:eventide_app/controllers/admin_controller.dart';
import 'package:eventide_app/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class AdminProvider extends ChangeNotifier {
  //--------------admin controller object
  final AdminController _adminController = AdminController();

  //------image picker class object
  final ImagePicker _picker = ImagePicker();

//------product image object
  File _image = File("");

  //----get picked file
  File get image => _image;
  //--select product image
  Future<void> selectImage() async {
    try {
      _image = (await UtilFunction.pickImageFromGallery())!;
      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }

//---description controler
  final _description = TextEditingController();

  //--- get description controller
  TextEditingController get descriptionController => _description;

  //---OrganizerName controller
  final _orgName = TextEditingController();

//--- get OrganizerName controller
  TextEditingController get orgNameController => _orgName;

//---StreetNo controler
  final _streetNo = TextEditingController();

  //--- get StreetNo controller
  TextEditingController get streetNoController => _streetNo;

  //---StreetName controler
  final _streetName = TextEditingController();

  //--- get StreetName controller
  TextEditingController get streetNameController => _streetName;

  //---Town controler
  final _town = TextEditingController();

  //--- get Town controller
  TextEditingController get townController => _town;

  //---Price controler
  final _price = TextEditingController();

  //--- get Price controller
  TextEditingController get priceController => _price;

  //---Mobile  controler
  final _mobile = TextEditingController();

  //--- get Mobile controller
  TextEditingController get mobileController => _mobile;

//-------------------category check
  //---category wedding controler
  bool _wedding = false;

  //--- get category wedding controller
  bool get wedding => _wedding;

  //-----set category wedding state
  set setWedding(bool wVal) {
    _wedding = wVal;
    notifyListeners();
  }

  //---category birthday controler
  bool _bday = false;

  //--- get category birthday controller
  bool get bday => _bday;

  //-----set category birthday state
  set setBday(bool bVal) {
    _bday = bVal;
    notifyListeners();
  }

  //---category engagement controler
  bool _engage = false;

  //--- get category engagement controller
  bool get engage => _engage;

  //-----set category engagement state
  set setEngage(bool eVal) {
    _engage = eVal;
    notifyListeners();
  }

  //---category aniversary controler
  bool _aniversary = false;

  //--- get category aniversary controller
  bool get aniversary => _aniversary;

  //-----set category aniversary state
  set setAniversary(bool aVal) {
    _aniversary = aVal;
    notifyListeners();
  }

  //---category office controler
  bool _office = false;

  //--- get category office controller
  bool get office => _office;

  //-----set category office state
  set setOffice(bool oVal) {
    _office = oVal;
    notifyListeners();
  }

  //---category exhibition controler
  bool _exhibition = false;

  //--- get category exhibition controller
  bool get exhibition => _exhibition;

  //-----set category exhibition state
  set setExhibition(bool exVal) {
    _exhibition = exVal;
    notifyListeners();
  }

//----loading state
  bool _isLoading = false;

  //get loader state
  bool get isLoading => _isLoading;

  //-----set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //-start saving product data
  Future<void> startSaveOrganizerData() async {
    try {
      //-start the loader
      setLoader = true;
      await _adminController
          .saveOrganizerData(
        _orgName.text,
        _streetNo.text,
        _streetName.text,
        _town.text,
        _description.text,
        _mobile.text,
        _price.text,
        _wedding,
        _bday,
        _engage,
        _aniversary,
        _office,
        _exhibition,
        _image,
      )
          .then((value) {
        //--clean values
        _orgName.clear();
        _streetNo.clear();
        _streetName.clear();
        _town.clear();
        _description.clear();
        _price.clear();
        _mobile.clear();
        _wedding = false;
        _bday = false;
        _engage = false;
        _aniversary = false;
        _office = false;
        _exhibition = false;
      });
      //-stop the loader
      setLoader = false;
    } catch (e) {
      //-stop the loader
      setLoader = false;
      Logger().e(e);
    }
  }
}
