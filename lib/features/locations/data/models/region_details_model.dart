class RegionDetailsModel {
  String? name;
  String? governorate;
  bool? isActive;
  bool? isDeleted;
  num? deliveryFee;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  RegionDetailsModel({
    this.name,
    this.governorate,
    this.isActive,
    this.isDeleted,
    this.deliveryFee,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory RegionDetailsModel.fromJson(Map<String, dynamic> json) =>
      RegionDetailsModel(
        name: json['name'],
        governorate: json['governorate'],
        isActive: json['isActive'],
        isDeleted: json['isDeleted'],
        deliveryFee: json['deliveryFee'],
        id: json['_id'],
        createdAt: DateTime.tryParse(json['createdAt'])?.toLocal(),
        updatedAt: DateTime.tryParse(json['updatedAt'])?.toLocal(),
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'governorate': governorate,
    'isActive': isActive,
    'isDeleted': isDeleted,
    'deliveryFee': deliveryFee,
  };
}
