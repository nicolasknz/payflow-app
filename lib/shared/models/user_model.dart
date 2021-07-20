import 'dart:convert';
// Data model dart

class UserModel {
  final String name;
  final String? photoURL;

  UserModel({
    required this.name,
    this.photoURL,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoURL: map['photoUrl'],
    );
  }

  factory UserModel.fromJson(String json) => UserModel.fromMap(
        jsonDecode(json),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoUrl": photoURL,
      };

  String toJson() => jsonEncode(toMap());
}
