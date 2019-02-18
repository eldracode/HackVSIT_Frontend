class UserModel {
  bool status;
  String message;
  Account account;

  UserModel({this.status, this.message, this.account});

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
        status: parsedJson['status'],
        message: parsedJson['message'],
        account: Account.fromJson(parsedJson['account']));
  }
}

class Account {
  String token;

  Account({this.token});

  factory Account.fromJson(Map<String, String> json) {
    return Account(token: json['token']);
  }
}
