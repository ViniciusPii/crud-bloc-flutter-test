import 'package:counter_bloc/src/routes/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, Routes.counterPage),
              child: const Text('Counter'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, Routes.crudPage),
              child: const Text('CRUD'),
            ),
          ],
        ),
      ),
    );
  }
}
