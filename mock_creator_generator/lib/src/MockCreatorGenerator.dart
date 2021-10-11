import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generator_common/helpers.dart';
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

      var methodDetails = getMethodDetailsForFunctionType(callMethod, (x) {});

      sb.writeln(createMockCreator(
        className: name,
        returnType: methodDetails.returnType.toString(),
        paramsNormal: methodDetails.paramsPositional,
        paramsNamed: methodDetails.paramsNamed,
      ));
    }

    return sb.toString().replaceAll("*", "");
//    return element.session.getResolvedLibraryByElement(element.library).then((resolvedLibrary) {
//    });
  }
}
