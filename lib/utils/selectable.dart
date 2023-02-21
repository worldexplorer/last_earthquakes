import 'package:flutter/widgets.dart';

mixin Selectable<W extends StatefulWidget, T> on State<W> {
  final Map<String, T> itemsSelected = {};

  void toggleSelected(String key, T props) {
    setState(() {
      if (itemsSelected.containsKey(key)) {
        itemsSelected.remove(key);
      } else {
        itemsSelected.putIfAbsent(key, () => props);
      }
    });
  }
}
