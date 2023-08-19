import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

// Text('Distance: ${twoDistance.toStringAsFixed(2)}m') 사용 가능가능

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
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
              onPressed: () {
                // 더보기 버튼 눌렀을 때 동작
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // SizedBox(
            //   height: 30,
            // ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 10.0),
            //   color: Colors.white,
            //   height: 60.0, // 원하는 높이를 설정하세요.
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       IconButton(
            //         icon: Icon(Icons.arrow_back, color: Colors.black),
            //         onPressed: () {
            //           // 왼쪽 버튼 액션
            //         },
            //       ),
            //       Image.asset(
            //         'assets/reallogo.png',
            //         // height: 50, // 높이 설정
            //         width: 130, // 너비 설정
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.more_vert, color: Colors.black),
            //         onPressed: () {
            //           // 오른쪽 버튼 액션
            //         },
            //       ),
            //     ],
            //   ),
            // ),
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
                      zoom: 14.0,
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
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Current Location",style: TextStyle(fontSize: 14),),
                        Icon(Icons.arrow_right_alt_rounded,size: 30,)
                      ],
                    )
                    ,SizedBox(height: 8,),
                     Align(
      alignment: Alignment.centerRight,
      child: Text(
        selectedPlace,
        style: TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
                    SizedBox(height: 10,),
                    Text('Distance between current location and restaurants',style: TextStyle(
                      color: Color(0xff7C7D82),fontSize: 13
                    ),),
                                        SizedBox(height: 12,),

                    Row(
                      children: [
                        Icon(Icons.circle,color: Color(0xff5984DA),size:12),SizedBox(width: 8,),Text("${twoDistance.toStringAsFixed(2)} m",style: TextStyle(
                          fontSize: 15,fontWeight: FontWeight.bold
                        ),)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
