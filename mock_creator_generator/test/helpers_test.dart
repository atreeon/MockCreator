//import 'package:mock_creator_generator/src/classes.dart';
//import 'package:mock_creator_generator/src/helpers.dart';
//import 'package:test/test.dart';
//
import 'package:generator_common/NameType.dart';
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
    test("1 all positional", () {
      var returnType = "List<String>";
      var params = [
        NameTypeClassComment("param1", "String", null),
        NameTypeClassComment("param1", "List<String>", null),
      ];
      var paramsNamed = <NameTypeClassComment>[];

      var result = functionDefinition(returnType, params, paramsNamed);

      expect(result, "final List<String> Function(String a, List<String> b) fn;");
    });

    test("2 all named params", () {
      var returnType = "List<String>";
      var params = <NameTypeClassComment>[];
      var paramsNamed = [
        NameTypeClassComment("param1", "String", null),
        NameTypeClassComment("param2", "int", null),
      ];

      var result = functionDefinition(returnType, params, paramsNamed);

      expect(result, "final List<String> Function({required String a, required int b}) fn;");
    });

    test("3 zero parameters", () {
      var returnType = "List<String>";
      var params = <NameTypeClassComment>[];
      var paramsNamed = <NameTypeClassComment>[];

      var result = functionDefinition(returnType, params, paramsNamed);

      expect(result, "final List<String> Function() fn;");
    });

    test("4 mixture named and positional", () {
      var returnType = "List<String>";
      var params = [NameTypeClassComment("param0", "String", null)];
      var paramsNamed = [NameTypeClassComment("param1", "String", null)];

      var result = functionDefinition(returnType, params, paramsNamed);

      expect(result, "final List<String> Function(String a, {required String b}) fn;");
    });

    test("5 mixture named and positional & nullable", () {
      var returnType = "List<String>";
      var params = <NameTypeClassComment>[
        NameTypeClassComment("param1", "String", null),
        NameTypeClassComment("param2", "int?", null),
        NameTypeClassComment("param3", "double", null),
      ];
      var paramsNamed = [
        NameTypeClassComment("param4", "String", null),
        NameTypeClassComment("param5", "int?", null),
      ];

      var result = functionDefinition(returnType, params, paramsNamed);

      expect(
          result, //
          "final List<String> Function(String a, int? b, double c, {required String d, int? e}) fn;");
    });
  });

  group("constructorSignature", () {
    test("1 c", () {
      var result = constructorSignature("SalutationAppender");

      expect(result, "SalutationAppender_Mock(this.fn);");
    });
  });

  group("create fn def", () {
    test("1 zero params", () {
      var callableName = "GetLectures";
      var returnType = "List<String>";
      var paramsPositional = <NameTypeClassComment>[];
      var paramsNamed = <NameTypeClassComment>[];

      var result = createFnDef(callableName, returnType, paramsPositional, paramsNamed);

      expect(result, "typedef fn_GetLectures = List<String> Function();");
    });

    test("2 one positional param", () {
      var callableName = "GetLectures";
      var returnType = "List<String>";
      var paramsPositional = <NameTypeClassComment>[NameTypeClassComment("name", "String", null)];
      var paramsNamed = <NameTypeClassComment>[];

      var result = createFnDef(callableName, returnType, paramsPositional, paramsNamed);

      expect(result, "typedef fn_GetLectures = List<String> Function(String name);");
    });

    test("3 mixed params", () {
      var callableName = "GetLectures";
      var returnType = "List<String>";
      var paramsPositional = <NameTypeClassComment>[NameTypeClassComment("name", "String", null)];
      var paramsNamed = <NameTypeClassComment>[NameTypeClassComment("id", "int", null)];

      var result = createFnDef(callableName, returnType, paramsPositional, paramsNamed);

      expect(result, "typedef fn_GetLectures = List<String> Function(String name, {int id});");
    });
  });

  group("callMethod", () {
    test("1 d", () {
      var returnType = "List<String>";
      var params = [
        NameTypeClassComment("param1", "String", null),
        NameTypeClassComment("param1", "List<String>", null),
      ];
      var paramsNamed = <NameTypeClassComment>[];

      var result = callMethod(returnType, params, paramsNamed);

      expect(result, "List<String> call(String a, List<String> b) => fn(a, b);");
    });

    test("2 d", () {
      var returnType = "List<String>";
      var params = <NameTypeClassComment>[];
      var paramsNamed = [NameTypeClassComment("param1", "String", null), NameTypeClassComment("param2", "int", null)];

      var result = callMethod(returnType, params, paramsNamed);

      expect(result, "List<String> call({required String param1, required int param2}) => fn(a:param1, b:param2);");
    });

    test("3 d zero parameters", () {
      var returnType = "List<String>";
      var params = <NameTypeClassComment>[];
      var paramsNamed = <NameTypeClassComment>[];

      var result = callMethod(returnType, params, paramsNamed);

      expect(result, "List<String> call() => fn();");
    });

    test("4 d mixture named and positional", () {
      var returnType = "List<String>";
      var params = [NameTypeClassComment("param1", "String", null)];
      var paramsNamed = [NameTypeClassComment("param2", "String", null)];

      var result = callMethod(returnType, params, paramsNamed);

      expect(result, "List<String> call(String a, {required String param2}) => fn(a, b:param2);");
    });

    test("5 d mixture named and positional and non null", () {
      var returnType = "List<String>";
      var params = [NameTypeClassComment("param1", "String", null)];
      var paramsNamed = [
        NameTypeClassComment("b", "String?", null),
        NameTypeClassComment("c", "int", null),
      ];

      var result = callMethod(returnType, params, paramsNamed);

      expect(result, "List<String> call(String a, {String? b, required int c}) => fn(a, b:b, c:c);");
    });
  });
}
