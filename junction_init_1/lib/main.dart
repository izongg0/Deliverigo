import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:junction_init_1/current_location.dart';

import 'Calculate.dart';
import 'EnterCalorie.dart';
import 'Loading.dart';
import 'Result.dart';
import 'SecondLoading.dart';
import 'location_search.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),

        '/a': (context) => SecondLoading(),
        '/current': (context) => CurrentLocation(),
        // '/e': (context) => EnterCalorie(),
        // '/f': (context) => Calculate(),
        // '/g': (context) => Result(),
      },
    );
  }
}

