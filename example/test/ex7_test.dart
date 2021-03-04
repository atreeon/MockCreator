import 'package:mock_creator_annotation/mock_creator_annotation.dart';
import 'package:test/test.dart';

part 'ex7_test.mock.dart';

//NULLABLE & NULL SAFE

main() {
  test("1", () {
    var fn = Add2();
    var result = fn(1, null, val3: 3);

    expect(result, 5);
  });
}

@MockCreator()
class Add2 {
  int call(int val, int? val2, {required double val3, int? val4}) {
    return val + (val2 ?? 0) + val3.toInt() + (val4 ?? 0) + 1;
  }
}
