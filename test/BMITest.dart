import 'package:bhuvan_bmi_calc/screens/input_page.dart';
import "package:test/test.dart";

void main() {
  test('cms to inches', () {
    UserInput input = new UserInput();
    input.setHeightInCms(100);
    String inches = input.getHeightInInches();
    expect(inches, "39.4");
  });

  test('kgs to lbs', () {
    UserInput input = new UserInput();
    input.setWeightInKg(68);
    String lbs = input.getWeightInLbs();
    expect(lbs, '149.9');
  });
}
