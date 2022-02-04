import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/modules/users/errors/scheduling.errors.dart';
import 'package:value_panel/app/modules/users/users_store.dart';
import 'package:value_panel/app/modules/users/widgets/cards/user.card.dart';
import 'package:value_panel/app/shared/utils.dart';
import 'package:value_panel/app/shared/widgets/custom/gradient.button.dart';
import 'package:value_panel/app/shared/widgets/dialogs/another_error.dialog.dart';
import 'package:value_panel/app/shared/widgets/dialogs/repository_error.dialog.dart';
import 'package:value_panel/app/shared/widgets/page_title_description.widget.dart';
import 'package:value_panel/app/shared/widgets/search/main_search.widget.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  UsersPageState createState() => UsersPageState();
}

class UsersPageState extends State<UsersPage> {
  final UsersStore store = Modular.get();

  @override
  void initState() {
    store.getUsers(onError);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PageTitleDescription(title: "Usuários", subtitle: "Gerencie os usuários do dashboard"),
                  Row(
                    children: [
                      SizedBox(
                        width: 400,
                        child: MainSearch(
                          onTextChanged: (){},
                        ),
                      ),
                      const SizedBox(width: 15,),
                      GradientButton(
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
                              Icons.person_add,
                              size: 18,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Novo Usuário",
                              style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              Observer(
                builder: (_)=> store.loading?
                Center(
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: FlareActor(
                        'assets/anims/loading.flr',
                        animation: 'loading',
                        color: primaryColor,
                      ),
                    ))
                    :Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Wrap(
                    children: store.usersList.map((user) => UserCard(user)).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future onError(UsersError failure)async{
    if(failure is UsersRepositoryError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>RepositoryErrorDialog(repositoryError: failure));
    }else if(failure is UsersUnknownError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>AnotherErrorDialog(unknownError: failure));
    }
  }
}
