import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
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
      var returnType = callMethod.type.returnType.toString();
      var params = callMethod.type.normalParameterTypes.map((x) => x.toString()).toList();

      sb.writeln("// name:" + name);
      sb.writeln("// returnType:" + returnType);
      sb.writeln("// params3:" + params.toString());

      sb.writeln(createMockCreator(
        className: name,
        returnType: returnType,
        params: params,
      ));
    }

    return element.session.getResolvedLibraryByElement(element.library).then((resolvedLibrary) {
      return sb.toString();
    });
  }
}
