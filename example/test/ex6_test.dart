import 'package:mock_creator_annotation/mock_creator_annotation.dart';
import 'package:test/test.dart';

part 'ex6_test.g.dart';

main() {
  test("1", () {
    fn_Add2 fn;
    fn = Add2();

    var result = fn(1, val2: 2);
    expect(result, 4);
  });
}

@MockCreator()
class Add2 {
  int call(int val, {double val2}) {
    return val + val2.toInt() + 1;
  }
}
