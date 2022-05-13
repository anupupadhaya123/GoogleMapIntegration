import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Completer<GoogleMapController> _controller = Completer();
  

   static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(27.6618008, 83.171761),
    zoom: 13,
  );

  List<Marker> _marker = [

  ];

  List<Marker> _list = [

    //Marrking Position

    Marker(
      markerId: MarkerId("1"),
      position: LatLng(27.6618008, 83.171761),
      infoWindow: InfoWindow(
      title: "My Current Position"

      )
      ),

      //Multiple Market Position
      //Just copy and make new positions
      
      Marker(
      markerId: MarkerId("2"),
      position: LatLng(27.65, 83.16),
      infoWindow: InfoWindow(
      title: "My Reliable Position"

      )
      ),
       Marker(
      markerId: MarkerId("3"),
      position: LatLng(27.64, 83.15),
      infoWindow: InfoWindow(
      title: "My Reliable Position"

      )
      ),
       Marker(
      markerId: MarkerId("4"),
      position: LatLng(27.66, 83.16),
      infoWindow: InfoWindow(
      title: "My Reliable Position"

      )
      ),
       Marker(
      markerId: MarkerId("5"),
      position: LatLng(27.66, 83.162),
      infoWindow: InfoWindow(
      title: "My Reliable Position"

      ),

      ),

       Marker(
      markerId: MarkerId("5"),
      position: LatLng(35.652832, 139.839478),
      infoWindow: InfoWindow(
      title: "Japan"

      ),
      
      ),
  ];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //For GPS System
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching_sharp),
        onPressed: () async{
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(35.652832, 139.839478),
              zoom: 14
            )
          ));
          setState(() {
            
          });
        },
      ),
      appBar: AppBar(
        title: Text("Google Map Execution"),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker), 
          mapType: MapType.normal,
         
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}