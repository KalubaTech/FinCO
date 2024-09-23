class UserModel {
  String uid;
  String firstname;
  String lastname;
  String phone;
  String email;
  String picture;
  String dateJoined;
  String role;

  UserModel({
    required this.uid,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.picture,
    required this.dateJoined,
    required this.role
  });
}