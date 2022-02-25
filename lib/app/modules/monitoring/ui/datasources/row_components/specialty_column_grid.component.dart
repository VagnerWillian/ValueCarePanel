import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/shared/components/dialogs/another_error.dialog.dart';
import 'package:value_panel/app/shared/components/dialogs/repository_error.dialog.dart';
import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';
import 'package:value_panel/app/shared/utils.dart';

class SpecialtyColumnGrid extends StatefulWidget {
  final MonitoringDataEntity value;
  final Function updateMonitoringItem;
  const SpecialtyColumnGrid({Key? key, required this.value, required this.updateMonitoringItem}) : super(key: key);

  @override
  _SpecialtyColumnGridState createState() => _SpecialtyColumnGridState();
}

class _SpecialtyColumnGridState extends State<SpecialtyColumnGrid> {

  SpecialtyEntity? selectedSpecialty;
  bool loading = false;

  @override
  void initState() {
    if(widget.value.specialtyId!=null){
      selectedSpecialty = specialties.singleWhere((c) => c.id==widget.value.specialtyId);
    }
    loading = false;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SpecialtyColumnGrid oldWidget) {
    if(widget.value.specialtyId!=null){
      selectedSpecialty = specialties.singleWhere((c) => c.id==widget.value.specialtyId);
    }
    loading = false;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loading?
         SizedBox(width: 20, height: 20,
          child: CircularProgressIndicator(
              color: secondColor,
          ),
        )
      :Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: 80,
          // width: 150,
          child: OutlinedButton(
            onPressed: (){},
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 15))),
            child: DropdownButton<SpecialtyEntity>(
              borderRadius: BorderRadius.circular(5),
              value: selectedSpecialty,
              underline: Container(),
              isExpanded: true,
              hint: Text("Selecionar...", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 12), overflow: TextOverflow.ellipsis),
              iconEnabledColor: primaryColor,
              items: specialties.map((s) {
                return DropdownMenuItem<SpecialtyEntity>(
                    value: s,
                    child: Row(
                      children: [
                        SvgPicture.network(s.image, width: 20),
                        const SizedBox(width: 10),
                        Expanded(child: Text(s.label, style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 12), overflow: TextOverflow.ellipsis))
                      ],
                    ));
              }).toList(),
              onChanged: (v)=> setClassification(v!),
            ),
          ),
        ),
      ),
    );
  }

  Future setClassification(SpecialtyEntity specialtyEntity)async{
    setState(() => loading = true);
    widget.value.specialtyId = specialtyEntity.id;
    Either<MonitoringError, bool> response = await widget.updateMonitoringItem(widget.value, onError);
    if(response.isRight){
      setState(() {
        selectedSpecialty = specialtyEntity;
      });
    }else{

    }
    setState(() => loading=false);
  }

  void onError(MonitoringError failure)async{
    if(failure is MonitoringRepositoryError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>RepositoryErrorDialog(repositoryError: failure));
    }else if(failure is MonitoringUnknownError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>AnotherErrorDialog(unknownError: failure));
    }
  }
}
