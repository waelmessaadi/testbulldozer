import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_tech/controller/offerts_controller.dart';

Future<void> init() async {

  // Controller
  Get.lazyPut(() => OffertsController());

}