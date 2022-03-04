
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../shared/components/dialogs/another_error.dialog.dart';
import '../../../shared/components/dialogs/repository_error.dialog.dart';
import '../../../utils/utils.dart';
import '../../../utils/validators.dart';
import '../errors/login.errors.dart';
import '../ui/login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            width: 500,
            height: 500,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo_h.png",
                  width: 120,
                ),
                const SizedBox(height: 20),
                Text("Entrar", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20),),
                Text("Entre com a sua conta", style: GoogleFonts.cairo(fontSize: 14),),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: Form(
                    key: store.loginFormKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: TextFormField(
                            controller: store.emailEditingController,
                            keyboardType: TextInputType.emailAddress,
                            style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 12),
                            autofocus: false,
                            validator: (str)=>Validators.validaEmail(str!),
                            decoration: InputDecoration(
                              hintText: "Digite seu email",
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.red)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade100)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: primaryColor)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: primaryColor)
                              ),
                              errorStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold)
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          child: TextFormField(
                            controller: store.passEditingController,
                            validator: (str)=>Validators.validatePassword(str!),
                            keyboardType: TextInputType.text,
                            style: GoogleFonts.openSans(fontWeight: FontWeight.w600,fontSize: 12),
                            autofocus: false,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Senha",
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.red)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade100)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: primaryColor)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: primaryColor)
                              ),
                              errorStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold)
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        RoundedLoadingButton(
                          color: primaryColor,
                          child: const Text('Entrar', style: TextStyle(color: Colors.white)),
                          controller: store.btnController,
                          onPressed: ()=>store.signIn(onError: onError),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future onError(LoginError failure) async {
    if (failure is LoginRepositoryError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => RepositoryErrorDialog(repositoryError: failure));
    } else if (failure is UnknownLoginError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => UnknownErrorDialog(unknownError: failure));
    }
  }
}