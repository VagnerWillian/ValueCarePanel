import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/shared/utils.dart';

class ReferColumnGrid extends StatefulWidget {
  final MonitoringDataEntity value;
  final Function updateMonitoringItem;
  const ReferColumnGrid({Key? key, required this.value, required this.updateMonitoringItem}) : super(key: key);

  @override
  _ReferColumnGridState createState() => _ReferColumnGridState();
}

class _ReferColumnGridState extends State<ReferColumnGrid> {
  late bool checkStatus;
  bool loading = false;

  @override
  void initState() {
    checkStatus = widget.value.encaminhar!;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ReferColumnGrid oldWidget) {
    checkStatus = widget.value.encaminhar!;
    loading = false;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
          child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: secondColor,
              ),
            ),
        )
        : Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onChanged: (v) => setClassification(v!),
          value: checkStatus,
          fillColor: MaterialStateProperty.all(primaryColor),
        );
  }

  Future setClassification(bool check) async {
    setState(() => loading = true);
    widget.value.encaminhar = check;
    Either<MonitoringError, bool> response = await widget.updateMonitoringItem(widget.value);
    if (response.isRight) {
      setState(() {
        checkStatus = check;
      });
    }
    setState(() => loading = false);
  }
}
