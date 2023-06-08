// import 'package:mock_creator_annotation/mock_creator_annotation.dart';
//
// //see example project in github
//
// part 'example.g.dart';
//
// @MockCreator()
// class SalutationAppender {
//   String call(String name, int? someInt, List<int>? someGeneric) {
//     if (["Bob", "Rob", "Todd"].contains(name)) {
//       return "Mr " + name;
//     }
//
//     return "Mrs " + name;
//   }
// }
//
// class PersonFormatter {
//   SalutationAppender $salutationAppender = SalutationAppender();
//
//   String call(Person person) {
//     var result = $salutationAppender(person.firstName, null, null).toString() + //
//         " " +
//         person.lastName +
//         ". Age:" +
//         person.age.toString();
//
//     return result;
//   }
// }
//
// class Person {
//   final String firstName;
//   final String lastName;
//   final int age;
//
//   Person({
//     required this.firstName,
//     required this.lastName,
//     required this.age,
//   });
// }
