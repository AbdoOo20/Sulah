class LoginBody {
  String? phone;

  LoginBody({
    this.phone,
  });

  factory LoginBody.fromJson(Map<String, dynamic> json) => LoginBody(
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
  };
}
