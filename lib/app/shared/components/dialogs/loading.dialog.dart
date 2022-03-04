import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/utils/utils.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250, height: 250,
              child: FlareActor(
                'assets/anims/loading.flr',
                animation: 'loading',
                color: primaryColor,
              ),
            ),
            Text("Só um momento...", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
