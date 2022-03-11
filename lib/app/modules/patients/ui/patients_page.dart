import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:value_panel/app/modules/patients/ui/patients_store.dart';
import 'package:value_panel/app/utils/utils.dart';

class PatientsPage extends StatefulWidget {
  final String title;
  const PatientsPage({Key? key, this.title = 'PatientsPage'}) : super(key: key);
  @override
  PatientsPageState createState() => PatientsPageState();
}
class PatientsPageState extends State<PatientsPage> {
  final PatientsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextButton(onPressed: ()=>Modular.to.pushNamed(PATIENT_DETAILS_ROUTE), child: Text("Abrir")),
          Expanded(child: const RouterOutlet())
        ],
      ),
    );
  }
}