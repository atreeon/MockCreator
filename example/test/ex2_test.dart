import 'package:mock_creator_annotation/mock_creator_annotation.dart';
import 'package:test/test.dart';

part 'ex2_test.g.dart';

//SUPPORT NAMED PARAMETERS

@MockCreator()
class A {
  String call({
    required String param1,
    required String param2,
  }) {
    return param1 + "blah";
  }
}

main() {
  test("1", () {
    var a = A();
    var result = a(param1: "x", param2: "y");
    var myMock = A_Mock(({required a, required b}) => "blah");

    expect(result.toString(), "xblah");
    expect(myMock(param1: "", param2: ""), "blah");
  });
}
