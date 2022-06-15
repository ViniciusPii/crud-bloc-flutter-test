import 'dart:async';

import 'package:counter_bloc/src/models/user_model.dart';
import 'package:counter_bloc/src/modules/crud/list_user/list_user_controller/list_user_state.dart';
import 'package:counter_bloc/src/services/user/user_service.dart';
import 'package:get_it/get_it.dart';

class ListUserBloc {
  final _userService = GetIt.I.get<UserService>();

  final _listUserStreamController = StreamController<ListUserState>();
  Stream<ListUserState> get listUserOut => _listUserStreamController.stream;

  void getUsers() async {
    try {
      _listUserStreamController.add(ListUserLoadingState());
      await Future.delayed(const Duration(milliseconds: 500));
      // throw Exception();
      _listUserStreamController.add(ListUserState(users: _userService.getUsers()));
    } on Exception {
      _listUserStreamController.add(ListUserErrorState(message: 'Erro ao carregar lista'));
    }
  }

  void removeUser(UserModel user) async {
    try {
      _listUserStreamController.add(ListUserLoadingState());
      await Future.delayed(const Duration(milliseconds: 500));
      // throw Exception();
      _listUserStreamController.add(ListUserState(users: _userService.removeUser(user)));
    } on Exception {
      _listUserStreamController.add(ListUserErrorState(message: 'Erro ao remover um usuário'));
    }
  }

  void addUser(UserModel user) async {
    try {
      _listUserStreamController.add(ListUserLoadingState());
      await Future.delayed(const Duration(milliseconds: 500));
      // throw Exception();
      _listUserStreamController.add(ListUserState(users: _userService.addUser(user)));
    } on Exception {
      _listUserStreamController.add(ListUserErrorState(message: 'Erro ao adicionar um usuário'));
    }
  }

  void dispose() {
    _listUserStreamController.close();
  }
}
