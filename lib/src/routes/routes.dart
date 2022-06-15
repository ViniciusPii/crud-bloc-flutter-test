import 'package:counter_bloc/src/modules/counter/counter_page.dart';
import 'package:counter_bloc/src/modules/crud/form_user/form_user_page.dart';
import 'package:counter_bloc/src/modules/crud/list_user/list_user_page.dart';
import 'package:counter_bloc/src/modules/home/home_page.dart';

class Routes {
  static const home = '/';
  static const crudPage = '/crud';
  static const formPage = '/form';
  static const counterPage = '/counter';

  final routes = {
    home: (context) => const HomePage(),
    crudPage: (context) => const ListUserPage(),
    formPage: (context) => const FormUserPage(),
    counterPage: (context) => const CounterPage(),
  };
}
