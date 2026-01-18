class CityDetailsModel {
  String? name;
  bool? isActive;
  bool? isDeleted;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  CityDetailsModel({
    this.name,
    this.isActive,
    this.isDeleted,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory CityDetailsModel.fromJson(Map<String, dynamic> json) =>
      CityDetailsModel(
        name: json['name'],
        isActive: json['isActive'],
        isDeleted: json['isDeleted'],
        id: json['_id'],
        createdAt: DateTime.tryParse(json['createdAt'])?.toLocal(),
        updatedAt: DateTime.tryParse(json['updatedAt'])?.toLocal(),
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'isActive': isActive,
    'isDeleted': isDeleted,
    '_id': id,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
