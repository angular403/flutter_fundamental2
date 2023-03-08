import 'package:flutter_fundamental/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Default User Test', () {
    User user = User();

    test('User has an id with type int ', () {
      expect(user.id, isA<int>());
    });

    test('User has an id with type String ', () {
      expect(user.name, isA<String>());
    });

    test('Default id = 0. Default name = "No Name" ', () {
      expect(user.id, equals(0));
    });
  });

  group('Default User Test', () {
    User user1 = User(id: 1);
    User user2 = User(name: 'andrew');
    User user3 = User(id: 1, name: 'andrew');

    test('Single Parameter(id) is valid', () {
      expect(user1.id, equals(1));
      expect(user1.name, equals('No Name'));
    });

    test('Single Parameter(name) is valid', () {
      expect(user2.id, equals(0));
      expect(user2.name, equals('andrew'));
    });
    test('All parameters are correct', () {
      expect(user3.id, equals(1));
      expect(user3.name, equals('andrew'));
    });
  });
}
