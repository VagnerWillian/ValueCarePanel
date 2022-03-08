import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoryColumnGrid extends StatelessWidget {
  final String value;
  final Function openHistoryFloating;
  const HistoryColumnGrid({required this.openHistoryFloating, Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(
      height: 40,
      width: 40,
      child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)))
          ),
          onPressed: ()=>openHistoryFloating(),
          child: SvgPicture.network("assets/assets/images/menu/history.svg", width: 20,)),
    ));
  }
}
