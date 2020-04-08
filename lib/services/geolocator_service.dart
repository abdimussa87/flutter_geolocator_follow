import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  static Geolocator geoLocator = Geolocator();
   static var  locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  
  static Future<Position> getInitialPosition() async {
    return await geoLocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  static Stream<Position> getCurrentPosition() {
    return geoLocator.getPositionStream(locationOptions);
  }
}
