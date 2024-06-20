import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:suitmedia_test_intern/models/model.dart';
import 'package:suitmedia_test_intern/models/pagination.dart';
import 'package:suitmedia_test_intern/services/service.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  UserService _userService = UserService();

  Future<void> fetchUsers({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _users.clear();
      _hasMore = true;
    }

    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    notifyListeners();

    try {
      UsersResponse response = await _userService.getUsers(_currentPage, 10);
      _users.addAll(response.data);
      _currentPage++;
      _hasMore = (_currentPage <= response.totalPages);
    } catch (e) {
      print('Error fetching users: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
