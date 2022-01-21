import 'package:equatable/equatable.dart';

class DateSelector extends Equatable{
  final String label;
  final DateTime startDate;
  final DateTime endDate;

  DateSelector({
    required this.label,
    required this.startDate,
    required this.endDate
  });

  @override
  List<Object?> get props => [label];
}