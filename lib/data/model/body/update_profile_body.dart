import 'dart:io';

class UpdateProfileBody  {
  String? firstName;
  String? lastName;
  File? image;


  UpdateProfileBody({
    this.firstName,
    this.lastName,
    this.image,
  });

  factory UpdateProfileBody.fromJson(Map<String, dynamic> json) => UpdateProfileBody(
    firstName: json["first_name"],
    lastName: json["last_name"],
     image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
     "image": image,
  };
}
