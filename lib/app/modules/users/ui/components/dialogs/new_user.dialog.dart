import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/utils/validators.dart';

import '../../../../../shared/components/dialogs/another_error.dialog.dart';
import '../../../../../shared/components/dialogs/repository_error.dialog.dart';
import '../../../../../shared/components/input.component.dart';
import '../../../../../shared/core/domain/entities/level.entity.dart';
import '../../../../../utils/utils.dart';
import '../../../errors/users_errors.dart';
import 'new_user.dialog_store.dart';

class NewUserDialog extends StatefulWidget {
  const NewUserDialog({Key? key}) : super(key: key);

  @override
  _NewUserDialogState createState() => _NewUserDialogState();
}

class _NewUserDialogState extends ModularState<NewUserDialog, NewUserDialogStore> {

  //Controllers
  late TextEditingController _nameEditingController;
  late TextEditingController _emailEditingController;
  late TextEditingController _phoneEditingController;

  //Keys
  final _loginFormKey = GlobalKey<FormState>();

  late final InputBorder _enableInputBorder =
  OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.grey[200]!));
  late final InputBorder _focusedInputBorder =
  OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: primaryColor, width: 2));
  late final InputBorder _errorInputBorder =
  OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.red, width: 2));

  LevelAdminEntity? selectedLevel;

  @override
  void initState() {
    _nameEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    _phoneEditingController = MaskedTextController(mask: '(00) 0 00000000');

    if(kDebugMode){
      _nameEditingController.text = "Rodrigo Zimmer";
      _emailEditingController.text = "rodrigo@valuecare.com.br";
      _phoneEditingController.text = "11981458755";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(30),
        width: 500,
        child: Observer(
          builder: (_) => store.user!=null?Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 250,
                height: 250,
                child: Icon(LineAwesomeIcons.check_circle_o, color: Colors.green, size: 150,),
              ),
              Text("Deu tudo certo!", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 35),)
            ],
          ):store.loading
              ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: FlareActor(
                      'assets/anims/loading.flr',
                      animation: 'loading',
                      color: primaryColor,
                    ),
                  ),
                ],
              ):store.user!=null?Container()
              : Form(
              key: _loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Adicionar usuário", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 25)),
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: greyColor,
                          ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                            child: InputTitle(
                                label: "NOME",
                                child: TextFormField(
                                    controller: _nameEditingController,
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
                                  controller: _emailEditingController,
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
                                    controller: _phoneEditingController,
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
                              label: "TIPO DO USUÁRIO",
                              child: DropdownButtonFormField<LevelAdminEntity>(
                                  value: selectedLevel,
                                  validator: (str)=>Validators.validaNull(str),
                                  onChanged: (l)=>selectedLevel=l,
                                  hint: Text("Selecionar...", style: GoogleFonts.cairo(fontWeight: FontWeight.bold)),
                                  items: levels.map((l) => DropdownMenuItem(
                                    child: Text(l.level, style: GoogleFonts.cairo(fontWeight: FontWeight.bold)),
                                    value: l,
                                  )).toList(),
                                  style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                      border: _focusedInputBorder,
                                      enabledBorder: _enableInputBorder,
                                      focusedBorder: _focusedInputBorder,
                                      errorBorder: _errorInputBorder,
                                      focusedErrorBorder: _focusedInputBorder,
                                      errorStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold)
                                  )
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 45,
                        width: 110,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(redColor),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.times,
                              size: 18,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Cancelar",
                              style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                            )),
                      ),
                      SizedBox(
                        height: 45,
                        width: 110,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(primaryColor),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                            ),
                            onPressed: validate,
                            icon: const Icon(FontAwesomeIcons.solidSave, color: Colors.white, size: 16,),
                            label: Text("Salvar", style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),)
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

  Future onError(UsersError failure) async {
    if (failure is UsersRepositoryError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => RepositoryErrorDialog(repositoryError: failure));
    } else if (failure is UsersUnknownError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => UnknownErrorDialog(unknownError: failure));
    }
  }

  void validate(){
    if(_loginFormKey.currentState!.validate()){
      store.newUser(
          onError,
          name: _nameEditingController.text,
          email: _emailEditingController.text,
          phone: _phoneEditingController.text,
          level: selectedLevel!.id
      );
    }
  }
}
