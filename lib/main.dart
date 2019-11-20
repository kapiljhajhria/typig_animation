import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TypingDots()));

class CustomCurve extends Curve {
  double begin;
  double end;
  CustomCurve({this.begin,this.end});
  @override
  double transformInternal(double t) {
    double highPoint = (begin + end) / 2;
    if (t == highPoint) {
      return 1.0;
    } else if (t >= begin && t < highPoint) {

      return (t-begin)/0.2;
    }
    if (t > highPoint && t < end) {
      return (end-t)/0.2;
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
  CustomCurve myCurve = CustomCurve(begin: 0.0 , end: 0.4);
  CustomCurve myCurve2 = CustomCurve(begin: 0.2 , end: 0.6);
  CustomCurve myCurve3 = CustomCurve(begin: 0.4 , end: 0.8);

  @override
  void initState() {
    typingAnimationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
//    typingAnimationController.addStatusListener((AnimationStatus status) {
//      if (status == AnimationStatus.completed) {
//        typingAnimationController.forward();
//      } else if (status == AnimationStatus.dismissed) {
//        typingAnimationController.forward();
//      }
//    });
    typingAnimationController.addListener(() {
      setState(() {});
    });

    typingAnimationController.forward();
    typingAnimationController.repeat();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CurvedAnimation smoothAnimation = CurvedAnimation(
        parent: typingAnimationController,
        curve: myCurve);
    CurvedAnimation smoothAnimation2 = CurvedAnimation(
        parent: typingAnimationController,
        curve: myCurve2);
    CurvedAnimation smoothAnimation3 = CurvedAnimation(
        parent: typingAnimationController,
        curve: myCurve3);
        print(myCurve2.transform(0.4));
    return Scaffold(
      body: Center(
        child: Container(
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
        ),
      ),
    );
  }
}
