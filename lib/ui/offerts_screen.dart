import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_tech/controller/offerts_controller.dart';
import 'package:test_tech/util/dimensions.dart';

import '../data/model/response/offerts_model.dart';
import '../util/style.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class OffertScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OffertScreenState();
  }
}

class _OffertScreenState extends State<OffertScreen> {
  var _currentIndex = 0;

  List<Data> listOfOfferts = [];
  List<Data> listOfOffertsWaiting = [];
  List<Data> listOfOffertsAccepted = [];

  final json =
      '{ "data": [ { "id": 21835, "status": "waiting","start_at": "2022-02-28 17:00:00","end_at": "2022-03-01 01:30:00","post_name": "Server","post_id": 1,"start_soon": false,"recurring": null,"company": "Marroniers","buy_price": "22.00","bonus": 5,"latitude": 46.8139963,"longitude": -71.1796024},{       "id": 22201,"status": "waiting","start_at": "2022-02-28 21:00:00","end_at": "2022-03-01 06:30:00","post_name": "Food & Beverage Helper","post_id": 10,"start_soon": false,"recurring": {"id": 3067,"start_at": "2022-02-28 21:00:00","end_at": "2022-03-04 06:30:00","is_available": false},"company": "Les Produits Alimaison 2014 inc.","buy_price": "19.00","bonus": 2,"latitude": 46.857129,"longitude": -71.3390471},{"id": 22311,"status": "accepted","start_at": "2022-03-01 16:00:00","end_at": "2022-03-02 00:30:00","post_name": "Help-Cook","post_id": 4,"start_soon": false,"recurring": null,"company": "Manoir Manrèse groupe Cogir","buy_price": "20.00","bonus": 0,"latitude": 46.8027708,"longitude": -71.2403502},{"id": 22313,"status": "accepted","start_at": "2022-03-02 16:00:00","end_at": "2022-03-03 00:30:00","post_name": "Help-Cook","post_id": 4,"start_soon": false,"recurring": null,"company": "Manoir Manrèse groupe Cogir","buy_price": "20.00","bonus": 0,"latitude": 46.8027708,"longitude": -71.2403502},{"id": 22298,"status": "accepted","start_at": "2022-03-05 21:00:00","end_at": "2022-03-06 01:00:00","post_name": "Server","post_id": 1,"start_soon": false,"recurring": null,"company": "Pavillon Sekoia","buy_price": "22.00","bonus": 0,"latitude": 46.7922073,"longitude": -71.1830321},{"id": 21522,"status": "accepted","start_at": "2022-03-05 22:00:00","end_at": "2022-03-06 02:00:00","post_name": "Server","post_id": 1,"start_soon": false,"recurring": null,"company": "Chartwell Trait-Carré","buy_price": "22.00","bonus": 0,"latitude": 46.8745704,"longitude": -71.2521533},{"id": 22209,"status": "waiting","start_at": "2022-03-07 21:00:00","end_at": "2022-03-08 06:30:00","post_name": "Food & Beverage Helper","post_id": 10,"start_soon": false,"recurring": {"id": 3069,"start_at": "2022-03-07 21:00:00","end_at": "2022-03-11 06:30:00","is_available": true},"company": "Les Produits Alimaison 2014 inc.","buy_price": "19.00","bonus": 2,"latitude": 46.857129,"longitude": -71.3390471},{"id": 22213,"status": "accepted","start_at": "2022-03-07 21:00:00","end_at": "2022-03-08 06:30:00","post_name": "Food & Beverage Helper","post_id": 10,"start_soon": false,"recurring": {"id": 3070,"start_at": "2022-03-07 21:00:00","end_at": "2022-03-11 06:30:00","is_available": true},"company": "Les Produits Alimaison 2014 inc.","buy_price": "19.00","bonus": 2,"latitude": 46.857129,"longitude": -71.3390471},{"id": 22210,"status": "accepted","start_at": "2022-03-08 21:00:00","end_at": "2022-03-09 06:30:00","post_name": "Food & Beverage Helper","post_id": 10,"start_soon": false,"recurring": {"id": 3069,"start_at": "2022-03-07 21:00:00","end_at": "2022-03-11 06:30:00","is_available": true},"company": "Les Produits Alimaison 2014 inc.","buy_price": "19.00","bonus": 2,"latitude": 46.857129,"longitude": -71.3390471},{"id": 22214,"status": "waiting","start_at": "2022-03-08 21:00:00","end_at": "2022-03-09 06:30:00","post_name": "Food & Beverage Helper","post_id": 10,"start_soon": false,"recurring": {"id": 3070,"start_at": "2022-03-07 21:00:00","end_at": "2022-03-11 06:30:00","is_available": true},"company": "Les Produits Alimaison 2014 inc.","buy_price": "19.00","bonus": 2,"latitude": 46.857129,"longitude": -71.3390471}],"links": {"first": "https://api.goodjobapp.ca/api/v2/worker/shifts?status%5B0%5D=waiting&page=1","last": "https://api.goodjobapp.ca/api/v2/worker/shifts?status%5B0%5D=waiting&page=10","prev": null,"next": "https://api.goodjobapp.ca/api/v2/worker/shifts?status%5B0%5D=waiting&page=2"},"meta": {"current_page": 1,"from": 1,"last_page": 10,"path": "https://api.goodjobapp.ca/api/v2/worker/shifts","per_page": 10,"to": 10,"total": 92}}';

/*
  @override
  void initState() {

    listOfOfferts = Get.find<OffertsController>().getListOfferts(json)!;

  }*/

  @override
  Widget build(BuildContext context) {
    listOfOfferts.clear();
    listOfOfferts = Get.find<OffertsController>().getListOfferts(json)!;

    listOfOffertsWaiting.clear();
    listOfOffertsAccepted.clear();

    for (Data data in listOfOfferts) {
      data.status == 'waiting'
          ? listOfOffertsWaiting.add(data)
          : listOfOffertsAccepted.add(data);
    }

    return Scaffold(
        backgroundColor: Color(0xffefefef),
        body: _currentPage(_currentIndex),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(
              top: 16.0, bottom: 16.0, left: 8.0, right: 8.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              // topLeft:
              Radius.circular(25.0), // adjust to your liking
              // topRight: Radius.circular(25.0), // adjust to your liking
            ),
          ),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            items: [
              /// Search
              SalomonBottomBarItem(
                icon: Icon(Icons.search),
                title: Text("Search"),
                selectedColor: Colors.blue,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite_border),
                title: Text("Likes"),
                selectedColor: Colors.pink,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
                selectedColor: Colors.orange,
              ),
            ],
          ),
        ));
  }

  Widget _currentPage(int _indexPage) {
    if (_indexPage == 0) {
      return Column(
        children: <Widget>[
          const SizedBox(
            height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                    left: Dimensions.PADDING_SIZE_DEFAULT,
                    right: Dimensions.PADDING_SIZE_DEFAULT),
                child: Text("Shifts offerts",
                    style: TextStyle(
                      fontFamily: 'PTSerif',
                      fontSize: Dimensions.fontSizeOverLarge,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                left: Dimensions.PADDING_SIZE_DEFAULT,
                right: Dimensions.PADDING_SIZE_DEFAULT),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Dernière minute".toUpperCase(),
                  style: robotoMedium.copyWith(
                      fontSize: Dimensions.fontSizeOverSmall,
                      color: Theme.of(context).disabledColor)),
            ),
          ),
          Expanded(
              flex: 3,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: listOfOffertsAccepted.length,
                itemBuilder: (BuildContext context, int childIdx) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_DEFAULT,
                          right: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Card(
                        color: Colors.white,
                        borderOnForeground: true,
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom:
                                            Dimensions.PADDING_SIZE_OVER_SMALL,
                                        right: Dimensions.PADDING_SIZE_DEFAULT),
                                    child: Text(
                                        '${listOfOffertsAccepted[childIdx].postName}',
                                        style: const TextStyle(
                                          fontFamily: 'PTSerif',
                                          fontSize: Dimensions.fontSizeSmall,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ))),
                              ),
                              subtitle: Text(
                                  '${listOfOffertsAccepted[childIdx].startAt}'
                                      .toUpperCase(),
                                  style: robotoMedium.copyWith(
                                      fontSize: Dimensions.fontSizeOverSmall,
                                      color: Colors.red)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 16.0),
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          color: Color(0xffefefef),
                                        ),
                                        child: Text(
                                            listOfOffertsAccepted[childIdx]
                                                        .postName ==
                                                    'Server'
                                                ? 'Serveur'
                                                : 'Cuisinier',
                                            style: robotoMedium.copyWith(
                                                fontSize: Dimensions
                                                    .fontSizeOverSmall,
                                                color: Color(0xff9a9a9a))),
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: RichText(
                                            text: TextSpan(
                                                text:
                                                    '${listOfOffertsAccepted[childIdx].buyPrice}${String
                                                                .fromCharCodes(
                                                            Runes(
                                                                '\u0024'))} /H',
                                                style: robotoMedium.copyWith(
                                                    fontSize: Dimensions
                                                        .fontSizeOverSmall,
                                                    color: const Color(
                                                        0xff9a9a9a)),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: ' + ${listOfOffertsAccepted[childIdx].bonus}${String
                                                                  .fromCharCodes(
                                                              Runes(
                                                                  '\u0024'))} /H',
                                                      style: robotoMedium.copyWith(
                                                          fontSize: Dimensions
                                                              .fontSizeOverSmall,
                                                          color: const Color(
                                                              0xff5ed369)),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              // navigate to desired screen
                                                            })
                                                ]),
                                          ),
                                        ))),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                              '${listOfOffertsAccepted[childIdx].startAt}'
                                                  .toUpperCase(),
                                              style: robotoMedium.copyWith(
                                                  fontSize: Dimensions
                                                      .fontSizeOverSmall,
                                                  color: Colors.red)))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              )),
          Padding(
            padding: const EdgeInsets.only(
                top: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                left: Dimensions.PADDING_SIZE_DEFAULT,
                right: Dimensions.PADDING_SIZE_DEFAULT),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Shifts à venir".toUpperCase(),
                  style: robotoMedium.copyWith(
                      fontSize: Dimensions.fontSizeOverSmall,
                      color: Theme.of(context).disabledColor)),
            ),
          ),
          Expanded(
              flex: 6,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: listOfOffertsWaiting.length,
                itemBuilder: (BuildContext context, int childIdx) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_DEFAULT,
                          right: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Card(
                        color: Colors.white,
                        borderOnForeground: true,
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom:
                                            Dimensions.PADDING_SIZE_OVER_SMALL,
                                        right: Dimensions.PADDING_SIZE_DEFAULT),
                                    child: Text(
                                        '${listOfOffertsWaiting[childIdx].postName}',
                                        style: const TextStyle(
                                          fontFamily: 'PTSerif',
                                          fontSize: Dimensions.fontSizeSmall,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ))),
                              ),
                              subtitle: Text(
                                  '${listOfOffertsWaiting[childIdx].startAt}'
                                      .toUpperCase(),
                                  style: robotoMedium.copyWith(
                                      fontSize: Dimensions.fontSizeOverSmall,
                                      color: Color(0xff6d7278))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 16.0),
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          color: Color(0xffefefef),
                                        ),
                                        child: Text(
                                            listOfOffertsWaiting[childIdx]
                                                        .postName ==
                                                    'Server'
                                                ? 'Serveur'
                                                : 'Cuisinier',
                                            style: robotoMedium.copyWith(
                                                fontSize: Dimensions
                                                    .fontSizeOverSmall,
                                                color: Color(0xff9a9a9a))),
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: RichText(
                                            text: TextSpan(
                                                text:
                                                    '${listOfOffertsWaiting[childIdx].buyPrice}' +
                                                        new String
                                                                .fromCharCodes(
                                                            new Runes(
                                                                '\u0024')) +
                                                        ' /H',
                                                style: robotoMedium.copyWith(
                                                    fontSize: Dimensions
                                                        .fontSizeOverSmall,
                                                    color: const Color(
                                                        0xff9a9a9a)),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: ' + ${listOfOffertsWaiting[childIdx].bonus}' +
                                                          new String
                                                                  .fromCharCodes(
                                                              new Runes(
                                                                  '\u0024')) +
                                                          ' /H',
                                                      style: robotoMedium.copyWith(
                                                          fontSize: Dimensions
                                                              .fontSizeOverSmall,
                                                          color: const Color(
                                                              0xff5ed369)),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              // navigate to desired screen
                                                            })
                                                ]),
                                          ),
                                        ))),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 16.0),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                              '${listOfOffertsWaiting[childIdx].startAt}'
                                                  .toUpperCase(),
                                              style: robotoMedium.copyWith(
                                                  fontSize: Dimensions
                                                      .fontSizeOverSmall,
                                                  color: Color(0xff9a9a9a))))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              )),
        ],
      );
    } else {
      return Container(
        child: Center(
            child: Text(
                'undifined index..\n just search item working right now\n\n\n\n Regards!')),
      );
    }
  }
}
