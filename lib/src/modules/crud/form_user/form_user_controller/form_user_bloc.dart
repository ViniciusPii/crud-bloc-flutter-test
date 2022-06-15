import 'dart:async';

import 'package:counter_bloc/src/models/user_model.dart';
import 'package:counter_bloc/src/modules/crud/form_user/form_user_controller/form_user_state.dart';
import 'package:counter_bloc/src/repositories/user/user_repository.dart';
import 'package:get_it/get_it.dart';

class FormUserBloc {
  final _userService = GetIt.I.get<UserRepository>();

  final _formUserStreamController = StreamController<FormUserState>();
  Stream<FormUserState> get formUserOut => _formUserStreamController.stream;

  Future<void> addUser(UserModel user) async {
    _formUserStreamController.add(FormUserLoadingState());
    await Future.delayed(const Duration(milliseconds: 500));
    _userService.addUser(user);
  }
}
