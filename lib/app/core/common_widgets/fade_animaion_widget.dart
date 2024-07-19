import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;
  const FadeAnimation({Key? key, required this.delay, required this.child})
      : super(key: key);

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    // _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: Curves.easeIn,
    //   ),
    // );
    Future.delayed(Duration(milliseconds: (350 * widget.delay).round()), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeIn,
        ),
      ),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeIn,
          ),
        ),
        // Paste you Widget
        child: widget.child,
      ),
    );

    // FadeTransition(
    //   opacity: _animation,
    //   child: widget.child,
    // );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  // @override
  // void didUpdateWidget(covariant FadeAnimation oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.delay != widget.delay) {
  //     Future.delayed(Duration(milliseconds: (400 * widget.delay).round()), () {
  //       _controller.forward();
  //     });
  //   }
  // }
}
