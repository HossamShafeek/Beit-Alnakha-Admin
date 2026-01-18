class SliderDetailsModel {
  String? title;
  String? image;
  String? refModel; // "product" or others
  String? document; // ID reference
  bool? isActive;
  bool? isDeleted;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  SliderDetailsModel({
    this.title,
    this.image,
    this.refModel,
    this.document,
    this.isActive,
    this.isDeleted,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory SliderDetailsModel.fromJson(Map<String, dynamic> json) =>
      SliderDetailsModel(
        title: json['title'],
        image: json['image'],
        refModel: json['refModel'],
        document: json['document'],
        isActive: json['isActive'],
        isDeleted: json['isDeleted'],
        id: json['_id'],
        createdAt: json['createdAt'] != null
            ? DateTime.tryParse(json['createdAt'])?.toLocal()
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.tryParse(json['updatedAt'])?.toLocal()
            : null,
      );

  Map<String, dynamic> toJson() => {
    'title': title,
    'image': image,
    'refModel': refModel,
    'document': document,
    'isActive': isActive,
    'isDeleted': isDeleted,
    '_id': id,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
