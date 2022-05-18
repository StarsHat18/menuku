class Report {
  final String name;
  final String email;
  final String subject;
  final String massage;

  Report(
      {required this.name,
      required this.email,
      required this.subject,
      required this.massage});

  factory Report.fromJson(Map<String, dynamic> json) => Report(
      name: json['user_name'],
      email: json['user_email'],
      subject: json['user_subject'],
      massage: json['user_message']);

  Map<String, dynamic> toJson() => {
        "user_name": name,
        "user_email": email,
        "user_subject": subject,
        "user_message": massage,
      };
}
