import 'package:build/build.dart';
import 'package:mock_creator_generator/src/MockCreatorGenerator.dart';
import 'package:source_gen/source_gen.dart';

Builder mockCreatorBuilder(BuilderOptions options) => //
    PartBuilder([MockCreatorGenerator()], '.mock.dart',
        header: '''
    ''');

//Builder mockCreatorBuilder(BuilderOptions options) => //
//    SharedPartBuilder([MockCreatorGenerator()], 'mock_creator');
