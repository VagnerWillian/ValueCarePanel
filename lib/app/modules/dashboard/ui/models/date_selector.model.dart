import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class DateSelector extends Equatable{
  final String label;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool dynamic;

  final startDatePattern = DateFormat("d 'de' MMMM", "pt_BR");
  final endDatePattern = DateFormat("d 'de' MMMM ',' y'", "pt_BR");

  String get description => "${startDatePattern.format(startDate!)} • ${endDatePattern.format(endDate!)}";

  DateSelector({
    required this.label,
    required this.startDate,
    required this.endDate,
    this.dynamic = false
  });

  @override
  List<Object?> get props => [label];
}