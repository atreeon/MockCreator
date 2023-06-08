import 'package:mock_creator_annotation/mock_creator_annotation.dart';
import 'package:test/test.dart';

part 'ex9_test.mock.dart';

//SUPPORT DEFAULT DEPENDENCIES TO NULL

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
//
// main() {
//   test("1", () {
//     var fn = Add2();
//     var result = fn(1, null, val3: 3);
//
//     expect(result, 5);
//   });
// }