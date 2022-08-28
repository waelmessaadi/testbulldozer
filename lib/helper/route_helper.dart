import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_tech/ui/offert_details_screen.dart';
import 'package:test_tech/ui/offerts_screen.dart';

import '../data/model/response/offerts_model.dart';

class RouteHelper {
  static const String initial = '/';
  static const String detailsOffert = '/details-offert';

  static String getInitialRoute() => '$initial';
  static String getDetailsOffertRoute() => '$detailsOffert';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => getRoute(OffertScreen())),
    GetPage(name: detailsOffert, page: () =>  OffertDetailsScreen(), arguments: ['data']),
  ];

  static getRoute(Widget navigateTo) {
    return navigateTo;
  }
}