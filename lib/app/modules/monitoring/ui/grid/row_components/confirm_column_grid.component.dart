import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/shared/components/dialogs/another_error.dialog.dart';
import 'package:value_panel/app/shared/components/dialogs/repository_error.dialog.dart';
import 'package:value_panel/app/utils/utils.dart';

class ConfirmColumnGrid extends StatefulWidget {
  final MonitoringDataEntity value;
  final Function updateMonitoringItem;
  const ConfirmColumnGrid({Key? key, required this.value, required this.updateMonitoringItem}) : super(key: key);

  @override
  _ConfirmColumnGridState createState() => _ConfirmColumnGridState();
}

class _ConfirmColumnGridState extends State<ConfirmColumnGrid> {
  late bool checkStatus;
  bool loading = false;

  @override
  void initState() {
    checkStatus = widget.value.confirm;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ConfirmColumnGrid oldWidget) {
    checkStatus = widget.value.confirm;
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
    widget.value.confirm = check;
    Either<MonitoringError, bool> response = await widget.updateMonitoringItem(widget.value, onError);
    if (response.isRight) {
      setState(() {
        checkStatus = check;
      });
    }
    setState(() => loading = false);
  }

  void onError(MonitoringError failure)async{
    if(failure is MonitoringRepositoryError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>RepositoryErrorDialog(repositoryError: failure));
    }else if(failure is MonitoringUnknownError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>UnknownErrorDialog(unknownError: failure));
    }
  }
}
