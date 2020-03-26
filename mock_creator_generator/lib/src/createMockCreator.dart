import 'package:meta/meta.dart';
import 'package:mock_creator_generator/src/helpers.dart';

String createMockCreator({
  @required String className,
  @required String returnType,
  @required List<String> paramsNormal,
  @required List<NameType> paramsNamed,
}) {
  var sb = StringBuffer();

  sb.writeln(classDefinition(className));
  sb.writeln(functionDefinition(returnType, paramsNormal, paramsNamed));
  sb.writeln(constructorSignature(className));
  sb.writeln(callMethod(returnType, paramsNormal, paramsNamed));
  sb.writeln("}");

  return sb.toString();
}
