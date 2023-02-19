import '../network/dto/feature_collection_dto.dart';
import '../network/dto/feature_dto.dart';
import 'refresher.dart';
import 'request_to_stream.dart';

class FeaturesBLoC extends RequestToStream<FeatureCollectionDto, FeatureDto> {
  late Refresher<FeatureCollectionDto, FeatureDto> refresher;

  static List<FeatureDto> Function(FeatureCollectionDto promise)
      get futuresFromCollection => (promise) => promise.features;

  FeaturesBLoC(fetchSlice, ident)
      : super(fetchSlice, futuresFromCollection, ident) {
    refresher = Refresher(this);
  }
}
