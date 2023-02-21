import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/network_repo.dart';
import 'earthquakes.dart';
import 'tab_label.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
  });

//   @override
//   State<Tabs> createState() => _TabsState();
// }
//
// class _TabsState extends State<Tabs> {
//   late FeaturesBLoC firstTabBloC;
//   late FeaturesBLoC secondTabBloC;
//
//   @override
//   void initState() {
//     super.initState();
//     firstTabBloC = FeaturesBLoC(fetch1hrEarthquakes, '1hrEarthquakes');
//     secondTabBloC = FeaturesBLoC(fetch1wkEarthquakes, '1wkEarthquakes');
//   }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: BlocProvider(
          create: (_) {
            return NetworkRepo();
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Last Earthquakes'),
              bottom: TabBar(
                tabs: [
                  // TabLabel(
                  //   // icon: const Icon(Icons.supervised_user_circle),
                  //   text: '#currentSnapLength# / Hour (all)',
                  //   featuresBLoC: firstTabBloC,
                  // ),
                  // TabLabel(
                  //   // icon: const Icon(Icons.checklist),
                  //   text: '#currentSnapLength# / Week (> 4.5mag)',
                  //   featuresBLoC: secondTabBloC,
                  // ),
                  horizontalTab(text: '?? / Hour (all)'),
                  horizontalTab(text: '?? / Week (> 4.5mag)'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Earthquakes(getEndPoint: () => HourlyRequest()),
                Earthquakes(getEndPoint: () => WeeklyRequest()),
              ],
            ),
          )),
    );
  }
}
