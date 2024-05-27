class User {
  int userId;
  String name;
  String password;
  String role;
  String email;

  User(
      {required this.userId,
      required this.name,
      required this.password,
      required this.role,
      required this.email});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['user_id'],
      name: map['name'],
      password: map['password'],
      role: map['role'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'name': name,
      'password': password,
      'role': role,
      'email': email,
    };
  }
}
