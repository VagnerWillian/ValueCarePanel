import 'package:flutter_test/flutter_test.dart';
import 'package:value_panel/app/modules/patients/ui/patients_store.dart';

void main() {
  late PatientsStore store;

  setUpAll(() {
    store = PatientsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}