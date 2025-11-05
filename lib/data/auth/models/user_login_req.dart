class UserLoginReq {
  String? email;
  String? password;

  UserLoginReq({
    required this.email,
    this.password,
  });
}