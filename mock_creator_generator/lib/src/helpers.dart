//import 'package:mock_creator_generator/src/classes.dart';
import 'package:dartx/dartx.dart';
//
//import 'adiHelpers.dart';
//

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
String functionDefinition(String returnType, List<String> paramsNormal, List<NameType> paramsNamed) {
  if (paramsNormal.length == 0 && paramsNamed.length == 0) {
    return "final $returnType Function() fn;";
  }

  if (paramsNormal.length > 0) {
    var params2 = paramsNormal //
        .mapIndexed((index, x) => //
            "$x ${String.fromCharCode(index + 97)}")
        .join(", ");

    return "final $returnType Function($params2) fn;";
  }

  var params2 = paramsNamed //
      .mapIndexed((index, x) => //
          "${x.type} ${String.fromCharCode(index + 97)}")
      .join(", ");

  return "final $returnType Function({$params2}) fn;";
}

//SalutationAppender_Mock(this.fn);
String constructorSignature(String className) {
  return "${className}_Mock(this.fn);";
}

//List<String> call(String a, List<String> b) => fn(a, b);
String callMethod(String returnType, List<String> paramsNormal, List<NameType> paramsNamed) {
  if (paramsNormal.length == 0 && paramsNamed.length == 0) {
    return "$returnType call() => fn();";
  }

  if (paramsNormal.length > 0) {
    var paramsCallSignature = paramsNormal //
        .mapIndexed((index, x) => //
            "$x ${String.fromCharCode(index + 97)}")
        .join(", ");

    var fnParams = paramsNormal //
        .mapIndexed((index, x) => String.fromCharCode(index + 97))
        .join(", ");

    return "$returnType call($paramsCallSignature) => fn($fnParams);";
  }

  var paramsCallSignature = paramsNamed //
      .mapIndexed((index, x) => //
          "${x.type} ${x.name}")
      .join(", ");

  var fnParams = paramsNamed //
      .mapIndexed((index, x) => String.fromCharCode(index + 97) + ":${x.name}")
      .join(", ");

  return "$returnType call({$paramsCallSignature}) => fn($fnParams);";
}

//String getCopyWithParamList(
//  List<NameType> fields,
//  List<GenericType> generics,
//) {
//  var result = fields.where((x) {
//    //<T> || T
//
//    //we are finding T inside TPet and then rejecting it because it doesn't have a baseType
//    //how do I guard against that!
//
//    var matchingGeneric = generics.firstWhere(
//        (g) => //
//            x.type == g.name || x.type.contains("<${g.name}>"),
//        orElse: () => null);
//
//    if (matchingGeneric == null || matchingGeneric.baseType.isNotNullOrEmpty()) {
//      return true;
//    }
//
//    return false;
//  }).toList();
//  var result2 = result.map((x) {
//    var matchingGeneric = generics.firstWhere(
//        (g) => //
//            x.type == g.name || x.type.contains("<${g.name}>"),
//        orElse: () => null);
//
//    if (matchingGeneric == null) {
//      return "${x.type} ${x.name}";
//    }
//
//    var type = x.type.replaceFirst(matchingGeneric.name, matchingGeneric.baseType);
//
//    return "${type} ${x.name}";
//  }) //
//      .joinToString(separator: ", ");
//
//  return result2.toString();
//}
//
//String getCopyWithSignature(
//  String className,
//  List<NameType> fields,
//  List<GenericType> generics,
//) {
//  var paramList = getCopyWithParamList(fields, generics);
//
//  var result = "$className cw$className({$paramList})";
//
//  return result;
//}
//
//String getPropertySetThis(String className, String fieldName) => //
//    "$fieldName: (this as $className).$fieldName";
//
//String getPropertySet(String name) => //
//    "$name: $name == null ? this.$name : $name";
//
//String getConstructorLines(ClassDef extType, ClassDef typeType) {
//  var result = typeType.fields.map((field) {
//    if (extType.fields.any((x) => field.name == x.name)) {
//      return getPropertySet(field.name);
//    } else {
//      return getPropertySetThis(typeType.name, field.name);
//    }
//  }).joinToString(separator: ",\n");
//
//  return result;
//}
//
//String getExtensionDef(String className) => //
//    "extension ${className}Ext_CopyWithE on ${className}";
