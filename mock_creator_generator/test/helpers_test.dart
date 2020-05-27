//import 'package:mock_creator_generator/src/classes.dart';
//import 'package:mock_creator_generator/src/helpers.dart';
//import 'package:test/test.dart';
//
import 'package:mock_creator_generator/src/helpers.dart';
import 'package:test/test.dart';

void main() {
  group("classDefinition", () {
    test("1 a", () {
      var result = classDefinition("SalutationAppender");

      expect(result, "class SalutationAppender_Mock extends SalutationAppender {");
    });
  });

  group("functionDefinition", () {
    test("1 b", () {
      var returnType = "List<String>";
      var params = ["String", "List<String>"];
      var paramsNamed = <NameType>[];

      var result = functionDefinition(returnType, params, paramsNamed);

      expect(result, "final List<String> Function(String a, List<String> b) fn;");
    });

    test("2 b", () {
      var returnType = "List<String>";
      var params = <String>[];
      var paramsNamed = [NameType("param1", "String"), NameType("param2", "int")];

      var result = functionDefinition(returnType, params, paramsNamed);

      expect(result, "final List<String> Function({String a, int b}) fn;");
    });

    test("3 zero parameters", () {
      var returnType = "List<String>";
      var params = <String>[];
      var paramsNamed = <NameType>[];

      var result = functionDefinition(returnType, params, paramsNamed);

      expect(result, "final List<String> Function() fn;");
    });
  });

  group("constructorSignature", () {
    test("1 c", () {
      var result = constructorSignature("SalutationAppender");

      expect(result, "SalutationAppender_Mock(this.fn);");
    });
  });

  group("callMethod", () {
    test("1 d", () {
      var returnType = "List<String>";
      var params = ["String", "List<String>"];
      var paramsNamed = <NameType>[];

      var result = callMethod(returnType, params, paramsNamed);

      expect(result, "List<String> call(String a, List<String> b) => fn(a, b);");
    });

    test("2 d", () {
      var returnType = "List<String>";
      var params = <String>[];
      var paramsNamed = [NameType("param1", "String"), NameType("param2", "int")];

      var result = callMethod(returnType, params, paramsNamed);

      expect(result, "List<String> call({String param1, int param2}) => fn(a:param1, b:param2);");
    });

    test("3 zero parameters", () {
      var returnType = "List<String>";
      var params = <String>[];
      var paramsNamed = <NameType>[];

      var result = callMethod(returnType, params, paramsNamed);

      expect(result, "List<String> call() => fn();");
    });
  });
}
