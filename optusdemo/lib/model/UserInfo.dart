class UserInfo {

  final String? username;
  final String? password;
  final String? isLogin;

  UserInfo(
      {this.username,
        this.password,
        this.isLogin,});


  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      username: json['username'] as String?,
      password: json['password'] as String?,
      isLogin: json['isLogin'] as String?,
    );
  }
}