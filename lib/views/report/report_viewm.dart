import 'package:flutter/material.dart';
import 'package:menuku/models/api/report_api.dart';

class ReportViewModel extends ChangeNotifier {
  postReport(report) async {
    await ReportApi.sendReport(report: report);
  }
}