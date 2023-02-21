import 'package:LastHourEarthquakes/network/fetch_1wk_earthquakes.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../network/dto/feature_collection_dto.dart';
import '../network/dto/feature_dto.dart';
import '../network/fetch_1hr_earthquakes.dart';

abstract class Request {}

class HourlyRequest extends Request {}

class WeeklyRequest extends Request {}

class NetworkPoll<P, T> {
  Future<P>? request;
  T? items;

  NetworkPoll({this.request, this.items});
}

class NetworkRepo
    extends Bloc<Request, NetworkPoll<FeatureCollectionDto, List<FeatureDto>>> {
  NetworkRepo() : super(NetworkPoll()) {
    on<HourlyRequest>(
      (HourlyRequest event,
          Emitter<NetworkPoll<FeatureCollectionDto, List<FeatureDto>>>
              emit) async {
        final Future<FeatureCollectionDto> request = fetch1hrEarthquakes();
        emit(NetworkPoll(request: request));
        final FeatureCollectionDto response = await request;
        emit(NetworkPoll(request: request, items: response.features));
      },
      transformer: sequential(),
    );
    on<WeeklyRequest>(
      (WeeklyRequest event,
          Emitter<NetworkPoll<FeatureCollectionDto, List<FeatureDto>>>
              emit) async {
        final Future<FeatureCollectionDto> request = fetch1wkEarthquakes();
        emit(NetworkPoll(request: request));
        final FeatureCollectionDto response = await request;
        emit(NetworkPoll(request: request, items: response.features));
      },
      transformer: sequential(),
    );
  }
}
