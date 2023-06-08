import 'package:generator_common/NameType.dart';

///in:
///out: class SalutationAppender_Mock extends SalutationAppender {
String classDefinition(String className) {
  return "class ${className}_Mock extends ${className} {";
}

class NameType {
  final String type;
  final String name;

  NameType(this.name, this.type);

  toString() => "name:${this.name}|type:${this.type}";
}

//final String Function(String name,) fn;
String functionDefinition(
  String returnType,
  List<NameTypeClassComment> paramsPositional,
  List<NameTypeClassComment> paramsNamed,
) {
  if (paramsPositional.length == 0 && paramsNamed.length == 0) {
    return "final $returnType Function() fn;";
  }

  var index = 0;

  var strParamsPositional = paramsPositional.map((x) {
    return "${x.type} ${String.fromCharCode(index++ + 97)}";
  }).join(", ");

  var strParamsNamed = paramsNamed.map((x) {
    assert(x.type != null);
    var paramType = x.type!;

    return paramType.contains("?") //
        ? "${paramType} ${String.fromCharCode(index++ + 97)}"
        : "required ${paramType} ${String.fromCharCode(index++ + 97)}";
  }).join(", ");

  var params = [
    if (paramsPositional.isNotEmpty) //
      strParamsPositional,
    if (paramsNamed.isNotEmpty) //
      "{$strParamsNamed}",
  ].join(", ");

  return "final $returnType Function($params) fn;";
}

//SalutationAppender_Mock(this.fn);
String constructorSignature(String className) {
  return "${className}_Mock(this.fn);";
}

//List<String> call(String a, List<String> b) => fn(a, b);
String callMethod(
  String returnType,
  List<NameTypeClassComment> paramsPositional,
  List<NameTypeClassComment> paramsNamed,
) {
  if (paramsPositional.length == 0 && paramsNamed.length == 0) {
    return "$returnType call() => fn();";
  }

  var index = 0;

  List<String> paramsPositionalCallSignature = [];
  List<String> paramsPositionalFunction = [];

  paramsPositional.forEach((x) {
    paramsPositionalCallSignature.add("${x.type} ${String.fromCharCode(index + 97)}");
    paramsPositionalFunction.add(String.fromCharCode(index + 97));
    index++;
  });

  List<String> paramsNamedCallSignature = [];
  List<String> paramsNamedFunction = [];

//  var strParamsNamed = paramsNamed
//      .map((x) => //
//  x.type.contains("?") //
//      ? "${x.type} ${String.fromCharCode(index++ + 97)}"
//      : "required ${x.type} ${String.fromCharCode(index++ + 97)}")
//      .join(", ");

  paramsNamed.forEach((x) {
    var paramType = x.type!;

    if (paramType.contains("?")) {
      paramsNamedCallSignature.add("${paramType} ${x.name}");
      paramsNamedFunction.add(String.fromCharCode(index + 97) + ":${x.name}");
    } else {
      paramsNamedCallSignature.add("required ${paramType} ${x.name}");
      paramsNamedFunction.add(String.fromCharCode(index + 97) + ":${x.name}");
    }
    index++;
  });

  var callSig = [
    if (paramsPositionalCallSignature.isNotEmpty) //
      paramsPositionalCallSignature.join(", "),
    if (paramsNamedCallSignature.isNotEmpty) //
      "{" + paramsNamedCallSignature.join(", ") + "}",
  ].join(", ");

  var fnParams = [
    if (paramsPositionalFunction.isNotEmpty) //
      paramsPositionalFunction.join(", "),
    if (paramsNamedFunction.isNotEmpty) //
      paramsNamedFunction.join(", "),
  ].join(", ");

  return "$returnType call($callSig) => fn($fnParams);";
}

String createFnDef(
  String callableName,
  String returnType,
  List<NameTypeClassComment> paramsPositional,
  List<NameTypeClassComment> paramsNamed,
) {
  if (paramsPositional.length == 0 && paramsNamed.length == 0) {
    return "typedef fn_$callableName = $returnType Function();";
  }

  List<String> paramsPositionalCallSignature = [];

  paramsPositional.forEach((x) {
    paramsPositionalCallSignature.add("${x.type} ${x.name}");
  });

  List<String> paramsNamedCallSignature = [];

  paramsNamed.forEach((x) {
    paramsNamedCallSignature.add("${x.type} ${x.name}");
  });

  var callSig = [
    if (paramsPositionalCallSignature.isNotEmpty) //
      paramsPositionalCallSignature.join(", "),
    if (paramsNamedCallSignature.isNotEmpty) //
      "{" + paramsNamedCallSignature.join(", ") + "}",
  ].join(", ");

  return "typedef fn_$callableName = $returnType Function($callSig);";
}
