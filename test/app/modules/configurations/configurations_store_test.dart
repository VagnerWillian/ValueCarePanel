import 'package:flutter_test/flutter_test.dart';
import 'package:value_panel/app/modules/configurations/ui/configurations_store.dart';
 
void main() {
  late ConfigurationsStore store;

  setUpAll(() {
    store = ConfigurationsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}