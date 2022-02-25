import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';
import 'package:value_panel/app/shared/components/dialogs/another_error.dialog.dart';
import 'package:value_panel/app/shared/components/dialogs/repository_error.dialog.dart';
import 'package:value_panel/app/shared/utils.dart';

class AppointmentDateColumnGrid extends StatefulWidget {
  final SchedulingDataEntity schedulingDataEntity;
  final Function updateSchedulingItem;
  const AppointmentDateColumnGrid({required this.schedulingDataEntity, required this.updateSchedulingItem, Key? key}) : super(key: key);

  @override
  _AppointmentDateColumnGridState createState() => _AppointmentDateColumnGridState();
}

class _AppointmentDateColumnGridState extends State<AppointmentDateColumnGrid> {
  DateTime? selectedDate;
  bool loading = false;
  final datePattern = DateFormat("dd/MM/yyyy", "pt_BR");

  @override
  void initState() {
    selectedDate = widget.schedulingDataEntity.appointmentDateInDateTime;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppointmentDateColumnGrid oldWidget) {
    selectedDate = widget.schedulingDataEntity.appointmentDateInDateTime;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loading
          ? Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: secondColor,
                ),
              ),
            )
          : OutlinedButton.icon(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 15))),
              onPressed: openSelectorDate,
              icon: Icon(
                Icons.calendar_today_rounded,
                color: primaryColor,
                size: 18,
              ),
              label: Text(
                selectedDate == null ? "Selecionar..." : datePattern.format(selectedDate!),
                style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
              )),
    );
  }

  Future<void> openSelectorDate() async {
    DateTime? newDate = await showDialog(
        barrierColor: Colors.white70,
        context: context,
        builder: (_) => Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 450,
                  height: 450,
                  child: SfDateRangePicker(
                    selectionMode: DateRangePickerSelectionMode.single,
                    rangeSelectionColor: secondColor.withOpacity(0.3),
                    selectionColor: primaryColor,
                    endRangeSelectionColor: primaryColor,
                    startRangeSelectionColor: primaryColor,
                    todayHighlightColor: primaryColor,
                    rangeTextStyle: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold),
                    yearCellStyle: DateRangePickerYearCellStyle(
                      textStyle: GoogleFonts.cairo(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      todayTextStyle: GoogleFonts.cairo(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      textStyle: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold),
                      todayTextStyle: GoogleFonts.cairo(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    selectionTextStyle: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold),
                    headerStyle:
                        DateRangePickerHeaderStyle(textStyle: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 30)),
                    showActionButtons: true,
                    confirmText: "Confirmar",
                    cancelText: "Cancelar",
                    onSubmit: (value) => Modular.to.pop(value),
                    onCancel: () => Modular.to.pop(),
                  ),
                ),
              ),
            ));

    if (newDate != null) {
      onChangedDate(newDate);
    }
  }

  void onChangedDate(DateTime value) async {
    setState(() => loading = true);
    widget.schedulingDataEntity.appointmentDate = value.toString();
    Either<SchedulingError, bool> response = await widget.updateSchedulingItem(widget.schedulingDataEntity, onError);
    if (response.isRight) {
      setState(() {
        selectedDate = value;
      });
    }else{
      widget.schedulingDataEntity.appointmentDate = selectedDate.toString();
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
