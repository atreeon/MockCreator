import 'package:mock_creator_annotation/mock_creator_annotation.dart';
import 'package:test/test.dart';

part 'ex1_test.mock.dart';

main() {
  test("1", () {
    var bob = Person(age: 5, firstName: "Bob", lastName: "Dobson");

    var formatter = PersonFormatter();
    formatter.$salutationAppender = SalutationAppender_Mock((a, b, c) => "X " + a);
    var result = formatter(bob);

    expect(result.toString(), "X Bob Dobson. Age:5");
  });
}

class Person {
  final String firstName;
  final String lastName;
  final int age;

  Person({
    required this.firstName,
    required this.lastName,
    required this.age,
  });
}

@MockCreator()
class SalutationAppender {
  String call(String name, int? someInt, List<int>? someGeneric) {
    if (["Bob", "Rob", "Todd"].contains(name)) {
      return "Mr " + name;
    }

    return "Mrs " + name;
  }
}

class PersonFormatter {
  SalutationAppender $salutationAppender = SalutationAppender();

  String call(Person person) {
    var result = $salutationAppender(person.firstName, null, null).toString() + //
        " " +
        person.lastName +
        ". Age:" +
        person.age.toString();

    return result;
  }
}
