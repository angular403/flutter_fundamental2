import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/bloc/user_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('id'),
        Locale('en', 'US'),
      ],
      path: 'assets/translations',
      startLocale: Locale('id'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: MultiLanguage(),
      ),
    );
  }
}

class MultiLanguage extends StatelessWidget {
  const MultiLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Language App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('greeting').tr(),
              const SizedBox(height: 10),
              const Text('name')
                  .tr(args: ['Andrew Wiliam Napitupulu', 'Indonesia']),
              const SizedBox(height: 10),
              const Text('film')
                  .tr(namedArgs: {'title': 'My Name', 'platform': 'Netflix'}),
              const SizedBox(height: 10),
              const Text('character').tr(gender: 'female'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(Locale('id'));
                    },
                    child: Text('Indonesia'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale('en_US'.toLocale());
                    },
                    child: Text('US English'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Text('Welcome ${state.user.name}');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return Text(
                    'Hi.. My Name ${state.user.name} and my age is  ${state.user.age} year');
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  context.read<UserBloc>().add(BirthdayEvent());
                },
                child: Text('Birthday')),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  fillColor: Colors.lightBlue[50],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Change Name'),
              onPressed: () {
                context.read<UserBloc>().add(ChangeNameEvent(controller.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
