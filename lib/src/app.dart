import 'package:counter_bloc/src/core/theme/app_theme.dart';
import 'package:counter_bloc/src/routes/routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: Routes().routes,
      theme: AppTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
