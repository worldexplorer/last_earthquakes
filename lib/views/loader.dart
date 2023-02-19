import 'package:bloc_rest_api/bloc_rest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/dto/feature_collection_dto.dart';
import '../network/fetch_1hr_earthquakes.dart';
import '../network/fetch_1wk_earthquakes.dart';
import 'tabs.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RequestCubit<FeatureCollectionDto>,
          RequestState<FeatureCollectionDto>>(
        listener:
            (BuildContext context, RequestState<FeatureCollectionDto> state) {
          if (state.status == RequestStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'UNKNOWN_FAILURE')),
            );
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case RequestStatus.empty:
              return const Center(
                  child: Text("Press the button to get some data"));

            case RequestStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case RequestStatus.success:
              return Tabs(
                hourly_all: state.model!.features,
                hourlyFetcher: fetch1hrEarthquakes,
                weekly_45mag: const [],
                weeklyFetcher: fetch1wkEarthquakes,
              );

            case RequestStatus.failure:
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(state.model.toString()),
                ),
              );

            default:
              return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<RequestCubit<FeatureCollectionDto>>()
              .request(fetch1hrEarthquakes());
          // context.read<RequestCubit<PostModel>>().getRequest(
          //   handle: 'posts/1',
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
