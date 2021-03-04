import 'package:mock_creator_annotation/mock_creator_annotation.dart';
import 'package:quiver_hashcode/hashcode.dart';
import 'package:test/test.dart';
import 'package:value_t2_annotation/value_t2_annotation.dart';

part 'ex8_test.mock.dart';
part 'ex8_test.valuet2.dart';

//VALUE_T WORKS WITH MOCK_CREATOR

main() {
  test("1", () {
    var fn = Blah();
    var result = fn();
    expect(result.a, "a");
  });
}

@MockCreator()
class Blah {
  A call() => A(a: "a");
}

@ValueT2()
abstract class $A {
  String get a;
}
