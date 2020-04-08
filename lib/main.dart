import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_follow/screens/home_screen.dart';
import 'package:map_follow/services/geolocator_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => GeolocatorService.getInitialPosition(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<Position>(
          builder: (context, position, widget) {
            return position != null
                ? HomeScreen(
                    initialPostion: position,
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
