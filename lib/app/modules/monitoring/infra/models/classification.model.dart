import 'package:flutter/material.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/classification.entity.dart';

class Classification implements ClassificationEntity{

  @override
  late String label;

  @override
  late int id;

  @override
  late Color color;

  Classification({required this.label, required this.id, required this.color});

  Classification.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['id'] = id;
    return data;
  }
}
