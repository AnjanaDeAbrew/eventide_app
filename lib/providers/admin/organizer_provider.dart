import 'package:eventide_app/controllers/admin_controller.dart';
import 'package:eventide_app/models/organizer_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class OrganizerProvider extends ChangeNotifier {
  //------admin controller object
  final AdminController _admiController = AdminController();

  //----loading state
  bool _isLoading = false;

  //get loader state
  bool get isLoading => _isLoading;

  //-----set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //---------store organizer list
  List<OrganizerModel> _organizers = [];

  List<OrganizerModel> get organizers => _organizers;

  //---start fetch products
  Future<void> startFetchOrganizers() async {
    try {
      //-start the loader
      setLoader = true;
      _organizers = await _admiController.fetchOrganizerList();
      notifyListeners();

      //-stop the loader
      setLoader = false;
    } catch (e) {
      Logger().e(e);
      //-stop the loader
      setLoader = false;
    }
  }

  //---------store organizer list
  final List<dynamic> _catList = [];
  List<dynamic> _wedlist = [];
  List<dynamic> _bdlist = [];
  List<dynamic> _enlist = [];
  List<dynamic> _anlist = [];
  List<dynamic> _oflist = [];
  List<dynamic> _exlist = [];

  List<dynamic> get catList => _catList;
  List<dynamic> get wedlist => _wedlist;
  List<dynamic> get bdlist => _bdlist;
  List<dynamic> get enlist => _enlist;
  List<dynamic> get anlist => _anlist;
  List<dynamic> get oflist => _oflist;
  List<dynamic> get exlist => _exlist;

  //---start fetch products
  Future<void> startFetchOrganizersList() async {
    try {
      //-start the loader
      setLoader = true;
      _wedlist = await _admiController.fetchWeddingList();
      _bdlist = await _admiController.fetchBdayList();
      _enlist = await _admiController.fetchEngageList();
      _anlist = await _admiController.fetchAniversaryList();
      _oflist = await _admiController.fetchOfficeList();
      _exlist = await _admiController.fetchExhibitionList();
      notifyListeners();

      Logger().i(wedlist);

      //-stop the loader
      setLoader = false;
    } catch (e) {
      Logger().e(e);
      //-stop the loader
      setLoader = false;
    }
  }

  //-------to store selected productModel
  late OrganizerModel _organizerModel;

  OrganizerModel get organizerModel => _organizerModel;

  //set product model when clicked on the product tile
  set setOrganizer(OrganizerModel model) {
    _organizerModel = model;
    notifyListeners();
  }
}
