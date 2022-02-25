import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';
import 'package:value_panel/app/shared/components/dialogs/another_error.dialog.dart';
import 'package:value_panel/app/shared/components/dialogs/repository_error.dialog.dart';
import 'package:value_panel/app/shared/utils.dart';

class ReferColumnGrid extends StatefulWidget {
  final SchedulingDataEntity value;
  final Function updateSchedulingItem;
  const ReferColumnGrid({Key? key, required this.value, required this.updateSchedulingItem}) : super(key: key);

  @override
  _ReferColumnGridState createState() => _ReferColumnGridState();
}

class _ReferColumnGridState extends State<ReferColumnGrid> {
  late bool checkStatus;
  bool loading = false;

  @override
  void initState() {
    checkStatus = widget.value.confirmation!;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ReferColumnGrid oldWidget) {
    checkStatus = widget.value.confirmation!;
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
        : IgnorePointer(
          ignoring: checkStatus ,
          child: Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onChanged: (v) => setClassification(v!),
            value: checkStatus,
            checkColor: checkStatus?primaryColor:Colors.transparent,
            fillColor: MaterialStateProperty.all(checkStatus?primaryColor.withOpacity(0.1):primaryColor),
          ),
        );
  }

  Future setClassification(bool check) async {
    setState(() => loading = true);
    widget.value.confirmation = check;
    Either<SchedulingError, bool> response = await widget.updateSchedulingItem(widget.value, onError);
    if (response.isRight) {
      setState(() {
        checkStatus = check;
      });
    }else{
      widget.value.confirmation = checkStatus;
    }
    setState(() => loading = false);
  }

  void onError(SchedulingError failure)async{
    if(failure is SchedulingRepositoryError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>RepositoryErrorDialog(repositoryError: failure));
    }else if(failure is SchedulingUnknownError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>AnotherErrorDialog(unknownError: failure));
    }
  }
}
