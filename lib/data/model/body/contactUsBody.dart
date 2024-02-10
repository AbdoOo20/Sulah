class ContactUsBody {
  String? name;
  String? email;
  String? subject;
  String? message;

  ContactUsBody({
    this.name,
    this.email,
    this.subject,
    this.message,
  });

  factory ContactUsBody.fromJson(Map<String, dynamic> json) => ContactUsBody(
    name: json["name"],
    email: json["email"],
    subject: json["subject"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "subject": subject,
    "messages": message,
  };
}