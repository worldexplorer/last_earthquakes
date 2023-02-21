import 'package:flutter/material.dart';

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
