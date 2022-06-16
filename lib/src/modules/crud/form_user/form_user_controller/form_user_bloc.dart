import 'dart:async';

import 'package:counter_bloc/src/models/user_model.dart';
import 'package:counter_bloc/src/modules/crud/form_user/form_user_controller/form_user_state.dart';
import 'package:counter_bloc/src/services/user/user_service.dart';

class FormUserBloc {
  FormUserBloc({
    required UserService userService,
  }) : _userService = userService;

  final UserService _userService;

  final _formUserStreamController = StreamController<FormUserState>();
  Stream<FormUserState> get formUserOut => _formUserStreamController.stream;

  Future<void> addUser(UserModel user) async {
    _formUserStreamController.add(FormUserLoadingState());
    await Future.delayed(const Duration(milliseconds: 500));
    _userService.addUser(user);
  }

  void dispose() {
    _formUserStreamController.close();
  }
}
