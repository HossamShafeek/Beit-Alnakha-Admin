class DepartmentDetailsModel {
  String? id;
  String? name;
  String? image;
  bool? isActive;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  DepartmentDetailsModel({
    this.id,
    this.name,
    this.image,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });
  factory DepartmentDetailsModel.fromJson(Map<String, dynamic> json) {
    return DepartmentDetailsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      isActive: json['isActive'],
      isDeleted: json['isDeleted'],
      createdAt: DateTime.tryParse(json['createdAt'])?.toLocal(),
      updatedAt: DateTime.tryParse(json['updatedAt'])?.toLocal(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
