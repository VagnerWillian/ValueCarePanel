import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/modules/configurations/ui/configurations_store.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/input.component.dart';
import '../../../shared/components/page_title_description.widget.dart';
import '../../../shared/core/domain/entities/level.entity.dart';
import '../../../utils/utils.dart';
import '../../../utils/validators.dart';

class ConfigurationsPage extends StatefulWidget {
  final String title;
  const ConfigurationsPage({Key? key, this.title = 'ConfigurationsPage'}) : super(key: key);
  @override
  ConfigurationsPageState createState() => ConfigurationsPageState();
}
class ConfigurationsPageState extends State<ConfigurationsPage> {
  final ConfigurationsStore store = Modular.get();

  late final InputBorder _enableInputBorder =
  OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.grey[200]!));
  late final InputBorder _focusedInputBorder =
  OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: primaryColor, width: 2));
  late final InputBorder _errorInputBorder =
  OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.red, width: 2));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PageTitleDescription(title: "Configurações", subtitle: "Configure suas informações de usuário aqui."),
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: const Offset(0, 0), // changes position of shadow
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                            child: InputTitle(
                                label: "NOME",
                                child: TextFormField(
                                    // controller: _nameEditingController,
                                    keyboardType: TextInputType.text,
                                    validator: (str)=>Validators.validateNameAndLastName(str!),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        border: _focusedInputBorder,
                                        enabledBorder: _enableInputBorder,
                                        focusedBorder: _focusedInputBorder,
                                        errorBorder: _errorInputBorder,
                                        focusedErrorBorder: _focusedInputBorder,
                                        errorStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold)
                                    ))),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: InputTitle(
                              label: "EMAIL",
                              child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (str)=>Validators.validaEmail(str!),
                                  scrollPadding: EdgeInsets.zero,
                                  // controller: _emailEditingController,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: _focusedInputBorder,
                                      enabledBorder: _enableInputBorder,
                                      focusedBorder: _focusedInputBorder,
                                      errorBorder: _errorInputBorder,
                                      focusedErrorBorder: _focusedInputBorder,
                                      errorStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold)
                                  )),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: InputTitle(
                              label: "Senha",
                              child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (str)=>Validators.validateEmpty(str!),
                                  scrollPadding: EdgeInsets.zero,
                                  obscureText: true,
                                  // controller: _emailEditingController,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: _focusedInputBorder,
                                      enabledBorder: _enableInputBorder,
                                      focusedBorder: _focusedInputBorder,
                                      errorBorder: _errorInputBorder,
                                      focusedErrorBorder: _focusedInputBorder,
                                      errorStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold)
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                            child: InputTitle(
                                label: "TELEFONE",
                                child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    validator: (str)=>Validators.validateMinCaracters(str!, minLength: 11),
                                    // controller: _phoneEditingController,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        enabledBorder: _enableInputBorder,
                                        border: _focusedInputBorder,
                                        focusedBorder: _focusedInputBorder,
                                        errorBorder: _errorInputBorder,
                                        focusedErrorBorder: _focusedInputBorder,
                                        errorStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold)
                                    ))),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: InputTitle(
                              label: "Nascimento",
                              child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (str)=>Validators.validateEmpty(str!),
                                  scrollPadding: EdgeInsets.zero,
                                  obscureText: true,
                                  // controller: _emailEditingController,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(LineAwesomeIcons.calendar, color: primaryColor),
                                      contentPadding: EdgeInsets.zero,
                                      border: _focusedInputBorder,
                                      enabledBorder: _enableInputBorder,
                                      focusedBorder: _focusedInputBorder,
                                      errorBorder: _errorInputBorder,
                                      focusedErrorBorder: _focusedInputBorder,
                                      errorStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold)
                                  )),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: InputTitle(
                              label: "Nascimento",
                              child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (str)=>Validators.validateEmpty(str!),
                                  scrollPadding: EdgeInsets.zero,
                                  obscureText: true,
                                  // controller: _emailEditingController,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(LineAwesomeIcons.calendar, color: primaryColor),
                                      contentPadding: EdgeInsets.zero,
                                      border: _focusedInputBorder,
                                      enabledBorder: _enableInputBorder,
                                      focusedBorder: _focusedInputBorder,
                                      errorBorder: _errorInputBorder,
                                      focusedErrorBorder: _focusedInputBorder,
                                      errorStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold)
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("FOTO DO PERFIL", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),),
                      Container(
                        height: 250,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      Container(
                        width: 200,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: OutlinedButton.icon(
                          onPressed: (){},
                          icon: Icon(FontAwesomeIcons.camera, size: 16, color: primaryColor),
                          label: Text("MUDAR FOTO", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 14),),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            side: MaterialStateProperty.all(BorderSide(color: primaryColor))
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}