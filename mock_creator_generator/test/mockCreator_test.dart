import 'package:mock_creator_generator/src/createMockCreator.dart';
import 'package:mock_creator_generator/src/helpers.dart';
import 'package:test/test.dart';

void main() {
  group("createMockCreator", () {
    test("1", () {
      var className = "Stuffer";
      var returnType = "List<String>";
      var params = ["String", "List<String>"];

      var result = createMockCreator(
        className: className,
        returnType: returnType,
        paramsNormal: params, paramsNamed: <NameType>[],
      );

      var expected = """class Stuffer_Mock extends Stuffer {
final List<String> Function(String a, List<String> b) fn;
Stuffer_Mock(this.fn);
List<String> call(String a, List<String> b) => fn(a, b);
}""";

      expect(result.trim(), expected.trim());
    });
  });
}
