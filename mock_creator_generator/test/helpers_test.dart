//import 'package:mock_creator_generator/src/classes.dart';
//import 'package:mock_creator_generator/src/helpers.dart';
//import 'package:test/test.dart';
//
import 'package:mock_creator_generator/src/helpers.dart';
import 'package:test/test.dart';

void main() {
  group("classDefinition", () {
    test("1", () {
      var result = classDefinition("SalutationAppender");

      expect(result, "class SalutationAppender_Mock extends SalutationAppender {");
    });
  });

  group("functionDefinition", () {
    test("1", () {
      var returnType = "List<String>";
      var params = ["String", "List<String>"];

      var result = functionDefinition(returnType, params);

      expect(result, "final List<String> Function(String a, List<String> b) fn;");
    });
  });

  group("constructorSignature", () {
    test("1", () {
      var result = constructorSignature("SalutationAppender");

      expect(result, "SalutationAppender_Mock(this.fn);");
    });
  });

  group("callMethod", () {
    test("1", () {
      var returnType = "List<String>";
      var params = ["String", "List<String>"];

      var result = callMethod(returnType, params);

      expect(result, "List<String> call(String a, List<String> b) => fn(a, b);");
    });
  });
}
