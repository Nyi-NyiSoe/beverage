import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geolocator/geolocator.dart';

final locationProvider = ChangeNotifierProvider<LocationProvider>((ref) {
  return LocationProvider();
});

class LocationProvider extends ChangeNotifier {
   Position? _currentPosition;

  Position? get currentPosition => _currentPosition;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    
    LocationPermission permission = await Geolocator.checkPermission();
    
    try {
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      
      if (permission == LocationPermission.deniedForever) {
        // Handle the case where the user has permanently denied location permission.
        return Future.error('Location permissions are permanently denied');
      }

      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

     
      notifyListeners();
    } catch (e) {
      print("Error getting location: $e");
    }
  }
}
