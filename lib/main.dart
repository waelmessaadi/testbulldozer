import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_tech/ui/offerts_screen.dart';

import 'controller/offerts_controller.dart';
import 'data/model/response/offerts_model.dart';
import '../helper/get_di.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}
/*
class OffertScreen extends StatefulWidget {
  const OffertScreen({Key? key}) : super(key: key);

  @override
  State<OffertScreen> createState() => _OffertScreenState();
}

class _OffertScreenState extends State<OffertScreen> {
  // This widget is the root of your application.
  final json = '{ "data": [ { "id": 21835, "status": "waiting","start_at": "2022-02-28 17:00:00","end_at": "2022-03-01 01:30:00","post_name": "Server","post_id": 1,"start_soon": false,"recurring": null,"company": "Marroniers","buy_price": "22.00","bonus": 5,"latitude": 46.8139963,"longitude": -71.1796024},{       "id": 22201,"status": "waiting","start_at": "2022-02-28 21:00:00","end_at": "2022-03-01 06:30:00","post_name": "Food & Beverage Helper","post_id": 10,"start_soon": false,"recurring": {"id": 3067,"start_at": "2022-02-28 21:00:00","end_at": "2022-03-04 06:30:00","is_available": false},"company": "Les Produits Alimaison 2014 inc.","buy_price": "19.00","bonus": 2,"latitude": 46.857129,"longitude": -71.3390471},{"id": 22311,"status": "accepted","start_at": "2022-03-01 16:00:00","end_at": "2022-03-02 00:30:00","post_name": "Help-Cook","post_id": 4,"start_soon": false,"recurring": null,"company": "Manoir Manrèse groupe Cogir","buy_price": "20.00","bonus": 0,"latitude": 46.8027708,"longitude": -71.2403502},{"id": 22313,"status": "accepted","start_at": "2022-03-02 16:00:00","end_at": "2022-03-03 00:30:00","post_name": "Help-Cook","post_id": 4,"start_soon": false,"recurring": null,"company": "Manoir Manrèse groupe Cogir","buy_price": "20.00","bonus": 0,"latitude": 46.8027708,"longitude": -71.2403502},{"id": 22298,"status": "accepted","start_at": "2022-03-05 21:00:00","end_at": "2022-03-06 01:00:00","post_name": "Server","post_id": 1,"start_soon": false,"recurring": null,"company": "Pavillon Sekoia","buy_price": "22.00","bonus": 0,"latitude": 46.7922073,"longitude": -71.1830321},{"id": 21522,"status": "accepted","start_at": "2022-03-05 22:00:00","end_at": "2022-03-06 02:00:00","post_name": "Server","post_id": 1,"start_soon": false,"recurring": null,"company": "Chartwell Trait-Carré","buy_price": "22.00","bonus": 0,"latitude": 46.8745704,"longitude": -71.2521533},{"id": 22209,"status": "waiting","start_at": "2022-03-07 21:00:00","end_at": "2022-03-08 06:30:00","post_name": "Food & Beverage Helper","post_id": 10,"start_soon": false,"recurring": {"id": 3069,"start_at": "2022-03-07 21:00:00","end_at": "2022-03-11 06:30:00","is_available": true},"company": "Les Produits Alimaison 2014 inc.","buy_price": "19.00","bonus": 2,"latitude": 46.857129,"longitude": -71.3390471},{"id": 22213,"status": "accepted","start_at": "2022-03-07 21:00:00","end_at": "2022-03-08 06:30:00","post_name": "Food & Beverage Helper","post_id": 10,"start_soon": false,"recurring": {"id": 3070,"start_at": "2022-03-07 21:00:00","end_at": "2022-03-11 06:30:00","is_available": true},"company": "Les Produits Alimaison 2014 inc.","buy_price": "19.00","bonus": 2,"latitude": 46.857129,"longitude": -71.3390471},{"id": 22210,"status": "accepted","start_at": "2022-03-08 21:00:00","end_at": "2022-03-09 06:30:00","post_name": "Food & Beverage Helper","post_id": 10,"start_soon": false,"recurring": {"id": 3069,"start_at": "2022-03-07 21:00:00","end_at": "2022-03-11 06:30:00","is_available": true},"company": "Les Produits Alimaison 2014 inc.","buy_price": "19.00","bonus": 2,"latitude": 46.857129,"longitude": -71.3390471},{"id": 22214,"status": "waiting","start_at": "2022-03-08 21:00:00","end_at": "2022-03-09 06:30:00","post_name": "Food & Beverage Helper","post_id": 10,"start_soon": false,"recurring": {"id": 3070,"start_at": "2022-03-07 21:00:00","end_at": "2022-03-11 06:30:00","is_available": true},"company": "Les Produits Alimaison 2014 inc.","buy_price": "19.00","bonus": 2,"latitude": 46.857129,"longitude": -71.3390471}],"links": {"first": "https://api.goodjobapp.ca/api/v2/worker/shifts?status%5B0%5D=waiting&page=1","last": "https://api.goodjobapp.ca/api/v2/worker/shifts?status%5B0%5D=waiting&page=10","prev": null,"next": "https://api.goodjobapp.ca/api/v2/worker/shifts?status%5B0%5D=waiting&page=2"},"meta": {"current_page": 1,"from": 1,"last_page": 10,"path": "https://api.goodjobapp.ca/api/v2/worker/shifts","per_page": 10,"to": 10,"total": 92}}';

  List<Data> listOfOfferts = [];

  @override
  void initState() {

    final jsonToParsed = '$json';
    listOfOfferts = Get.find<OffertsController>().getListOfferts(json)!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GeeksforGeeks')),
      body: const Center(
        child: Text(
          "Welcome to GeeksforGeeks!!!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
          ),
        ),
      ),
    );
    //   Scaffold(
    //   appBar: null,
    //   body: SingleChildScrollView(
    //     child: Column(
    //         children: [
    //           ListView.builder(
    //               itemCount: listOfOfferts.length,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return ListTile(
    //                     leading: const Icon(Icons.list),
    //                     trailing: const Text(
    //                       "GFG",
    //                       style: TextStyle(color: Colors.green, fontSize: 15),
    //                     ),
    //                     title: Text("List item $index"));
    //               }),
    //           ListView.builder(
    //               itemCount: 5,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return ListTile(
    //                     leading: const Icon(Icons.list),
    //                     trailing: const Text(
    //                       "GFG",
    //                       style: TextStyle(color: Colors.green, fontSize: 15),
    //                     ),
    //                     title: Text("List item $index"));
    //               }),
    //         ]
    //     ),
    //   ),
    // );
  }*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OffertScreen(),
    );
  }
}

//}
