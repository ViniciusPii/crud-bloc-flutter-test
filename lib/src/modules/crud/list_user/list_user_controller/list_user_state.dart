import 'package:counter_bloc/src/models/user_model.dart';

class ListUserState {
  ListUserState({
    required this.users,
  });

  final List<UserModel> users;
}

class ListUserLoadingState extends ListUserState {
  ListUserLoadingState() : super(users: []);
}

class ListUserErrorState extends ListUserState {
  ListUserErrorState({
    required this.message,
  }) : super(users: []);

  final String message;
}
