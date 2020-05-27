import 'package:mock_creator_annotation/mock_creator_annotation.dart';
import 'package:test/test.dart';

part 'ex4_test.g.dart';

//SUPPORT ZERO PARAMETERS

@MockCreator()
class A {
  String call() {
    return "blah";
  }
}

main() {
  test("1", () {
    var a = A();
    var result = a();
    var myMock = A_Mock(() => "xblah");

    expect(result.toString(), "blah");
    expect(myMock(), "xblah");
  });
}
