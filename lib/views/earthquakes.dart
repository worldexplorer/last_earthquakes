import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/network_repo.dart';
import '../network/dto/feature_collection_dto.dart';
import '../network/dto/feature_dto.dart';
import '../network/dto/properties_dto.dart';
import '../utils/heatmap.dart';
import '../utils/selectable.dart';
import '../utils/timeago.dart';

class Earthquakes extends StatefulWidget {
  final Request Function() getEndPoint;
  final List<FeatureDto>? initial;

  const Earthquakes({
    required this.getEndPoint,
    this.initial,
    super.key,
  });

  @override
  State<Earthquakes> createState() => _EarthquakesState();
}

class _EarthquakesState extends State<Earthquakes>
    with
        AutomaticKeepAliveClientMixin<Earthquakes>,
        Selectable<Earthquakes, PropertiesDto> {
  // @override
  // void initState() {
  //   super.initState();
  //   widget.fetchFn();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NetworkRepo,
              NetworkPoll<FeatureCollectionDto, List<FeatureDto>>>(
          // bloc: widget.fetchFn(),
          builder: (BuildContext context,
              NetworkPoll<FeatureCollectionDto, List<FeatureDto>> poll) {
        // RefreshIndicator(
        //     onRefresh: widget.featuresBLoC.refresher.refresh,
        //     child: builder
        if (poll.items == null) {
          return Center(
              child: poll.request == null
                  ? const Text("Not Yet Requested")
                  : const Text("Requested"));
        }

        return renderList(poll.items!, itemsSelected, toggleSelected);
      }
          // )
          ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              final repo = context.read<NetworkRepo>();
              final request = widget.getEndPoint();
              repo.add(request);
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }

  // https://stackoverflow.com/questions/49087703/preserving-state-between-tab-view-pages
  @override
  bool get wantKeepAlive => true;
}

Widget renderList(
    List<FeatureDto> items,
    Map<String, PropertiesDto> itemsSelected,
    void Function(String key, PropertiesDto props) toggleSelected) {
  return ListView.separated(
    itemCount: items.length,
    itemBuilder: (context, index) {
      final feature = items[index];
      final quake = feature.properties;
      final mag = quake.mag.toStringAsFixed(1);

      final subtitle = '${quake.mag.toStringAsFixed(2)} ${quake.magType}'
          ' ${quake.type}'
          ', ${feature.geometry.depth.toStringAsFixed(2)} km deep';

      final time = DateTime.fromMillisecondsSinceEpoch(quake.time);
      // DateFormat('EEE, d MMMM yyyy').format(time)
      final ago = timeAgoSinceDate(time);

      return ListTile(
        key: Key('feature_${feature.id}'),
        leading: CircleAvatar(
          foregroundColor: Colors.white,
          backgroundColor: heatMap(quake.mag).withOpacity(0.65),
          child: Text(mag),
        ),
        title: Text(quake.place),
        subtitle: Text(subtitle),
        selectedTileColor: Colors.lightBlueAccent,
        onTap: () => toggleSelected(quake.ids, quake),
        selected: itemsSelected.containsKey(quake.ids),
        trailing: Text(ago),
      );
    },
    separatorBuilder: (BuildContext context, int index) =>
        const Divider(height: 1),
  );
}
