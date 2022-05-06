import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:value_panel/app/modules/splash/errors/splash.errors.dart';
import 'package:value_panel/app/modules/splash/ui/splash_store.dart';
import 'package:value_panel/app/shared/components/dialogs/another_error.dialog.dart';
import 'package:value_panel/app/shared/components/dialogs/repository_error.dialog.dart';
import 'package:value_panel/app/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}
class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  @override
  void initState() {
    store.initialize(onError: onError);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(color: primaryColor, strokeWidth: 1),
          ),
        ),
        Center(
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(10),
            child:  Image.asset("assets/images/logo.png"),
          ),
        ),
      ],
    );
  }

  Future onError(SplashError failure) async {
    if (failure is SplashRepositoryError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => RepositoryErrorDialog(repositoryError: failure));
    } else if (failure is UnknownSplashError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => UnknownErrorDialog(unknownError: failure));
    }
  }
}