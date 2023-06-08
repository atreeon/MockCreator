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

Dependencies that are set in the constructor must be nullable
```
@MockCreator()
class GetMousePolygon {
  double Function()? $getPreviousShape;
  double Function()? $getXMouse;
  double Function()? $getYMouse;

  GetMousePolygon(this.$getPreviousShape, this.$getXMouse, this.$getYMouse);

  List<double> call() {
    return [$getPreviousShape!(), $getXMouse!(), $getYMouse!()];
  }
}
```