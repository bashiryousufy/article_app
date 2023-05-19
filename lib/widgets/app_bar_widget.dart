import 'package:article_app/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationAppBar extends StatelessWidget {
  String title;
  LocationAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Provider.of<LocationProvider>(context, listen: false).getLocation();

    return Consumer<LocationProvider>(
      builder: (context, locationProvider, _) {
        var latLong = locationProvider.latLong;
        return AppBar(
          title: Text(title),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(10),
              child: Text('Lat: ${latLong["lat"]} long: ${latLong["long"]}')),
        );
      },
    );
  }
}
