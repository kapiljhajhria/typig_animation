import '../lib/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test case for first curve", () {
    expect(CustomCurve(begin: 0.0,end: 0.4).transform(0.0), 0.0);
    expect(CustomCurve(begin: 0.0,end: 0.4).transform(0.1), 0.5);
    expect(CustomCurve(begin: 0.0,end: 0.4).transform(0.2), 1.0);
    expect(CustomCurve(begin: 0.0,end: 0.4).transform(0.3), 0.5);
    expect(CustomCurve(begin: 0.0,end: 0.4).transform(0.4), 0.0);
    expect(CustomCurve(begin: 0.0,end: 0.4).transform(0.5), 0.0);
  });

  test("test case for 2nd curve", () {
    expect(CustomCurve(begin: 0.1,end: 0.5).transform(0.0), 0.0);
    expect(CustomCurve(begin: 0.1,end: 0.5).transform(0.1), 0.0);
    expect(CustomCurve(begin: 0.1,end: 0.5).transform(0.15), 0.25);
    expect(CustomCurve(begin: 0.1,end: 0.5).transform(0.2), 0.5);
    expect(CustomCurve(begin: 0.1,end: 0.5).transform(0.25), 0.75);
    expect(CustomCurve(begin: 0.1,end: 0.5).transform(0.3), 1.0);
    expect(CustomCurve(begin: 0.1,end: 0.5).transform(0.35), 0.75);
    expect(CustomCurve(begin: 0.1,end: 0.5).transform(0.4), 0.5);
    expect(CustomCurve(begin: 0.1,end: 0.5).transform(0.45), 0.25);
    expect(CustomCurve(begin: 0.1,end: 0.5).transform(0.5), 0.0);
  });

  test("test case for 3rd curve", () {
    expect(CustomCurve(begin: 0.2,end: 0.6).transform(0.0), 0.0);
    expect(CustomCurve(begin: 0.2,end: 0.6).transform(0.1), 0.0);
    expect(CustomCurve(begin: 0.2,end: 0.6).transform(0.2), 0.0);
    expect(CustomCurve(begin: 0.2,end: 0.6).transform(0.3), 0.5);
    expect(CustomCurve(begin: 0.2,end: 0.6).transform(0.4), 1.0);
    expect(CustomCurve(begin: 0.2,end: 0.6).transform(0.5), 0.5);
  });
}
