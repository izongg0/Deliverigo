import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junction_init_1/EnterCalorie.dart';

class DistanceDetail extends StatelessWidget {
  final LatLng userPosition;
  final LatLng selectedPosition;
  final double twoDistance;
  final String selectedPlace;

  DistanceDetail(
      {required this.userPosition,
      required this.selectedPosition,
      required this.twoDistance,
      required this.selectedPlace});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffFFFFFF),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff847878),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Center(
            child: Image.asset(
              'assets/reallogo.png',
              width: 140,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, color: Color(0xff847878)),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23.0),
                    topRight: Radius.circular(23.0),
                  ),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: selectedPosition,
                      zoom: 16.0,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('userPosition'),
                        position: userPosition,
                        infoWindow: InfoWindow(title: 'User Position'),
                      ),
                      Marker(
                        markerId: MarkerId('selectedPosition'),
                        position: selectedPosition,
                        infoWindow: InfoWindow(title: 'Selected Position'),
                      ),
                    },
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(
                      //   "Current Location",
                      //   style: TextStyle(fontSize: 16),
                      // ),
                      // Icon(
                      //   Icons.arrow_downward_outlined,
                      //   size: 30,
                      // ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          //   Image.asset(
                          //   'assets/pick.png',
                          //   height: 22,
                          //   width: 22,
                          // ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 330,
                            child: Text(
                              selectedPlace,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Distance between current location and restaurants',
                        style:
                            TextStyle(color: Color(0xff7C7D82), fontSize: 13),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle,
                              color: Color(0xff5984DA), size: 12),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${twoDistance.toStringAsFixed(0)} m",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFAC4B),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EnterCalorie(
                                            two_point_Distance: twoDistance),
                                      ));
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
