import 'package:flutter/material.dart';

import '../bloc/features_bloc.dart';
import '../network/dto/feature_dto.dart';

class TabLabel extends StatelessWidget {
  final FeaturesBLoC featuresBLoC;
  final String text;
  final Icon? icon;

  const TabLabel({
    required this.featuresBLoC,
    required this.text,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: featuresBLoC.item$,
        builder:
            (BuildContext context, AsyncSnapshot<List<FeatureDto>> snapshot) {
          if (snapshot.hasError) {
            return Text('There was an error : ${snapshot.error}');
          }

          final List<FeatureDto> quakes = snapshot.data ?? [];
          final withCounter = text.replaceAll('#currentSnapLength#',
              snapshot.data != null ? quakes.length.toString() : "??");

          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.done:
              return horizontalTab(
                icon: icon,
                text: withCounter,
              );
          }
        });
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
