import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

//part 'ex3_test.g.dart';

//COMPARE WITH MOCKITO

class A {
  String call({
    @required String x,
  }) {
    return x + "blah";
  }
}

class MockA extends Mock implements A {}

main() {
  test("1", () {
    var a = A();
    var result = a(x: "x");

    var myMock = MockA();
    when(myMock.call(x: anyNamed('x'))).thenReturn("blah");

    expect(result.toString(), "xblah");
    expect(myMock(x: "sdf"), "blah");
  });
}
