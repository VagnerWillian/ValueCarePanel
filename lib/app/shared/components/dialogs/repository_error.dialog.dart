import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/errors/repository.error.dart';
import 'package:value_panel/app/utils/utils.dart';

class RepositoryErrorDialog extends StatefulWidget {
  final RepositoryError repositoryError;
  const RepositoryErrorDialog({required this.repositoryError, Key? key}) : super(key: key);

  @override
  _RepositoryErrorDialogState createState() => _RepositoryErrorDialogState();
}

class _RepositoryErrorDialogState extends State<RepositoryErrorDialog> {
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
            const Icon(Icons.cloud, color: Colors.grey, size: 100,),
            Text("Cód. #${widget.repositoryError.statusCode}", style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
            Text("Problema na comunicação com o Servidor", style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
            Text(widget.repositoryError.message!, style: GoogleFonts.cairo(fontSize: 14, color: Colors.grey)),
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

