import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './earthquakes.dart';
import '../../network/fetch_earthquakes.dart';
import '../network/features/feature_collection_dto.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([fetchEarthquakes(http.Client())]),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading Earthquakes:\n\n${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var fetched = snapshot.data![0].features;
            return RefreshIndicator(
                onRefresh: () {
                  final Future<FeatureCollectionDto> future =
                      fetchEarthquakes(http.Client());
                  future.then((refreshed) => fetched = refreshed.features);
                  return future;
                },
                child: Earthquakes(
                  features: fetched,
                ));
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
