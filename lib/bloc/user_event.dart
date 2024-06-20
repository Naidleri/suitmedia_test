part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class FetchUsers extends UserEvent {
  final int page;

  const FetchUsers(this.page);

  @override
  List<Object?> get props => [page];
}

class LoadNextPage extends UserEvent {
  const LoadNextPage();

  @override
  List<Object?> get props => [];
}

class RefreshUsers extends UserEvent {
  final int page;

  const RefreshUsers({required this.page});

  @override
  List<Object> get props => [page];
}
