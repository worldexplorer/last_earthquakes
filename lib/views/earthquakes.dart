import 'package:flutter/material.dart';

import '../bloc/features_bloc.dart';
import '../network/dto/feature_dto.dart';
import '../network/dto/properties_dto.dart';

class Earthquakes extends StatefulWidget {
  final FeaturesBLoC featuresBLoC;
  final List<FeatureDto>? initial;

  const Earthquakes({
    required this.featuresBLoC,
    this.initial,
    super.key,
  });

  @override
  State<Earthquakes> createState() => _EarthquakesState();
}

class _EarthquakesState extends State<Earthquakes>
    with AutomaticKeepAliveClientMixin<Earthquakes> {
  final Map<String, PropertiesDto> _itemsSelected = {};

  void _toggleSelected(PropertiesDto props) {
    setState(() {
      if (_itemsSelected.containsKey(props.ids)) {
        _itemsSelected.remove(props.ids);
      } else {
        _itemsSelected.putIfAbsent(props.ids, () => props);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.featuresBLoC.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: widget.featuresBLoC.refresher.refresh,
          child: StreamBuilder(
              stream: widget.featuresBLoC.item$,
              builder: (BuildContext context,
                  AsyncSnapshot<List<FeatureDto>> snapshot) {
                if (snapshot.hasError) {
                  return Text('There was an error : ${snapshot.error}');
                }

                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());

                  case ConnectionState.active:
                  case ConnectionState.done:
                    final List<FeatureDto> quakes = snapshot.data ?? [];
                    return ListView.separated(
                      itemCount: quakes.length,
                      itemBuilder: (context, index) {
                        final feature = quakes[index];
                        final quake = feature.properties;
                        final mag = quake.mag.toStringAsFixed(1);

                        final subtitle =
                            '${quake.mag.toStringAsFixed(2)} ${quake.magType}'
                            ' ${quake.type}'
                            ', ${feature.geometry.depth.toStringAsFixed(2)} km deep';

                        final time =
                            DateTime.fromMillisecondsSinceEpoch(quake.time);
                        // DateFormat('EEE, d MMMM yyyy').format(time)
                        final ago = timeAgoSinceDate(time);

                        return ListTile(
                          key: Key('feature_${feature.id}'),
                          leading: CircleAvatar(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                heatMap(quake.mag).withOpacity(0.65),
                            child: Text(mag),
                          ),
                          title: Text(quake.place),
                          subtitle: Text(subtitle),
                          selectedTileColor: Colors.lightBlueAccent,
                          onTap: () => _toggleSelected(quake),
                          selected: _itemsSelected.containsKey(quake.ids),
                          trailing: Text(ago),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(height: 1),
                    );
                }
              })),
    );
  }

  // https://stackoverflow.com/questions/49087703/preserving-state-between-tab-view-pages
  @override
  bool get wantKeepAlive => true;
}

Color heatMap(double mag) {
  if (mag < 1) {
    return Colors.grey;
  } else if (mag < 2) {
    return Colors.blueGrey;
  } else if (mag < 3) {
    return Colors.green;
  } else if (mag < 4) {
    return Colors.lightGreen;
  } else if (mag < 5) {
    return Colors.deepOrange.shade300;
  } else if (mag < 6) {
    return Colors.deepOrange;
  } else if (mag < 7) {
    return Colors.redAccent;
  } else if (mag < 8) {
    return Colors.pink;
  } else if (mag < 9) {
    return Colors.pink;
  } else {
    return Colors.purple;
  }
}

String timeAgoSinceDate(DateTime date, {bool numericDates = true}) {
  final date2 = DateTime.now();
  final difference = date2.difference(date);

  if ((difference.inDays / 365).floor() >= 2) {
    return '${(difference.inDays / 365).floor()} years ago';
  } else if ((difference.inDays / 365).floor() >= 1) {
    return (numericDates) ? '1 year ago' : 'Last year';
  } else if ((difference.inDays / 30).floor() >= 2) {
    return '${(difference.inDays / 365).floor()} months ago';
  } else if ((difference.inDays / 30).floor() >= 1) {
    return (numericDates) ? '1 month ago' : 'Last month';
  } else if ((difference.inDays / 7).floor() >= 2) {
    return '${(difference.inDays / 7).floor()} weeks ago';
  } else if ((difference.inDays / 7).floor() >= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if (difference.inDays >= 2) {
    return '${difference.inDays} days';
  } else if (difference.inDays >= 1) {
    return (numericDates) ? '1 day' : 'Yesterday';
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} hrs';
  } else if (difference.inHours >= 1) {
    return (numericDates) ? '1 hr' : 'An hour ago';
  } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} min';
  } else if (difference.inMinutes >= 1) {
    return (numericDates) ? '1 min' : 'A minute ago';
  } else if (difference.inSeconds >= 3) {
    return '${difference.inSeconds} seconds ago';
  } else {
    return 'Just now';
  }
}
