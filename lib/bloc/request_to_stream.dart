import 'dart:async';

// https://dev.to/offlineprogrammer/flutter-getting-started-with-the-bloc-pattern-streams-http-request-response-1mo3

class RequestToStream<P, T> {
  String ident;

  final StreamController<List<T>> _items = StreamController.broadcast();

  Stream<List<T>> get item$ => _items.stream;
  int? currentSnapLength;

  Future<P> Function() fetchSlice;
  List<T> Function(P promise) promiseToList;

  RequestToStream(this.fetchSlice, this.promiseToList,
      [this.ident = 'UNKNOWN_CONTENT']);

  Future<P> fetch() {
    currentSnapLength = null;
    final Future<P> future = fetchSlice();
    future.then((received) {
      if (_items.hasListener) {
        final List<T> itemsReceived = promiseToList(received);
        currentSnapLength = itemsReceived.length;
        _items.add(itemsReceived);
        // can a stream be re-opened?... I'll keep the stream ACTIVE
        // _items.close();
      } else {
        print('$ident: !_items.hasListener');
      }
    });
    return future;
  }
}
