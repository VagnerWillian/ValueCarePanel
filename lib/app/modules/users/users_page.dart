import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/modules/users/users_store.dart';
import 'package:flutter/material.dart';
import 'package:value_panel/app/modules/users/widgets/cards/user.card.dart';
import 'package:value_panel/app/shared/utils.dart';
import 'package:value_panel/app/shared/widgets/page_title_description.widget.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  UsersPageState createState() => UsersPageState();
}

class UsersPageState extends State<UsersPage> {
  final UsersStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: const [
                PageTitleDescription(title: "Usuários", subtitle: "Gerencie os usuários do dashboard"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                children: [
                  UserCard(),
                  UserCard(),
                  UserCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
