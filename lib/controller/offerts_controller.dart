import 'dart:convert';

import 'package:get/get.dart';

import '../data/model/response/offerts_model.dart';

class OffertsController extends GetxController {
  List<Data>? getListOfferts(final json) {

    final parsedJson = jsonDecode(json);
    final offertsModel = OffertsModel.fromJson(parsedJson);
    return offertsModel.data;

  }
}