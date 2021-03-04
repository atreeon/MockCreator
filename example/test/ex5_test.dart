import 'package:mock_creator_annotation/mock_creator_annotation.dart';
import 'package:test/test.dart';

part 'ex5_test.mock.dart';

//SUPPORT MIXED NAMED AND POSITIONAL PARAMETERS

@MockCreator()
class A {
  String call(
    String param1, {
    required String param2,
  }) {
    return param1 + "blah";
  }
}

main() {
  test("1", () {
    var a = A();
    var result = a("x", param2: "y");
    var myMock = A_Mock((a, {required b}) => "blah");

    expect(result.toString(), "xblah");
    expect(myMock("x", param2: "x"), "blah");
  });
}
