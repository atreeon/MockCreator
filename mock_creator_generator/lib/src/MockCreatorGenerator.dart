import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generator_common/NameType.dart';
import 'package:mock_creator_annotation/mock_creator_annotation.dart';
import 'package:mock_creator_generator/src/createMockCreator.dart';
import 'package:source_gen/source_gen.dart';

import 'GeneratorForAnnotationX.dart';

class MockCreatorGenerator extends GeneratorForAnnotationX<MockCreator> {
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
    List<ClassElement> allClasses,
  ) {
    var sb = StringBuffer();

    sb.writeln("//RULES: 1: must be a class, 2: must have a call method");

    if (element is ClassElement) {
      var name = element.name;
      var callMethod = element.getMethod("call");

      if (callMethod == null) {
        throw Exception("Class $name must have a call method");
      }

      var paramsPositional2 = callMethod.parameters //
          .where((x) => x.isPositional)
          .map((e) => NameTypeClassComment(e.name, e.type.toString(), null))
          .toList();
      var paramsNamed2 = callMethod.parameters //
          .where((x) => x.isNamed)
          .map((e) => NameTypeClassComment(e.name, e.type.toString(), null))
          .toList();

      // var methodDetails = getMethodDetailsForFunctionType(callMethod, (x) {});

      sb.writeln(createMockCreator(
        className: name,
        returnType: callMethod.returnType.toString(),
        paramsNormal: paramsPositional2,
        paramsNamed: paramsNamed2,
      ));
    }

    return sb.toString().replaceAll("*", "");
//    return element.session.getResolvedLibraryByElement(element.library).then((resolvedLibrary) {
//    });
  }
}
