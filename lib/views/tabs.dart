import 'package:LastHourEarthquakes/network/dto/feature_collection_dto.dart';
import 'package:flutter/material.dart';

import '../network/dto/feature_dto.dart';
import 'earthquakes.dart';

class Tabs extends StatelessWidget {
  final List<FeatureDto> hourly_all;
  final Future<FeatureCollectionDto> Function() hourlyFetcher;

  final List<FeatureDto> weekly_45mag;
  final Future<FeatureCollectionDto> Function() weeklyFetcher;

  Tabs({
    required this.hourly_all,
    required this.hourlyFetcher,
    required this.weekly_45mag,
    required this.weeklyFetcher,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Last Earthquakes'),
          bottom: TabBar(
            tabs: [
              horizontalTab(
                // icon: const Icon(Icons.supervised_user_circle),
                text: '${hourly_all.length} Past Hour (all)',
              ),
              horizontalTab(
                // icon: const Icon(Icons.checklist),
                text: '${weekly_45mag.length} Past Week (> 4.5mag)',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Earthquakes(
              initial: hourly_all,
              fetchSlice: hourlyFetcher,
            ),
            Earthquakes(
              initial: weekly_45mag,
              fetchSlice: weeklyFetcher,
            ),
          ],
        ),
      ),
    );
  }
}

horizontalTab({Icon? icon, required String text}) {
  return SizedBox(
      height: 45,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...(icon != null) ? [icon, const SizedBox(width: 12)] : [],
          Text(text)
        ],
      ));
}
