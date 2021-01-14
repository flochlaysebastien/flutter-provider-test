import 'package:test/test.dart';
import 'package:testing_app/models/favorites.dart';

void main() {
  group('App Provider Tests', () {
    var provider = FavoriteProvider();

    test('A new item should be added', () {
      var number = 35;
      provider.add(number);
      expect(provider.items.contains(number), true);
    });

    test('An item should be removed', () {
      var number = 45;
      provider.add(number);
      expect(provider.items.contains(number), true);
      provider.remove(number);
      expect(provider.items.contains(number), false);
    });
  });
}
