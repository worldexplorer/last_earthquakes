import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'features/feature_collection_dto.dart';

// https://docs.flutter.dev/cookbook/networking/background-parsing#convert-the-response-into-a-list-of-photos
Future<FeatureCollectionDto> fetchEarthquakes(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson'));

  // await Future.delayed(const Duration(seconds: 3));
  // Use the compute function to run parseEarthquakes in a separate isolate.
  return compute(parseEarthquakes, response.body);
}

// A function that converts a response body into a FeatureCollectionDto.
// https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php
FeatureCollectionDto parseEarthquakes(String responseBody) {
  final parsed = jsonDecode(responseBody);
  final wrapper = FeatureCollectionDto.fromJson(parsed);
  return wrapper;
}
