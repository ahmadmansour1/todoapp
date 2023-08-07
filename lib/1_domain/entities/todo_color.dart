import 'package:flutter/material.dart';

class TodoColor {
  TodoColor({required this.currentIndex});
final int currentIndex ;
static const List<Color> preDefinedColors = [
  Colors.blue,
  Colors.grey,
  Colors.red,
  Colors.orange,
  Colors.purple,
  Colors.teal,
  Colors.green,
];
Color get colors  => preDefinedColors[currentIndex];

}