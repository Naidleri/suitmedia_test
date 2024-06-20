import 'package:suitmedia_test_intern/models/model.dart';

class UsersResponse {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;

  UsersResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory UsersResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<User> users = list.map((user) => User.fromJson(user)).toList();

    return UsersResponse(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: users,
    );
  }
}
