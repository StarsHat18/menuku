import 'package:flutter/material.dart';
import 'package:menuku/models/report.dart';
import 'package:menuku/views/report/report_viewm.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final ctrlEmail = TextEditingController();
  final ctrlMassage = TextEditingController();
  final ctrlName = TextEditingController();
  final ctrlSubject = TextEditingController();

  final _fomKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final report = Provider.of<ReportViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text(
          "Report",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _fomKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                textFromField("Nama cannot be empty", ctrlName),
                const SizedBox(height: 15),
                const Text("Email",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                textFromField("Email cannot be empty", ctrlEmail),
                const SizedBox(height: 15),
                const Text("Specific Erorr",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                textFromField("Specific cannot be empty", ctrlSubject),
                const SizedBox(height: 15),
                const Text("Description",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                    maxLines: 8,
                    controller: ctrlMassage,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Description cannot be empty",
                            textColor: Colors.white,
                            backgroundColor: Colors.red);
                      }
                      return null;
                    }),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      textStyle: const TextStyle(fontSize: 20)),
                  child: const Text(
                    'SEND',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.yellow),
                  ),
                  onPressed: () async {
                    if (_fomKey.currentState!.validate()) {
                      _fomKey.currentState!.save();
                      await report
                          .postReport(Report(
                            name: ctrlName.text,
                            email: ctrlEmail.text,
                            subject: ctrlSubject.text,
                            massage: ctrlMassage.text,
                          ))
                          .then((value) =>
                              Fluttertoast.showToast(msg: 'Report Succesful'))
                          .then((value) => ctrlName.clear())
                          .then((value) => ctrlEmail.clear())
                          .then((value) => ctrlSubject.clear())
                          .then((value) => ctrlMassage.clear());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Widget textFromField(msgValidator, controller) {
  return TextFormField(
    controller: controller,
    decoration: const InputDecoration(border: OutlineInputBorder()),
    validator: (value) {
      if (value!.isEmpty) {
        Fluttertoast.showToast(
          msg: msgValidator,
          textColor: Colors.white,
          backgroundColor: Colors.red,
        );
      }
      return null;
    },
  );
}
