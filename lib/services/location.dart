import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationService {
  Future<LocationPermission> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  Future<LatLng?> currentLocation() async {
    LocationPermission permission = await requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      return LatLng(position.latitude, position.longitude);
    } else {
      return null;
    }
  }

  double calcDistance(LatLng userLocation, LatLng placeLocation) {
    const distance = Distance();
    return distance.as(LengthUnit.Meter, userLocation, placeLocation);
  }
}
