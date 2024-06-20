part of 'service.dart';

class UserService {
  Future<List<User>> fetchUsers({int page = 1}) async {
    int perPage = 10;
    final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=$page&per_page=$perPage'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List<User> users = [];
      for (var user in jsonData['data']) {
        users.add(User.fromJson(user));
      }
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
