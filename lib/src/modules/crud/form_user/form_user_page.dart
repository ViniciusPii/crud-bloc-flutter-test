import 'package:counter_bloc/src/core/theme/app_dimension.dart';
import 'package:counter_bloc/src/models/user_model.dart';
import 'package:counter_bloc/src/modules/crud/form_user/form_user_controller/form_user_bloc.dart';
import 'package:counter_bloc/src/modules/crud/form_user/form_user_controller/form_user_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FormUserPage extends StatefulWidget {
  const FormUserPage({Key? key}) : super(key: key);

  @override
  State<FormUserPage> createState() => _FormUserPageState();
}

class _FormUserPageState extends State<FormUserPage> {
  final controller = GetIt.I.get<FormUserBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimension.size_2,
          horizontal: AppDimension.size_3,
        ),
        child: Center(
          child: StreamBuilder<Object>(
              stream: controller.formUserOut,
              builder: (context, snapshot) {
                final dataValue = snapshot.data;

                if (dataValue is FormUserLoadingState) {
                  return const CircularProgressIndicator();
                }

                return ElevatedButton(
                  onPressed: () {
                    controller.addUser(UserModel(name: 'Vinicius'));
                    Navigator.pop(context);
                  },
                  child: const Text('Adicionar'),
                );
              }),
        ),
      ),
    );
  }
}
