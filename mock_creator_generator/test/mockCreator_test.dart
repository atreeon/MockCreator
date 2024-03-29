import 'package:generator_common/NameType.dart';
import 'package:mock_creator_generator/src/createMockCreator.dart';
import 'package:test/test.dart';

void main() {
  group("createMockCreator", () {
    test("1", () {
      var className = "Stuffer";
      var returnType = "List<String>";
      var params = <NameTypeClassComment>[
        NameTypeClassComment("name", "String", null),
        NameTypeClassComment("myList", "List<String>", null),
      ];

      var result = createMockCreator(
        className: className,
        returnType: returnType,
        paramsNormal: params,
        paramsNamed: <NameTypeClassComment>[],
        constructorParamsCount: 2,
      );

      var expected = """class Stuffer_Mock extends Stuffer {
final List<String> Function(String a, List<String> b) fn;
Stuffer_Mock(this.fn) : super(null, null);
List<String> call(String a, List<String> b) => fn(a, b);
}

typedef fn_Stuffer = List<String> Function(String name, List<String> myList);""";

      expect(result.trim(), expected.trim());
    });
  });
}
