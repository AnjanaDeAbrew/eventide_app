import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventide_app/controllers/file_upload_controller.dart';
import 'package:eventide_app/models/aniversary_model.dart';
import 'package:eventide_app/models/bday_model.dart';
import 'package:eventide_app/models/engage_model.dart';
import 'package:eventide_app/models/exhibition_model.dart';
import 'package:eventide_app/models/office_model.dart';
import 'package:eventide_app/models/organizer_model.dart';
import 'package:eventide_app/models/wedding_model.dart';
import 'package:logger/logger.dart';

class AdminController {
  //--------============================saving user data in cloud firestore======================
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference organizers =
      FirebaseFirestore.instance.collection('organizers');
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference weddings =
      FirebaseFirestore.instance.collection('weddings');
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference birthdays =
      FirebaseFirestore.instance.collection('birthday');
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference engagements =
      FirebaseFirestore.instance.collection('engagement');
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference aniversarys =
      FirebaseFirestore.instance.collection('aniversary');
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference offices = FirebaseFirestore.instance.collection('office');
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference exhibitions =
      FirebaseFirestore.instance.collection('exhibition');

  //------file upload controller object
  final FileUploadController _fileUploadController = FileUploadController();

//----------save organizer data in firestore
  Future<void> saveOrganizerData(
      String orgName,
      String streetNo,
      String streetName,
      String town,
      String description,
      String mobile,
      String price,
      bool wedding,
      bool bday,
      bool engage,
      bool aniversary,
      bool office,
      bool exhibition,
      File file) async {
//--------uploading the selected organizer image in to storage and get the download url
    final String downloadUrl =
        await _fileUploadController.uploadFile(file, "organizerImages");

    if (downloadUrl != "") {
      await organizers
          .add(
            {
              'orgName': orgName,
              'streetNo': streetNo,
              'streetName': streetName,
              'town': town,
              'description': description,
              'mobile': mobile,
              'price': price,
              'wedding': wedding,
              'bday': bday,
              'engage': engage,
              'aniversary': aniversary,
              'office': office,
              'exhibition': exhibition,
              'img': downloadUrl,
            },
          )
          .then((value) {
            if (wedding == true) {
              weddings
                  .add(
                    {
                      'orgName': orgName,
                      'streetNo': streetNo,
                      'streetName': streetName,
                      'town': town,
                      'description': description,
                      'mobile': mobile,
                      'price': price,
                      'img': downloadUrl,
                    },
                  )
                  .then((value) => Logger().i("added weddings"))
                  .catchError(
                      (error) => Logger().e("Failed to add organizer: $error"));
            }
          })
          .then((value) {
            if (bday == true) {
              birthdays
                  .add(
                    {
                      'orgName': orgName,
                      'streetNo': streetNo,
                      'streetName': streetName,
                      'town': town,
                      'description': description,
                      'mobile': mobile,
                      'price': price,
                      'img': downloadUrl,
                    },
                  )
                  .then((value) => Logger().i("added bday"))
                  .catchError(
                      (error) => Logger().e("Failed to add organizer: $error"));
            }
          })
          .then((value) {
            if (engage == true) {
              engagements
                  .add(
                    {
                      'orgName': orgName,
                      'streetNo': streetNo,
                      'streetName': streetName,
                      'town': town,
                      'description': description,
                      'mobile': mobile,
                      'price': price,
                      'img': downloadUrl,
                    },
                  )
                  .then((value) => Logger().i("added engage"))
                  .catchError(
                      (error) => Logger().e("Failed to add organizer: $error"));
            }
          })
          .then((value) {
            if (aniversary == true) {
              aniversarys
                  .add(
                    {
                      'orgName': orgName,
                      'streetNo': streetNo,
                      'streetName': streetName,
                      'town': town,
                      'description': description,
                      'mobile': mobile,
                      'price': price,
                      'img': downloadUrl,
                    },
                  )
                  .then((value) => Logger().i("added aniversary"))
                  .catchError(
                      (error) => Logger().e("Failed to add organizer: $error"));
            }
          })
          .then((value) {
            if (office == true) {
              offices
                  .add(
                    {
                      'orgName': orgName,
                      'streetNo': streetNo,
                      'streetName': streetName,
                      'town': town,
                      'description': description,
                      'mobile': mobile,
                      'price': price,
                      'img': downloadUrl,
                    },
                  )
                  .then((value) => Logger().i("added office"))
                  .catchError(
                      (error) => Logger().e("Failed to add organizer: $error"));
            }
          })
          .then((value) {
            if (exhibition == true) {
              exhibitions
                  .add(
                    {
                      'orgName': orgName,
                      'streetNo': streetNo,
                      'streetName': streetName,
                      'town': town,
                      'description': description,
                      'mobile': mobile,
                      'price': price,
                      'img': downloadUrl,
                    },
                  )
                  .then((value) => Logger().i("added exhibition"))
                  .catchError(
                      (error) => Logger().e("Failed to add organizer: $error"));
            }
          })
          .then((value) => Logger().i("Organizer added"))
          .catchError((error) => Logger().e("Failed to add organizer: $error"));
    } else {
      Logger().e("Something went wrong");
    }
  }

  //---fetch organizer list from cloudfirestore

  Future<List<OrganizerModel>> fetchOrganizerList() async {
    try {
      //----------------firebase query that find and fetch product collection
      QuerySnapshot querySnapshot = await organizers.get();
      Logger().i(querySnapshot.docs.length);

      //temp organizer list
      List<OrganizerModel> list = [];

      for (var e in querySnapshot.docs) {
        //------------mapping product data into organizer model
        OrganizerModel model =
            OrganizerModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

//---fetch organizer cat from cloudfirestore

  Future<List<List<dynamic>>> fetchCategory() async {
    try {
      //----------------firebase query that find and fetch product collection
      QuerySnapshot querySnapshotw = await weddings.get();
      QuerySnapshot querySnapshotb = await birthdays.get();
      QuerySnapshot querySnapshote = await engagements.get();
      QuerySnapshot querySnapshota = await aniversarys.get();
      QuerySnapshot querySnapshoto = await offices.get();
      QuerySnapshot querySnapshotex = await exhibitions.get();

      Logger().i(querySnapshotw.docs.length);
      Logger().i(querySnapshotb.docs.length);
      Logger().i(querySnapshote.docs.length);
      Logger().i(querySnapshota.docs.length);
      Logger().i(querySnapshoto.docs.length);
      Logger().i(querySnapshotex.docs.length);

      //temp organizer list
      List<List<dynamic>> catlist = [];
      List<WeddingModel> wedlist = [];
      List<BdayModel> bdlist = [];
      List<EngageModel> enlist = [];
      List<AniversaryModel> anlist = [];
      List<OfficeModel> oflist = [];
      List<ExhibitionModel> exlist = [];

      for (var e in querySnapshotw.docs) {
        //------------mapping product data into organizer model
        WeddingModel wmodel =
            WeddingModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        wedlist.add(wmodel);
      }
      for (var e in querySnapshotb.docs) {
        //------------mapping product data into organizer model
        BdayModel bmodel =
            BdayModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        bdlist.add(bmodel);
      }
      for (var e in querySnapshote.docs) {
        //------------mapping product data into organizer model
        EngageModel emodel =
            EngageModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        enlist.add(emodel);
      }
      for (var e in querySnapshota.docs) {
        //------------mapping product data into organizer model
        AniversaryModel amodel =
            AniversaryModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        anlist.add(amodel);
      }
      for (var e in querySnapshoto.docs) {
        //------------mapping product data into organizer model
        OfficeModel omodel =
            OfficeModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        oflist.add(omodel);
      }
      for (var e in querySnapshotex.docs) {
        //------------mapping product data into organizer model
        ExhibitionModel exmodel =
            ExhibitionModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        exlist.add(exmodel);
      }
      catlist = [wedlist, bdlist, enlist, anlist, oflist, exlist];
      return catlist;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  //---fetch wedding list from cloudfirestore

  Future<List<WeddingModel>> fetchWeddingList() async {
    try {
      //----------------firebase query that find and fetch product collection
      QuerySnapshot querySnapshot = await weddings.get();
      Logger().i(querySnapshot.docs.length);

      //temp product list
      List<WeddingModel> list = [];

      for (var e in querySnapshot.docs) {
        //------------mapping product data into organizer model
        WeddingModel model =
            WeddingModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  //---fetch bday list from cloudfirestore

  Future<List<BdayModel>> fetchBdayList() async {
    try {
      //----------------firebase query that find and fetch product collection
      QuerySnapshot querySnapshot = await birthdays.get();
      Logger().i(querySnapshot.docs.length);

      //temp product list
      List<BdayModel> list = [];

      for (var e in querySnapshot.docs) {
        //------------mapping product data into organizer model
        BdayModel model = BdayModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  //---fetch engage list from cloudfirestore

  Future<List<EngageModel>> fetchEngageList() async {
    try {
      //----------------firebase query that find and fetch product collection
      QuerySnapshot querySnapshot = await engagements.get();
      Logger().i(querySnapshot.docs.length);

      //temp product list
      List<EngageModel> list = [];

      for (var e in querySnapshot.docs) {
        //------------mapping product data into organizer model
        EngageModel model =
            EngageModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  //---fetch aniversary list from cloudfirestore

  Future<List<AniversaryModel>> fetchAniversaryList() async {
    try {
      //----------------firebase query that find and fetch product collection
      QuerySnapshot querySnapshot = await aniversarys.get();
      Logger().i(querySnapshot.docs.length);

      //temp product list
      List<AniversaryModel> list = [];

      for (var e in querySnapshot.docs) {
        //------------mapping product data into organizer model
        AniversaryModel model =
            AniversaryModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  //---fetch office list from cloudfirestore

  Future<List<OfficeModel>> fetchOfficeList() async {
    try {
      //----------------firebase query that find and fetch product collection
      QuerySnapshot querySnapshot = await offices.get();
      Logger().i(querySnapshot.docs.length);

      //temp product list
      List<OfficeModel> list = [];

      for (var e in querySnapshot.docs) {
        //------------mapping product data into organizer model
        OfficeModel model =
            OfficeModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  //---fetch exhibition list from cloudfirestore

  Future<List<ExhibitionModel>> fetchExhibitionList() async {
    try {
      //----------------firebase query that find and fetch product collection
      QuerySnapshot querySnapshot = await exhibitions.get();
      Logger().i(querySnapshot.docs.length);

      //temp product list
      List<ExhibitionModel> list = [];

      for (var e in querySnapshot.docs) {
        //------------mapping product data into organizer model
        ExhibitionModel model =
            ExhibitionModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }
}
