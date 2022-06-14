import 'dart:async';

import 'package:counter_bloc/src/modules/crud/list_user/list_user_controller/list_user_state.dart';
import 'package:counter_bloc/src/repositories/user/user_repository_impl.dart';

class ListUserBloc {
  final _listUserStreamController = StreamController<ListUserState>();
  Stream<ListUserState> get listUserOut => _listUserStreamController.stream;

  final repo = UserRepositoryImpl();

  Future<void> getUsers() async {
    try {
      _listUserStreamController.add(ListUserLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      _listUserStreamController.add(ListUserState(users: repo.getUsers()));
    } on Exception {
      _listUserStreamController.add(ListUserErrorState(message: 'Erro ao carregar lista'));
    }
  }
}
