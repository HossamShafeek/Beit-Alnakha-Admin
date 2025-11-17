class User {
  String? id;
  String? phone;
  String? name;
  String? role;

  User({this.id, this.phone, this.name, this.role});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['_id'] as String?,
    phone: json['phone'] as String?,
    name: json['name'] as String?,
    role: json['role'] as String?,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'phone': phone,
    'name': name,
    'role': role,
  };
}
