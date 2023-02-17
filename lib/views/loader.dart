import 'package:LastHourEarthquakes/network/fetch_1wk_earthquakes.dart';
import 'package:flutter/material.dart';

import '../../network/fetch_1hr_earthquakes.dart';
import 'tabs.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([fetch1hrEarthquakes(), fetch1wkEarthquakes()]),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading Earthquakes:\n\n${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return Tabs(
              hourly_all: snapshot.data![0].features,
              hourlyFetcher: fetch1hrEarthquakes,
              weekly_45mag: snapshot.data![1].features,
              weeklyFetcher: fetch1wkEarthquakes,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
