import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';

import 'location_search.dart';

const kGoogleApiKey =
    "AIzaSyAgEZrJpsRSZh5k12D7FHbMRdW7daqCnI8"; // 여기에 실제 Google API 키를 입력하세요.

void main() => runApp(CurrentLocation());

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  GoogleMapController? _controller;
  LatLng? _selectedPosition;
  LatLng? _userPosition;
  final _searchController = TextEditingController();
  final _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
  List<Prediction>? _predictions;
  CameraPosition? _initialCameraPosition;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  _determinePosition() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _userPosition = LatLng(position.latitude, position.longitude);
      _initialCameraPosition =
          CameraPosition(target: _userPosition!, zoom: 15.0);
    });
  }

// 구글맵 가져오기
  Widget _googleMap() {
    return Expanded(
      child: FutureBuilder<Position>(
        future: Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('위치 정보를 가져오는데 오류가 발생했습니다.'));
            }

            _userPosition =
                LatLng(snapshot.data!.latitude, snapshot.data!.longitude);
            return Container(
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
                  onMapCreated: (controller) {
                    _controller = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _userPosition!,
                    zoom: 14.0,
                  ),
                  markers: {
                    if (_userPosition != null)
                      Marker(
                          markerId: MarkerId('user'),
                          position: _userPosition!,
                          infoWindow: InfoWindow(title: "Your Location")),
                    if (_selectedPosition != null)
                      Marker(
                        markerId: MarkerId('selected'),
                        position: _selectedPosition!,
                      )
                  },
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(13.0,0,0,0),
              child: Align(
                
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/reallogo.png',
                  // height: 50, // 높이 설정
                  width: 130, // 너비 설정
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () async {
                    // Navigator 사용
                    final selectedPosition = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LocationSearch(
                          placesClient: _places,
                          userPosition: _userPosition!,
                        ),
                      ),
                    );

                    if (selectedPosition != null) {
                      setState(() {
                        _selectedPosition = selectedPosition;
                      });
                      await _getUserLocation();
                      _calculateDistance();
                    }
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), // 둥근 테두리 설정
                        border: Border.all(
                          // 테두리 설정
                          color: Color(0xffA9A0A0),
                          width: 1,
                        )),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset(
                          'assets/magnifyingglass.svg',
                          height: 20, // 높이 설정
                          width: 20, // 너비 설정
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Search for restaurants",
                          style: TextStyle(color: Color(0xffA9A0A0)),
                        )
                      ],
                    ),
                  ),
                )

                // TextField(
                //   controller: _searchController,
                //   decoration: InputDecoration(hintText: '검색어 입력...'),
                // ),

                ),
            if (_predictions != null)
              Expanded(
                child: ListView.builder(
                  itemCount: _predictions!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_predictions![index].description!),
                      onTap: () async {
                        var detail = await _places
                            .getDetailsByPlaceId(_predictions![index].placeId!);
                        var location = detail.result.geometry!.location;
                        setState(() {
                          _selectedPosition =
                              LatLng(location.lat, location.lng);
                          _predictions = null; // 목록 숨기기
                        });
                        await _getUserLocation();
                        _calculateDistance();
                      },
                    );
                  },
                ),
              ),
            SizedBox(
              height: 20,
            ),
            _googleMap(),
            if (_userPosition != null && _selectedPosition != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Distance: ${_calculateDistance()}m',
                  style: TextStyle(fontSize: 20),
                ),
              )
          ],
        ),
      ),
    );
  }

// 지역 검색하는 것
  Future<void> _searchPlaces() async {
    if (_searchController.text.isNotEmpty) {
      var results = await _places.autocomplete(_searchController.text);
      setState(() {
        _predictions = results.predictions;
      });
    }
  }

// 현재 위치 가져오기
  Future<void> _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _userPosition = LatLng(position.latitude, position.longitude);
    });
  }

// 선택한 위치와 현재 위치의 거리 계산
  double _calculateDistance() {
    return Geolocator.distanceBetween(
      _userPosition!.latitude,
      _userPosition!.longitude,
      _selectedPosition!.latitude,
      _selectedPosition!.longitude,
    );
  }
}
