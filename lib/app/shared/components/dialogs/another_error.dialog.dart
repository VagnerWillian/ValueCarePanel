import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/errors/unknown.error.dart';
import 'package:value_panel/app/utils/utils.dart';

class UnknownErrorDialog extends StatefulWidget {
  final UnknownError unknownError;
  const UnknownErrorDialog({required this.unknownError, Key? key}) : super(key: key);

  @override
  _UnknownErrorDialogState createState() => _UnknownErrorDialogState();
}

class _UnknownErrorDialogState extends State<UnknownErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.close, color: Colors.grey, size: 100,),
            Text("Cód. #Unknown", style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
            Text("Tivemos um problema", style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
            Text(widget.unknownError.message, style: GoogleFonts.cairo(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: 100,
              child: OutlinedButton(
                style: ButtonStyle(side: MaterialStateProperty.all(BorderSide(color: primaryColor))),
                onPressed: ()=>Navigator.pop(context),
                child: Text("OK", style: TextStyle(color: primaryColor),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

