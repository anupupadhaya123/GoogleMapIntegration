import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({super.key});

  @override
  State<ConvertLatLangToAddress> createState() =>
      _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {

  String stAddress = '';
  String stAd = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(stAddress),
          Text(stAd),
          GestureDetector(
            onTap: () async {


              //From address to cordinates
              List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
             

              //Getting address from coordinates
              List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);

              
                  setState(() {
                    stAddress = locations.last.longitude.toString() + " "+ locations.last.latitude.toString();
                    stAd = placemarks.reversed.last.country.toString() + " "+ placemarks.reversed.last.name.toString();
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.green),
                height: 50,
                child: Center(
                  child: Text("Convert"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
