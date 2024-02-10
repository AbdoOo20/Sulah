

class NearBranchModel {
  OneBranch? data;
  String? message;
  int? code;

  NearBranchModel({
    this.data,
    this.message,
    this.code,
  });

  factory NearBranchModel.fromJson(Map<String, dynamic> json) => NearBranchModel(
    data: json["data"] == null ? null : OneBranch.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "code": code,
  };
}
class OneBranch {
  int? id;
  String? title;
  int? regionId;
  Region? region;
  int? cityId;
  City? city;
  double? longitude;
  double? latitude;
  double? distance;
  bool? isMain;
  bool? isSelected;

  OneBranch({
    this.id,
    this.title,
    this.regionId,
    this.region,
    this.cityId,
    this.city,
    this.longitude,
    this.latitude,
    this.distance,
    this.isMain,
    this.isSelected = false,
  });

  factory OneBranch.fromJson(Map<String, dynamic> json) => OneBranch(
    id: json["id"],
    title: json["title"],
    regionId: json["region_id"],
    region: json["region"] == null ? null : Region.fromJson(json["region"]),
    cityId: json["city_id"],
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    distance: json["distance"]?.toDouble(),
    isMain: json["is_main"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "region_id": regionId,
    "region": region?.toJson(),
    "city_id": cityId,
    "city": city?.toJson(),
    "longitude": longitude,
    "latitude": latitude,
    "distance": distance,
    "is_main": isMain,
  };
}


class City {
  int? id;
  String? title;
  int? regionId;

  City({
    this.id,
    this.title,
    this.regionId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    title: json["title"],
    regionId: json["region_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "region_id": regionId,
  };
}

class Region {
  int? id;
  String? title;
  List<City>? cities;

  Region({
    this.id,
    this.title,
    this.cities,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
      id: json["id"],
      title: json["title"],
      cities: json["cities"] == null ? [] : List<City>.from(json["cities"]!.map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "title": title,
  "cities": cities == null ? [] : List<dynamic>.from(cities!.map((x) => x.toJson())),
};
}



// class NearBranchModel {
//   Data? data;
//   String? message;
//   int? code;
//
//   NearBranchModel({
//     this.data,
//     this.message,
//     this.code,
//   });
//
//   factory NearBranchModel.fromJson(Map<String, dynamic> json) => NearBranchModel(
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     message: json["message"],
//     code: json["code"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data?.toJson(),
//     "message": message,
//     "code": code,
//   };
// }
//
// class Data {
//   int? id;
//   String? title;
//   int? regionId;
//   Region? region;
//   int? cityId;
//   City? city;
//   double? longitude;
//   double? latitude;
//   double? distance;
//   bool? isMain;
//
//   Data({
//     this.id,
//     this.title,
//     this.regionId,
//     this.region,
//     this.cityId,
//     this.city,
//     this.longitude,
//     this.latitude,
//     this.distance,
//     this.isMain,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     title: json["title"],
//     regionId: json["region_id"],
//     region: json["region"] == null ? null : Region.fromJson(json["region"]),
//     cityId: json["city_id"],
//     city: json["city"] == null ? null : City.fromJson(json["city"]),
//     longitude: json["longitude"]?.toDouble(),
//     latitude: json["latitude"]?.toDouble(),
//     distance: json["distance"]?.toDouble(),
//     isMain: json["is_main"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "region_id": regionId,
//     "region": region?.toJson(),
//     "city_id": cityId,
//     "city": city?.toJson(),
//     "longitude": longitude,
//     "latitude": latitude,
//     "distance": distance,
//     "is_main": isMain,
//   };
// }
//
// class City {
//   int? id;
//   String? title;
//   int? regionId;
//
//   City({
//     this.id,
//     this.title,
//     this.regionId,
//   });
//
//   factory City.fromJson(Map<String, dynamic> json) => City(
//     id: json["id"],
//     title: json["title"],
//     regionId: json["region_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "region_id": regionId,
//   };
// }
//
// class Region {
//   int? id;
//   String? title;
//   List<City>? cities;
//
//   Region({
//     this.id,
//     this.title,
//     this.cities,
//   });
//
//   factory Region.fromJson(Map<String, dynamic> json) => Region(
//       id: json["id"],
//       title: json["title"],
//       cities: json["cities"] == null ? [] : List<City>.from(json["cities"]!.map((x) => City.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//   "id": id,
//   "title": title,
//   "cities": cities == null ? [] : List<dynamic>.from(cities!.map((x) => x.toJson())),
// };
// }

