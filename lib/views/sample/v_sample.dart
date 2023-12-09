import 'package:flutter/material.dart';
import 'package:myapp/bloc/sample/sample_bloc.dart';

class Sample extends StatelessWidget {
  static String routeName = '/sample';
  Sample({super.key});

  final CounterBloc bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sample',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: bloc.output,
                initialData: bloc.counter,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  );
                }),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      bloc.input.add("remove");
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      bloc.input.add("add");
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
