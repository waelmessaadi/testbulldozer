import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_tech/ui/offert_details_screen.dart';
import 'package:test_tech/ui/offerts_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String detailsOffert = '/details-offert';

  static String getInitialRoute() => '$initial';
  static String getHomeRoute() => '$detailsOffert';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => getRoute(OffertScreen())),
    GetPage(name: detailsOffert, page: () =>  OffertDetailsScreen()),
  ];

  static getRoute(Widget navigateTo) {
    return navigateTo;
  }
}