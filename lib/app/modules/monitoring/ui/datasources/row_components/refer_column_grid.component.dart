import 'package:flutter/material.dart';
import 'package:value_panel/app/shared/utils.dart';

class ReferColumnGrid extends StatefulWidget {
  final bool check;
  const ReferColumnGrid({Key? key, required this.check}) : super(key: key);

  @override
  _ReferColumnGridState createState() => _ReferColumnGridState();
}

class _ReferColumnGridState extends State<ReferColumnGrid> {

  late bool checkStatus;

  @override
  void initState() {
    checkStatus = widget.check;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ReferColumnGrid oldWidget) {
    checkStatus = widget.check;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onChanged: (v)=>setState(() => checkStatus = v!),
          value: checkStatus,
          fillColor: MaterialStateProperty.all(primaryColor),
        )
    );
  }
}
