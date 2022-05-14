import 'dart:convert';

import 'package:menuku/models/report.dart';
import 'package:dio/dio.dart';

class ReportApi {
  static Future sendReport({Report? report}) async {
    var response =
        await Dio().post("https://api.emailjs.com/api/v1.0/email/send",
            options: Options(headers: {
              'origin': 'http://localhost',
              'Content-Type': 'application/json',
            }),
            data: jsonEncode({
              'service_id': 'service_oqug5q5',
              'template_id': 'template_wxe2l5y',
              'user_id': '_QSsAXuUlpOJv_F2L',
              'template_params': report
            }));
    return response;
  }
}