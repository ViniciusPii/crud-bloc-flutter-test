import 'package:counter_bloc/src/modules/counter/counter_page.dart';
import 'package:counter_bloc/src/modules/crud/list_user/list_user_page.dart';
import 'package:counter_bloc/src/modules/home/home_page.dart';

class Routes {
  static const home = '/';
  static const counterPage = '/counter';
  static const crudPage = '/crud';

  final routes = {
    home: (context) => const HomePage(),
    crudPage: (context) => const ListUserPage(),
    counterPage: (context) => const CounterPage(),
  };
}
