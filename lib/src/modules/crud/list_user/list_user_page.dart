import 'package:flutter/material.dart';

import 'package:counter_bloc/src/core/theme/app_colors.dart';
import 'package:counter_bloc/src/core/theme/app_dimension.dart';
import 'package:counter_bloc/src/core/theme/app_fonts.dart';
import 'package:counter_bloc/src/modules/crud/list_user/list_user_controller/list_user_bloc.dart';
import 'package:counter_bloc/src/modules/crud/list_user/list_user_controller/list_user_state.dart';
import 'package:counter_bloc/src/routes/routes.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({
    Key? key,
    required this.listUserBloc,
  }) : super(key: key);

  final ListUserBloc listUserBloc;

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  late final ListUserBloc controller = widget.listUserBloc;

  @override
  void initState() {
    controller.getUsers();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimension.size_2,
          horizontal: AppDimension.size_3,
        ),
        child: Column(
          children: [
            Text(
              'Lista de usuários',
              style: AppFonts.titleLarge(),
            ),
            const SizedBox(
              height: AppDimension.size_3,
            ),
            StreamBuilder<ListUserState>(
              stream: controller.listUserOut,
              builder: (context, snapshot) {
                final dataValue = snapshot.data;

                if (dataValue is ListUserLoadingState) {
                  return _buildLoading();
                }

                if (dataValue is ListUserErrorState) {
                  return _buildError(dataValue);
                }

                if (dataValue!.users.isEmpty) {
                  return _buildEmpty();
                }

                return _buildListUser(dataValue);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.formPage).whenComplete(
          () => controller.getUsers(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListUser(ListUserState dataValue) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (_, index) {
          final user = dataValue.users[index];

          return ListTile(
            title: Text(user.name),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete_forever_outlined,
              ),
              onPressed: () => controller.removeUser(user),
            ),
          );
        },
        itemCount: dataValue.users.length,
      ),
    );
  }

  Widget _buildEmpty() {
    return Expanded(
      child: Center(
        child: Text(
          'Lista vazia',
          style: AppFonts.titleLarge(),
        ),
      ),
    );
  }

  Widget _buildError(ListUserErrorState dataValue) {
    return Expanded(
      child: Center(
        child: Text(
          dataValue.message,
          style: AppFonts.titleLarge(color: AppColors.red),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
