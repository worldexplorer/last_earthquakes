import 'package:flutter/material.dart';

import '../network/features/feature_dto.dart';
import '../network/features/properties_dto.dart';

class Earthquakes extends StatefulWidget {
  const Earthquakes({
    required this.features,
    super.key,
  });

  final List<FeatureDto> features;

  @override
  State<Earthquakes> createState() => _EarthquakesState();
}

class _EarthquakesState extends State<Earthquakes>
    with AutomaticKeepAliveClientMixin<Earthquakes> {
  final Map<String, PropertiesDto> _placesSelected = {};

  void _toggleUserSelected(PropertiesDto props) {
    setState(() {
      if (_placesSelected.containsKey(props.ids)) {
        _placesSelected.remove(props.ids);
      } else {
        _placesSelected.putIfAbsent(props.ids, () => props);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Last Hour Earthquakes'),
      ),
      body: ListView.separated(
        itemCount: widget.features.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1),
        itemBuilder: (context, index) {
          final feature = widget.features[index];
          final mag = '${feature.properties.mag}';
          final subtitle =
              '${feature.properties.mag} ${feature.properties.magType}'
              ' ${feature.properties.type}'
              ', ${feature.geometry.coordinates[2]} km deep';

          final time =
              DateTime.fromMillisecondsSinceEpoch(feature.properties.time);
          // DateFormat('EEE, d MMMM yyyy').format(time)
          final ago = timeAgoSinceDate(time);

          return ListTile(
            key: Key('feature_${feature.id}'),
            leading: CircleAvatar(
              child: Text(mag),
            ),
            title: Text(feature.properties.place),
            subtitle: Text(subtitle),
            selectedTileColor: Colors.lightBlueAccent,
            onTap: () => _toggleUserSelected(feature.properties),
            selected: _placesSelected.containsKey(feature.properties.ids),
            trailing: Text(ago),
          );
        },
      ),
    );
  }

  // https://stackoverflow.com/questions/49087703/preserving-state-between-tab-view-pages
  @override
  bool get wantKeepAlive => true;
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
    return '${difference.inDays} days ago';
  } else if (difference.inDays >= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} hours ago';
  } else if (difference.inHours >= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
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
