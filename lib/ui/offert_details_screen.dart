import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_tech/controller/offert_details_controller.dart';

import '../util/dimensions.dart';
import '../util/style.dart';

class OffertDetailsScreen extends StatefulWidget {
  const OffertDetailsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OffertDetailsScreenState();
  }
}

class _OffertDetailsScreenState extends State<OffertDetailsScreen> {
  var data = Get.find<OffertsDetailsController>().data;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final String imgUrl = 'IMAGE URL NOT FOUND IN JSON';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 35.0,
          icon: const Icon(Icons.arrow_circle_left, color: Colors.black),
          onPressed: () => {Get.back()},
        ),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(imgUrl),
          ),
          SizedBox(
            height: 18,
          ),
          Text(data.postName,
              style: const TextStyle(
                fontFamily: 'PTSerif',
                fontSize: Dimensions.fontSizeExtraLarge,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              )),

          Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30.0, left: 16.0, bottom: 5.0),
                //    padding: const EdgeInsets.only(right: 16.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            '${data.startAt}'
                                .toUpperCase(),
                            style: robotoMedium.copyWith(
                                fontSize: Dimensions
                                    .fontSizeOverSmall,
                                color: Colors.red)))),
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
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xffefefef),
                      ),
                      child: Text(
                          data.postName == 'Server' ? 'Serveur' : 'Cuisinier',
                          style: robotoMedium.copyWith(
                              fontSize: Dimensions.fontSizeOverSmall,
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
                                '${data.buyPrice}${String.fromCharCodes(Runes('\u0024'))} /H',
                            style: robotoMedium.copyWith(
                                fontSize: Dimensions.fontSizeOverSmall,
                                color: const Color(0xff9a9a9a)),
                          ),
                        ),
                      ))),
              Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${data.startAt}'.toUpperCase(),
                            style: robotoMedium.copyWith(
                                fontSize: Dimensions.fontSizeOverSmall,
                                color: const Color(0xff9a9a9a))))),
              ),
            ],
          ),
                Column(

                  children: [
                  _buildRowDetails(Icons.place_outlined, "${data.latitude}, ${data.latitude}"),
                  _buildRowDetails(Icons.currency_exchange,'Bonus au travailleur: ${data.bonus}${String
                      .fromCharCodes(
                      Runes(
                          '\u0024'))} /H'),
                  _buildRowDetails(Icons.pause_circle_outline,'Pause de 30 minutes'),
                  _buildRowDetails(Icons.panorama_fisheye_sharp,'Stationnement gratuit'),
                  _buildRowDetails(Icons.info_outline,'Pantalon noir,chemise noir'),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            margin: EdgeInsets.all(16.0),
                            child: Column(
                      children: const <Widget>[
                        Text('RESPONSABLE',
                            style: TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.normal)),
                      Text('  Gergorie Kovlaks',
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.normal))
                      ],
                    )))
                ],)
              ]),
          Container(
              width: width,
              margin: const EdgeInsets.only(bottom: 16, left: 16, top: 32, right: 16),
              child: Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: RaisedButton(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              textColor: Colors.white,
              color: Colors.blueAccent,
              child: Text("Postuler"),
              onPressed: () {},
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ))
         // ),
        ],
      ),)
      //   )
    );
  }

  Widget _buildRowDetails(var _icon, String text) => Align(
  alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          IconButton(
            iconSize: 35.0,
            icon: Icon(_icon, color: Colors.black),
            onPressed: () => {Navigator.pop(context)},
          ),
          Text(text.toUpperCase(),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal))
        ],
      )
  );
}
