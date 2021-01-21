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

      var paramsPositional2 = callMethod.type.parameters.where((x) => x.isPositional);
      var paramsNamed2 = callMethod.type.parameters.where((x) => x.isNamed);

//      sb.writeln("//paramsPositional2:" + paramsPositional2.map((e) => e.type.toString()).join(","));
//      sb.writeln("//paramsNamed2:" + paramsNamed2.map((e) => e.type.toString()).join(","));

      var paramsPositional = paramsPositional2
          .map((x) => NameType(
                x.name.toString().replaceAll("*", ""),
                x.type.toString().replaceAll("*", ""),
              ))
          .toList();
      var paramsNamed = paramsNamed2
          .map((x) => NameType(
                x.name.toString().replaceAll("*", ""),
                x.type.toString().replaceAll("*", ""),
              ))
          .toList();

//      sb.writeln("// returnType:" + returnType);
//      sb.writeln("// params3:" + paramsPositional.toString());
//      sb.writeln("// params2:" + paramsNamed.toString());

      sb.writeln(createMockCreator(
        className: name,
        returnType: returnType.toString().replaceAll("*", ""),
        paramsNormal: paramsPositional,
        paramsNamed: paramsNamed,
      ));
    }

    return sb.toString();
//    return element.session.getResolvedLibraryByElement(element.library).then((resolvedLibrary) {
//    });
  }
}
