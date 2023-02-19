import 'dart:async';

import 'request_to_stream.dart';

class Refresher<P, T> {
  late RequestToStream<P, T> requestToStream;

  Refresher(this.requestToStream);

  Future<P> refresh([int seconds = 10]) {
    final Future<P> future = requestToStream.fetch();
    if (seconds > 0) {
      future.then((refreshed) {
        endlessAutoRefresh(seconds);
      });
    }
    return future;
  }

  Timer? autoRefreshTimer;
  endlessAutoRefresh(int seconds) {
    // https://stackoverflow.com/questions/51791501/how-to-debounce-textfield-onchange-in-dart
    if (autoRefreshTimer?.isActive ?? false) autoRefreshTimer?.cancel();
    autoRefreshTimer = Timer(Duration(seconds: seconds), () {
      requestToStream.fetch();
    });
  }
}
