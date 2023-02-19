import 'package:flutter/material.dart';

import '../bloc/features_bloc.dart';
import '../network/fetch_1hr_earthquakes.dart';
import '../network/fetch_1wk_earthquakes.dart';
import 'earthquakes.dart';

class Tabs extends StatefulWidget {
  const Tabs({
    super.key,
  });

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late FeaturesBLoC firstTabBloC;
  late FeaturesBLoC secondTabBloC;

  int rerenderCurrentSnapLength = 0;

  @override
  void initState() {
    super.initState();

    firstTabBloC = FeaturesBLoC(fetch1hrEarthquakes, '1hrEarthquakes');
    firstTabBloC.item$.listen((event) {
      setState(() {
        rerenderCurrentSnapLength = rerenderCurrentSnapLength + 1;
      });
    });

    secondTabBloC = FeaturesBLoC(fetch1wkEarthquakes, '1wkEarthquakes');
    secondTabBloC.item$.listen((event) {
      setState(() {
        rerenderCurrentSnapLength = rerenderCurrentSnapLength + 1;
      });
    });
  }

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
                text: '${firstTabBloC.currentSnapLength ?? '??'}'
                    '/Hour (all)',
              ),
              horizontalTab(
                // icon: const Icon(Icons.checklist),
                text: '${secondTabBloC.currentSnapLength ?? '??'}'
                    '/Week (> 4.5mag)',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Earthquakes(
              featuresBLoC: firstTabBloC,
            ),
            Earthquakes(
              featuresBLoC: secondTabBloC,
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
