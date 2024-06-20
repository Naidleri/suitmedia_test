part of 'service.dart';

class UserService {
  Future<UsersResponse> getUsers(int page, int perPage) async {
    String url = 'https://reqres.in/api/users?page=$page&per_page=$perPage';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return UsersResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
