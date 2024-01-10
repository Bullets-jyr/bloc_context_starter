import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Context',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}',
                    style: TextStyle(fontSize: 52.0),
                  ),
                  ElevatedButton(
                    child: Text(
                      'Increment',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}',
          style: TextStyle(fontSize: 52.0),
        ),
        ElevatedButton(
          child: Text(
            'Increment',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
            BlocProvider.of<CounterCubit>(context).increment();
          },
        ),
      ],
    );
  }
}