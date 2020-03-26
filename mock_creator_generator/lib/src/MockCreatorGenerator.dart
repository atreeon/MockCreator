import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:mock_creator_annotation/mock_creator_annotation.dart';
import 'package:mock_creator_generator/src/createMockCreator.dart';
import 'package:mock_creator_generator/src/helpers.dart';
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

    sb.writeln("//RULES: 1: must be a class, 2: must have a call method, 3: either named or normal params, not a mix");

    if (element is ClassElement) {
      var name = element.name;
      var callMethod = element.getMethod("call");
      var returnType = callMethod.type.returnType.toString();
      var paramsNormal = callMethod.type.normalParameterTypes.map((x) => x.toString()).toList();
      var paramsNamed = callMethod.type.namedParameterTypes.entries.map((x) => NameType(x.key, x.value.toString())).toList();

//      sb.writeln("// returnType:" + returnType);
//      sb.writeln("// params3:" + paramsNormal.toString());
//      sb.writeln("// params2:" + paramsNamed.toString());

      sb.writeln(createMockCreator(
        className: name,
        returnType: returnType,
        paramsNormal: paramsNormal,
        paramsNamed: paramsNamed,
      ));
    }

    return element.session.getResolvedLibraryByElement(element.library).then((resolvedLibrary) {
      return sb.toString();
    });
  }
}
