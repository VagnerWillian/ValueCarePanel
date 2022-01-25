import 'package:flutter/material.dart';

abstract class ClassificationEntity {
  String label;
  String id;
  Color? color;

  ClassificationEntity({required this.label, required this.id, required this.color});
}
