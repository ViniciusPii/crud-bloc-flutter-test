import 'package:counter_bloc/src/core/theme/app_dimension.dart';
import 'package:counter_bloc/src/core/theme/app_fonts.dart';
import 'package:counter_bloc/src/modules/crud/list_user/list_user_controller/list_user_bloc.dart';
import 'package:counter_bloc/src/modules/crud/list_user/list_user_controller/list_user_state.dart';
import 'package:counter_bloc/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  final controller = GetIt.I.get<ListUserBloc>();

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
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      final user = dataValue?.users[index];

                      return ListTile(
                        title: Text(user?.name ?? ''),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_forever_outlined,
                          ),
                          onPressed: () => controller.removeUser(user!),
                        ),
                      );
                    },
                    itemCount: dataValue?.users.length,
                  ),
                );
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
}
