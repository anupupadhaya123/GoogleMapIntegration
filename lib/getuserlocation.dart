import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserCurrentLocation extends StatefulWidget {
  const GetUserCurrentLocation({super.key});

  @override
  State<GetUserCurrentLocation> createState() => _GetUserCurrentLocationState();
}

class _GetUserCurrentLocationState extends State<GetUserCurrentLocation> {

    final Completer<GoogleMapController> _controller = Completer();

    static CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(27.6618008, 83.171761),
      zoom: 14
      );

    final List<Marker> _markers = <Marker>[
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(27.6618008, 83.171761),
        infoWindow: InfoWindow(
          title: "The title of the markers"
        )
        )
    ];

    loadData() {
      GetUserCurrentLocation().then((value)async {
              print("My current Location");
              print(value.latitude.toString()+ '' + value.longitude.toString());

              _markers.add(
                Marker(
                  markerId: MarkerId('2'),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(title: "Current Location"),
                )
                );
                CameraPosition cameraPosition = CameraPosition(
                  zoom: 14,
                  target: LatLng(value.latitude, value.longitude)
                );

                final GoogleMapController controller = await _controller.future;

                controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {
                  
                });
            
            });
    }

    Future<Position> GetUserCurrentLocation() async{
      await Geolocator.requestPermission().then((value){
        
      }).onError((error, stackTrace) {
        print("error" + error.toString());
      });

      return await Geolocator.getCurrentPosition();
      
    }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        }),

        floatingActionButton: FloatingActionButton(
          onPressed: ()async {
            loadData();
          },
        ),

      
    );
  }
}