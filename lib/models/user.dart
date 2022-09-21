enum UserType { particular, professional }

class User {
  String? id;
  String? password;
  String name;
  String email;
  DateTime? createdAt;
  String? phone;

  UserType userType;

  User({
    this.id,
    required this.email,
    required this.name,
    this.password,
    this.userType = UserType.particular,
    this.createdAt,
    this.phone,
  });
}
