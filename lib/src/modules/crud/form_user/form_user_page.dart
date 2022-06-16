import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import 'package:counter_bloc/src/core/theme/app_colors.dart';
import 'package:counter_bloc/src/core/theme/app_dimension.dart';
import 'package:counter_bloc/src/models/user_model.dart';
import 'package:counter_bloc/src/modules/crud/form_user/form_user_controller/form_user_bloc.dart';
import 'package:counter_bloc/src/modules/crud/form_user/form_user_controller/form_user_state.dart';

class FormUserPage extends StatefulWidget {
  const FormUserPage({
    Key? key,
    required this.formUserBloc,
  }) : super(key: key);

  final FormUserBloc formUserBloc;

  @override
  State<FormUserPage> createState() => _FormUserPageState();
}

class _FormUserPageState extends State<FormUserPage> {
  late final FormUserBloc controller = widget.formUserBloc;

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    controller.dispose();
    super.dispose();
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameEC,
                  decoration: const InputDecoration(
                    filled: true,
                    isDense: true,
                    hintText: 'Ex: Fulano',
                    labelText: 'Digite um nome',
                    fillColor: AppColors.crimson50,
                  ),
                  validator: Validatorless.required('Campo obrigatório'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(
                  height: AppDimension.size_3,
                ),
                StreamBuilder<Object>(
                  stream: controller.formUserOut,
                  builder: (context, snapshot) {
                    final dataValue = snapshot.data;

                    if (dataValue is FormUserLoadingState) {
                      return const CircularProgressIndicator();
                    }

                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.addUser(UserModel(name: _nameEC.text));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Adicionar'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
