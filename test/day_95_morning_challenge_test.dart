import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test 1', () {
    String string = 'bedbathandbeyond';
    expect(reconstructString(['bed', 'bedbath', 'and', 'beyond',], string), equals(['bedbath', 'and', 'beyond',]));

  });
}
