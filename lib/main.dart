import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/bloc/counter_bloc.dart';
import 'package:flutter_fundamental/main_page.dart';
import 'package:flutter_fundamental/number_card.dart';
import 'package:flutter_fundamental/timeline.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class counterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterState counterState = context.watch<CounterBloc>().state;
    int number = context.select<CounterBloc, int>((CounterBloc) =>
        (CounterBloc.state is CounterValue)
            ? (CounterBloc.state as CounterValue).value
            : null);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Bloc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return NumberCard("Bloc\nBuilder",
                      (state is CounterValue) ? state.value : null);
                },
              ),
              SizedBox(width: 40),
              NumberCard("Watch",
                  (counterState is CounterValue) ? counterState.value : null),
              SizedBox(width: 40),
              NumberCard("Select", number),
            ],
          ),
          SizedBox(height: 40),
          RaisedButton(
            onPressed: () {
              context.read<CounterBloc>().add(Increment());
            },
            child: Text(
              'INCREMENT',
              style: TextStyle(color: Colors.white),
            ),
            shape: StadiumBorder(),
            color: Colors.green[800],
          )
        ],
      ),
    );
  }
}
