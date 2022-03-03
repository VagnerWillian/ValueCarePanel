import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';
import 'package:value_panel/app/shared/components/dialogs/another_error.dialog.dart';
import 'package:value_panel/app/shared/components/dialogs/repository_error.dialog.dart';
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
    checkStatus = widget.value.forward!;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ReferColumnGrid oldWidget) {
    checkStatus = widget.value.forward!;
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
    widget.value.forward = check;
    Either<DashboardError, bool> response = await widget.updateMonitoringItem(widget.value, onError);
    if (response.isRight) {
      setState(() {
        checkStatus = check;
      });
    }
    setState(() => loading = false);
  }

  void onError(DashboardError failure)async{
    if(failure is DashboardRepositoryError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>RepositoryErrorDialog(repositoryError: failure));
    }else if(failure is DashboardUnknownError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>AnotherErrorDialog(unknownError: failure));
    }
  }
}