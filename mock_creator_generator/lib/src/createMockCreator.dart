import 'package:meta/meta.dart';
import 'package:mock_creator_generator/src/helpers.dart';

String createMockCreator({
  @required String className,
  @required String returnType,
  @required List<String> params,
}) {
  var sb = StringBuffer();

  sb.writeln(classDefinition(className));
  sb.writeln(functionDefinition(returnType, params));
  sb.writeln(constructorSignature(className));
  sb.writeln(callMethod(returnType, params));
  sb.writeln("}");

  return sb.toString();
}
