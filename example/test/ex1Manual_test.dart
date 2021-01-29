import 'package:test/test.dart';

//part 'ex1_test.g.dart';

main() {
  test("1", () {
    var bob = Person(age: 5, firstName: "Bob", lastName: "Dobson");

    var formatter = PersonFormatter();
    formatter.$salutationAppender = SalutationAppender_Mock((x) => "X " + x);
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

class SalutationAppender {
  String call(String name) {
    if (["Bob", "Rob", "Todd"].contains(name)) {
      return "Mr " + name;
    }

    return "Mrs " + name;
  }
}

class PersonFormatter {
  SalutationAppender $salutationAppender = SalutationAppender();

  String call(Person person) {
    var result = $salutationAppender(person.firstName) + " " + person.lastName + ". Age:" + person.age.toString();

    return result;
  }
}

class SalutationAppender_Mock extends SalutationAppender {
  final String Function(
    String name,
  ) fn;

  SalutationAppender_Mock(this.fn);

  String call(
    String a,
  ) =>
      fn(a);
}
