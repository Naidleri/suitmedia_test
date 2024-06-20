import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:suitmedia_test_intern/bloc/user_bloc.dart';
import 'package:suitmedia_test_intern/models/model.dart';
import 'package:suitmedia_test_intern/services/service.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final UserBloc _userBloc = UserBloc(userService: UserService());

  @override
  void initState() {
    super.initState();
    _userBloc.add(FetchUsers(1)); // Load initial page (page 1)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom:
              BorderSide(width: 1, color: Color.fromARGB(179, 182, 182, 182)),
        ),
        title: const Text(
          "Third Screen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: _userBloc,
        builder: (context, state) {
          if (state is UserLoading && state is UserInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                User user = state.users[index];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.network(
                            user.avatar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${user.firstName} ${user.lastName}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            user.email,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is UserEmpty) {
            return Center(child: Text('No users found.'));
          } else if (state is UserError) {
            return Center(child: Text('Failed to load users: ${state.error}'));
          } else {
            return Center(child: Text('Unknown state.'));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _userBloc.close();
    super.dispose();
  }
}
