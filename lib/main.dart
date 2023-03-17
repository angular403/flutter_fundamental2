import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/pages/pages.dart';
import 'package:flutter_fundamental/person.dart';
import 'package:flutter_fundamental/personCard.dart';
import 'package:flutter_fundamental/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await EasyLocalization.ensureInitialized();

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
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: GoogleSignInPage(),
    );
  }
}

class LatihanTdd extends StatefulWidget {
  const LatihanTdd({Key? key}) : super(key: key);

  @override
  State<LatihanTdd> createState() => _LatihanTddState();
}

class _LatihanTddState extends State<LatihanTdd> {
  TextEditingController controller = TextEditingController(text: '0');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TDD DEMO')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // user == null ? const Text('no data') : Text('ID: ${user!.id}'),
          // if (user != null) Text('Name: ${user!.name}'),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: TextField(
                    controller: controller, keyboardType: TextInputType.number),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                  onPressed: () async {
                    // user = await UserRepository()
                    //     .getUser(int.tryParse(controller.text) ?? 0);

                    // setState(() {});
                  },
                  child: const Text('Get User')),
            ],
          )
        ],
      ),
    );
  }
}

class LatihanDio extends StatefulWidget {
  LatihanDio({Key? key}) : super(key: key);

  @override
  State<LatihanDio> createState() => _LatihanDioState();
}

class _LatihanDioState extends State<LatihanDio> {
  Person? person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan DIO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            person != null ? PersonCard(person: person!) : Text('no data'),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () async {
                Person? result = await Services.getById(2);

                if (result != null) {
                  setState(() {
                    person = result;
                  });
                }
              },
              child: Text('GET'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Person? result = await Services.createUser(
                    'Andrew', 'wiliam', 'andrew@gmail.com');

                if (result != null) {
                  setState(() {
                    person = result;
                  });
                }
              },
              child: Text('POST'),
            ),
          ],
        ),
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
