import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:suitmedia_test_intern/models/model.dart';
import 'package:suitmedia_test_intern/services/service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;
  List<User> _users = [];
  bool _hasReachedMax = false;

  UserBloc({required this.userService}) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
    on<LoadNextPage>(_onLoadNextPage);
  }

  void _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    try {
      if (state is UserInitial || event.page == 1) {
        emit(UserLoading());
      }

      List<User> users = await userService.fetchUsers(page: event.page);

      _users.addAll(users);
      _hasReachedMax = users.isEmpty;

      if (_users.isEmpty) {
        emit(UserEmpty());
      } else {
        emit(UserLoaded(users: List.of(_users), hasReachedMax: _hasReachedMax));
      }
    } catch (e) {
      emit(UserError('Failed to load users'));
    }
  }

  void _onLoadNextPage(LoadNextPage event, Emitter<UserState> emit) async {
    try {
      if (!_hasReachedMax) {
        int nextPage = _users.length ~/ 10 + 1;

        List<User> users = await userService.fetchUsers(page: nextPage);

        _users.addAll(users);
        _hasReachedMax = users.isEmpty;

        emit(UserLoaded(users: List.of(_users), hasReachedMax: _hasReachedMax));
      }
    } catch (e) {
      emit(UserError('Failed to load next page'));
    }
  }
}
