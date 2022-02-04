import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/components/input.component.dart';
import 'package:value_panel/app/shared/utils.dart';

class NewUserDialog extends StatefulWidget {
  const NewUserDialog({Key? key}) : super(key: key);

  @override
  _NewUserDialogState createState() => _NewUserDialogState();
}

class _NewUserDialogState extends State<NewUserDialog> {
  late TextEditingController _nameEditingController;
  late TextEditingController _emailEditingController;
  late TextEditingController _phoneEditingController;
  late TextEditingController _typeEditingController;

  late final InputBorder _enableInputBorder =
  OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.grey[200]!));
  late final InputBorder _focusedInputBorder =
  OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: primaryColor, width: 2));

  @override
  void initState() {
    _nameEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    _phoneEditingController = TextEditingController();
    _typeEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(30),
        width: 500,
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
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                                controller: _nameEditingController,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  enabledBorder: _enableInputBorder,
                                  focusedBorder: _focusedInputBorder,
                                )),
                          )),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: InputTitle(
                        label: "EMAIL",
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                              scrollPadding: EdgeInsets.zero,
                              controller: _emailEditingController,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                enabledBorder: _enableInputBorder,
                                focusedBorder: _focusedInputBorder,
                              )),
                        ),
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
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                                controller: _phoneEditingController,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  enabledBorder: _enableInputBorder,
                                  focusedBorder: _focusedInputBorder,
                                )),
                          )),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: InputTitle(
                        label: "TIPO DO USUÁRIO",
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                              scrollPadding: EdgeInsets.zero,
                              controller: _typeEditingController,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                enabledBorder: _enableInputBorder,
                                focusedBorder: _focusedInputBorder,
                              )),
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
                      onPressed: (){},
                      icon: const Icon(FontAwesomeIcons.solidSave, color: Colors.white, size: 16,),
                      label: Text("Salvar", style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),)
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
