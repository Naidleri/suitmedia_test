import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_intern/models/model.dart';
import 'package:suitmedia_test_intern/providers/user_provider.dart';
import 'package:suitmedia_test_intern/views/screen2.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshIndicatorKey.currentState?.show();
    });
  }

  Future<void> _refreshUsers(BuildContext context) async {
    await Provider.of<UserProvider>(context, listen: false)
        .fetchUsers(refresh: true);
  }

  Future<void> _loadMoreUsers(BuildContext context) async {
    await Provider.of<UserProvider>(context, listen: false).fetchUsers();
  }

  void _selectUser(String userName) {
    Navigator.pop(context, userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/screen2');
          },
          child: Image.asset("assets/images/ic_back@3x.png"),
        ),
        shape: const Border(
            bottom: BorderSide(
                width: 1, color: Color.fromARGB(179, 182, 182, 182))),
        title: const Text(
          "Third Screen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          return RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () => _refreshUsers(context),
            child: ListView.builder(
              itemCount:
                  userProvider.users.length + (userProvider.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < userProvider.users.length) {
                  User user = userProvider.users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text(
                      user.fullName,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      user.email,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () => _selectUser(user.fullName),
                  );
                } else {
                  if (!userProvider.isLoading) {
                    _loadMoreUsers(context);
                  }
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
