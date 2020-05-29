You want a generator to create a mock from a call method?  Append ```@MockCreator()``` to your class name.

```
@MockCreator()
class SalutationAppender {
  String call(String name) {
    if (["Bob", "Rob", "Todd"].contains(name)) {
      return "Mr " + name;
    }

    return "Mrs " + name;
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
```