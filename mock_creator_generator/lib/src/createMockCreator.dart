import 'package:meta/meta.dart';
import 'package:mock_creator_generator/src/helpers.dart';

String createMockCreator({
  @required String className,
  @required String returnType,
  @required List<NameType> paramsNormal,
  @required List<NameType> paramsNamed,
}) {
  var sb = StringBuffer();

  sb.writeln(classDefinition(className));
  sb.writeln(functionDefinition(returnType, paramsNormal.map((e) => e.type).toList(), paramsNamed));
  sb.writeln(constructorSignature(className));
  sb.writeln(callMethod(returnType, paramsNormal.map((e) => e.type).toList(), paramsNamed));
  sb.writeln("}");
  sb.writeln();
  sb.writeln(createFnDef(className, returnType, paramsNormal, paramsNamed));

  return sb.toString();
}
