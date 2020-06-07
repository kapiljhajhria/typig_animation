import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TypingDots()));

class CustomCurve extends Curve {
  double begin;
  CustomCurve({this.begin});
  @override
  double transformInternal(double t) {
    if (t >= begin && t <= (begin + .2)) {
      return ((t*10)-(10*begin))*0.5;
    }
    if (t >= (begin + .2) && t <= (begin+0.4)) {
      return ((((begin*10)+(0.4*10))-(t*10))*0.5);
    } else {
      return 0;
    }
  }
}

class TypingDots extends StatefulWidget {
  @override
  _TypingDotsState createState() => _TypingDotsState();
}

class _TypingDotsState extends State<TypingDots>
    with SingleTickerProviderStateMixin {
  double radius = 20.0;
  AnimationController typingAnimationController;

  @override
  void initState() {
    typingAnimationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
        typingAnimationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CurvedAnimation smoothAnimation = CurvedAnimation(
        parent: typingAnimationController,
        curve: CustomCurve(begin: 0.0 ));
    CurvedAnimation smoothAnimation2 = CurvedAnimation(
        parent: typingAnimationController,
        curve: CustomCurve(begin: 0.2 ));
    CurvedAnimation smoothAnimation3 = CurvedAnimation(
        parent: typingAnimationController,
        curve: CustomCurve(begin: 0.3 ));
    return Container(
      height: 150,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(70.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SlideTransition(
            position: Tween(begin: Offset.zero, end: Offset(0.0, -2.0))
                .animate(smoothAnimation),
            child: Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SlideTransition(
            position: Tween(begin: Offset.zero, end: Offset(0.0, -2.0))
                .animate(smoothAnimation2),
            child: Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SlideTransition(
            position: Tween(begin: Offset.zero, end: Offset(0.0, -2.0))
                .animate(smoothAnimation3),
            child: Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
