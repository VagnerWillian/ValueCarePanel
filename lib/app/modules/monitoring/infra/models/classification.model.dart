import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/classification.entity.dart';

class Classification extends Equatable implements ClassificationEntity{

  @override
  late final String label;

  @override
  late final int id;

  @override
  Color? color;

  Classification({required this.label, required this.id, required this.color});

  Classification.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    id = json['id'];
  }

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['id'] = id;
    return data;

  }

  @override
  List<Object?> get props => [id];
}
