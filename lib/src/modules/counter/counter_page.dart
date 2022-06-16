import 'package:counter_bloc/src/core/theme/app_colors.dart';
import 'package:counter_bloc/src/core/theme/app_dimension.dart';
import 'package:counter_bloc/src/core/theme/app_fonts.dart';
import 'package:counter_bloc/src/modules/counter/counter_controller/counter_bloc.dart';
import 'package:counter_bloc/src/modules/counter/counter_controller/counter_state.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key, required this.counterBloc}) : super(key: key);

  final CounterBloc counterBloc;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late final CounterBloc controller = widget.counterBloc;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Numeros de vezes que você clicou',
              style: AppFonts.bodyLarge(),
            ),
            StreamBuilder<CounterState>(
              stream: controller.counterOut,
              builder: (context, snapshot) {
                final dataValue = snapshot.data;

                if (dataValue is CounterStateLoading) {
                  return const Center(
                    child: SizedBox(
                      width: AppDimension.size_3,
                      height: AppDimension.size_3,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (dataValue is CounterStateError) {
                  return Text(
                    dataValue.message,
                    style: AppFonts.titleLarge(
                      color: AppColors.red,
                    ),
                  );
                }

                return Text(
                  snapshot.data?.counter.toString() ?? '0',
                  style: AppFonts.titleLarge(),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
