import 'dart:html' as html;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:value_panel/app/modules/configurations/ui/configurations_store.dart';
import 'package:flutter/material.dart';
import 'package:value_panel/app/shared/core/infra/models/level.model.dart';

import '../../../shared/components/custom/gradient.button.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                                        controller: store.nameEditingController,
                                        keyboardType: TextInputType.text,
                                        validator: (str)=>Validators.validateNameAndLastName(str!),
                                        style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                        decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                                      controller: store.emailEditingController,
                                      style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                                      controller: store.passEditingController,
                                      style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                      decoration: InputDecoration(
                                          hintText: "Nova senha",
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                                        controller: store.phoneEditingController,
                                        style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "NASCIMENTO",
                                      style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14, color: greyColor),
                                    ),
                                    Observer(
                                      builder:(_)=>SizedBox(
                                        height: 45,
                                        child: OutlinedButton(
                                          style: ButtonStyle(
                                            side: MaterialStateProperty.all(BorderSide(color: Colors.grey.shade200))
                                          ),
                                          onPressed: openSelectorDate,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(LineAwesomeIcons.calendar, color: primaryColor),
                                              const SizedBox(width: 10),
                                              Text(store.birthday==null?"SELECIONAR...":patternDdMmm.format(store.birthday!).toUpperCase(),
                                              style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: InputTitle(
                                  label: "TIPO DE USUARIO",
                                  child: SizedBox(
                                    height: 45,
                                    child: DropdownButtonFormField<LevelAdminEntity>(
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                        enabledBorder: _enableInputBorder,
                                        border: _focusedInputBorder,
                                        focusedBorder: _focusedInputBorder,
                                        errorBorder: _errorInputBorder,
                                        focusedErrorBorder: _focusedInputBorder,
                                      ),
                                      items: [
                                        DropdownMenuItem(child: Text("OPERADOR", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14)), value: LevelAdmin(id: 0, level: "OPERADOR"),),
                                        DropdownMenuItem(child: Text("GESTOR", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14)), value: LevelAdmin(id: 0, level: "GESTOR"),),
                                        DropdownMenuItem(child: Text("ADMINISTRADOR", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14)), value: LevelAdmin(id: 0, level: "ADMINISTRADOR"),),
                                      ],
                                      hint: Text("SELECIONAR...", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14)),
                                      onChanged: (v)=>store.setLevel(v!.id),
                                    ),
                                  )
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          InputTitle(
                              label: "NOTIFICAÇÕES",
                              child: Wrap(
                                children: [
                                  IntrinsicWidth(
                                    child: Row(
                                      children: [
                                        Observer(
                                          builder:(_)=>Switch(
                                            value: store.emailNotifies, onChanged: (v)=>store.setEmailNotifies(v), inactiveTrackColor: primaryColor.withOpacity(0.2), activeColor: greenColor),
                                        ),
                                        Text("Email", style: GoogleFonts.cairo(fontSize: 14, fontWeight: !store.emailNotifies?FontWeight.normal:FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: Row(
                                      children: [
                                        Observer(
                                          builder:(_)=>Switch(
                                              value: store.pushNotifies, onChanged: (v)=>store.setPushNotifies(v), inactiveTrackColor: primaryColor.withOpacity(0.2), activeColor: greenColor),
                                        ),
                                        Text("Push", style: GoogleFonts.cairo(fontSize: 14, fontWeight: !store.pushNotifies?FontWeight.normal:FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: Row(
                                      children: [
                                        Observer(
                                          builder:(_)=>Switch(
                                              value: store.desktopNotifies, onChanged: (v)=>store.setDestopNotifies(v), inactiveTrackColor: primaryColor.withOpacity(0.2), activeColor: greenColor),
                                        ),
                                        Text("Desktop", style: GoogleFonts.cairo(fontSize: 14, fontWeight: !store.desktopNotifies?FontWeight.normal:FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: Row(
                                      children: [
                                        Observer(
                                          builder:(_)=>Switch(
                                              value: store.smsNotifies, onChanged: (v)=>store.setSmsNotifies(v), inactiveTrackColor: primaryColor.withOpacity(0.2), activeColor: greenColor),
                                        ),
                                        Text("SMS", style: GoogleFonts.cairo(fontSize: 14, fontWeight: !store.smsNotifies?FontWeight.normal:FontWeight.bold)),
                                      ],
                                    ),
                                  )
                                ],
                              ))
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
                          Observer(
                            builder: (_) => Container(
                                height: 250,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: store.image.isEmpty?Container():SizedBox(
                                  width: 250,
                                  height: 200,
                                  child: ImageNetwork(
                                    borderRadius: BorderRadius.circular(10),
                                    height: 250,
                                    width: 200,
                                    onLoading: Container(),
                                    imageCache: CachedNetworkImageProvider(store.image),
                                    image: store.image,
                                  ),
                                ),
                              )
                          ),
                          Container(
                            width: 200,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: OutlinedButton.icon(
                              onPressed: ()async{},
                              icon: Icon(FontAwesomeIcons.camera, size: 16, color: primaryColor),
                              label: Text("MUDAR FOTO", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 14),),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                side: MaterialStateProperty.all(BorderSide(color: primaryColor))
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IntrinsicWidth(
                  child: GradientButton(
                    height: 55,
                    onPressed: (){},
                    gradient: LinearGradient(
                      colors: gradientColors,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.save,
                          size: 18,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Salvar Alterações",
                          style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> openSelectorDate() async {
    DateTime? newDate = await showDialog(
        barrierColor: Colors.white70,
        context: context,
        builder: (_) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 450,
              height: 450,
              child: SfDateRangePicker(
                initialSelectedDate: store.birthday,
                selectionMode: DateRangePickerSelectionMode.single,
                rangeSelectionColor: secondColor.withOpacity(0.3),
                selectionColor: primaryColor,
                endRangeSelectionColor: primaryColor,
                startRangeSelectionColor: primaryColor,
                todayHighlightColor: primaryColor,
                rangeTextStyle: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold),
                yearCellStyle: DateRangePickerYearCellStyle(
                  textStyle: GoogleFonts.cairo(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  todayTextStyle: GoogleFonts.cairo(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                monthCellStyle: DateRangePickerMonthCellStyle(
                  textStyle: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold),
                  todayTextStyle: GoogleFonts.cairo(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                selectionTextStyle: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold),
                headerStyle:
                DateRangePickerHeaderStyle(textStyle: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 30)),
                showActionButtons: true,
                confirmText: "Confirmar",
                cancelText: "Cancelar",
                onSubmit: (value) => Modular.to.pop(value),
                onCancel: () => Modular.to.pop(),
              ),
            ),
          ),
        ));

    if (newDate != null) {
      store.setBirthday(newDate);
    }
  }
}