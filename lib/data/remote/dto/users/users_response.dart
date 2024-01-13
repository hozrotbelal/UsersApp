import 'package:usersapp/data/remote/dto/users/users.dart';

class UsersResponse {
  bool? success;
  String? message;
  int? totalUsers;
  int? offset;
  int? limit;
  List<Users>? users;

  UsersResponse({this.success, this.message, this.totalUsers, this.offset, this.limit, this.users});

  UsersResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    totalUsers = json['total_users'];
    offset = json['offset'];
    limit = json['limit'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['total_users'] = totalUsers;
    data['offset'] = offset;
    data['limit'] = limit;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
