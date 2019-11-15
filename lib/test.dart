import 'main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test case 1", () {
    expect(CustomCurve().transformInternal(0.0), 0.0);
    expect(CustomCurve().transformInternal(0.1), 0.5);
    expect(CustomCurve().transformInternal(0.2), 1.0);
    expect(CustomCurve().transformInternal(0.3), 0.5);
    expect(CustomCurve().transformInternal(0.4), 0.0);
    expect(CustomCurve().transformInternal(0.5), 0.0);
  });
}
