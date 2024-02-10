import 'dart:io';

class RegisterBody  {
  String? firstName;
  String? lastName;
  String? phoneCode;
  String? phone;
  File? image;

  RegisterBody({
    this.firstName,
    this.lastName,
    this.phoneCode,
    this.phone,
    this.image,
  });

  factory RegisterBody.fromJson(Map<String, dynamic> json) => RegisterBody(
    firstName: json["first_name"],
    lastName: json["last_name"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
     image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "phone_code": phoneCode,
    "phone": phone,
     "image": image,
  };
}
