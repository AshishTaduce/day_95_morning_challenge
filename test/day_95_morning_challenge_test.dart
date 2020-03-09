import 'package:test/test.dart';

void main() {
  test('Test 1', () {
    String string = 'bedbathandbeyond';
    expect(reconstructString(), equals(['foo', 'bar', 'baz']));
  });

  test('String.trim() removes surrounding whitespace', () {
    var string = '  foo ';
    expect(string.trim(), equals('foo'));
  });
}
