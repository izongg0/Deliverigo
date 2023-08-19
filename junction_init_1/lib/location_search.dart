import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geolocator/geolocator.dart';
import 'location_distance.dart';

class LocationSearch extends StatefulWidget {
  final GoogleMapsPlaces placesClient;
  final LatLng userPosition;

  LocationSearch({required this.placesClient, required this.userPosition});

  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  final _searchController = TextEditingController();
  List<Prediction>? _predictions;
  LatLng? _selectedPosition;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xffA9A0A0),
                    width: 1,
                  )),
              child: Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff847878),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration:
                          InputDecoration(hintText: 'Search for location...'),
                      onChanged: (value) => _searchPlaces(),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/Close.svg',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ),
          if (_predictions != null)
            Expanded(
              child: ListView.builder(
                itemCount: _predictions!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'assets/pick.png',
                          height: 22,
                          width: 22,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: Text(_predictions![index].description!)),
                      ],
                    ),
                    onTap: () async {
                      var detail = await widget.placesClient
                          .getDetailsByPlaceId(_predictions![index].placeId!);
                      var location = detail.result.geometry!.location;
                      setState(() {
                        _selectedPosition = LatLng(location.lat, location.lng);
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DistanceDetail(
                              userPosition: widget.userPosition,
                              selectedPosition: _selectedPosition!,
                              twoDistance: _calculateDistance(),
                              selectedPlace: _predictions![index].description!),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  _searchPlaces() async {
    if (_searchController.text.isNotEmpty) {
      var results =
          await widget.placesClient.autocomplete(_searchController.text);
      setState(() {
        _predictions = results.predictions;
      });
    }
  }

  double _calculateDistance() {
    return Geolocator.distanceBetween(
      widget.userPosition.latitude,
      widget.userPosition.longitude,
      _selectedPosition!.latitude,
      _selectedPosition!.longitude,
    );
  }
}
