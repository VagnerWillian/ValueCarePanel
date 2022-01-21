import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/utils.dart';

class LoadingDialog extends StatefulWidget {
  Future future;
  LoadingDialog({Key? key, required this.future}) : super(key: key);

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return loading();
          case ConnectionState.none:
            return loading();
          case ConnectionState.active:
            return loading();
          case ConnectionState.done:
            Navigator.pop(context);
            return loading();
        }
      }
    );
  }

  Widget loading()=> Dialog(
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
