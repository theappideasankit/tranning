import 'package:flutter/material.dart';

class HeartAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback onEnd;
  final bool alwaysAnimate;

  const HeartAnimationWidget(
      {Key key,
      @required this.child,
      @required this.isAnimating,
      this.duration = const Duration(milliseconds: 150),
      this.onEnd,
      this.alwaysAnimate = false})
      : super(key: key);

  @override
  _HeartAnimationWidgetState createState() => _HeartAnimationWidgetState();
}

class _HeartAnimationWidgetState extends State<HeartAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scale;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final halfDuration = widget.duration.inMilliseconds ~/ 2;
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: halfDuration));
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant HeartAnimationWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating != oldWidget.isAnimating) {
      doAnimation();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  Future doAnimation() async {
    if (widget.isAnimating || widget.alwaysAnimate) {
      await controller.forward();
      await controller.reverse();
      await Future.delayed(const Duration(milliseconds: 400));
      if (widget.onEnd != null) {
        widget.onEnd();
      }
    }
  }

  @override
  Widget build(BuildContext context) =>
      ScaleTransition(scale: scale, child: widget.child);
}
