import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:value_panel/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:value_panel/app/shared/utils.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();


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
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 12),
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: "Digite seu email",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade100)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: primaryColor)
                            ),
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
                          style: GoogleFonts.openSans(fontWeight: FontWeight.w600,fontSize: 12),
                          autofocus: false,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Senha",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade100)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: primaryColor)
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      RoundedLoadingButton(
                        color: primaryColor,
                        child: const Text('Entrar', style: TextStyle(color: Colors.white)),
                        controller: _btnController,
                        onPressed: _doSomething,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _doSomething() async {
    Timer(const Duration(seconds: 3), () {
      _btnController.success();
    });
  }
}