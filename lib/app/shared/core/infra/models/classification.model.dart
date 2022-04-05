import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';

class Classification extends Equatable implements ClassificationEntity{

  @override
  late final String label;

  @override
  late final int id;

  @override
  late final String image;

  @override
  Color? color;

  Classification({required this.label, required this.id, required this.color});

  Classification.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    id = json['id'];
    color = HexColor(json['cor']);
    image = json['image'];
  }

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['image'] = image;
    data['id'] = id;
    data['cor'] = ColorToHex(color!).toString();
    return data;

  }

  @override
  List<Object?> get props => [id];
}
