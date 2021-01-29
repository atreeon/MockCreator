import 'package:mock_creator_annotation/mock_creator_annotation.dart';
import 'package:test/test.dart';

part 'ex6_test.g.dart';

main() {
  test("1", () {
    var fn = Add2();
    var result = fn(5, val2: 2.0);

    expect(result, 8);
  });
}

@MockCreator()
class Add2 {
  int call(int val, {required double val2}) {
    return val + val2.toInt() + 1;
  }
}
