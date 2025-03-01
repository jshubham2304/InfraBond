import 'package:flutter/material.dart';

class AnimationsHelper {
  // Standard durations
  static const Duration fast = Duration(milliseconds: 300);
  static const Duration medium = Duration(milliseconds: 500);
  static const Duration slow = Duration(milliseconds: 800);

  // Standard curves
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve bouncyCurve = Curves.elasticOut;
  static const Curve sharpCurve = Curves.easeOutQuint;

  // Animation delays
  static Duration staggeredDelay(int index) => Duration(milliseconds: 50 * index);

  // Animation utils
  static AnimationController createController(TickerProvider vsync, {Duration duration = fast}) {
    return AnimationController(
      duration: duration,
      vsync: vsync,
    );
  }
}

/// A class that provides animated transitions for list items
class StaggeredListItemAnimation extends StatefulWidget {
  final Widget child;
  final int index;
  final bool animate;
  final Duration? delay;
  final Duration duration;
  final Curve curve;
  final Offset? beginOffset;

  const StaggeredListItemAnimation({
    Key? key,
    required this.child,
    required this.index,
    this.animate = true,
    this.delay,
    this.duration = const Duration(milliseconds: 350),
    this.curve = Curves.easeOutQuint,
    this.beginOffset,
  }) : super(key: key);

  @override
  State<StaggeredListItemAnimation> createState() => _StaggeredListItemAnimationState();
}

class _StaggeredListItemAnimationState extends State<StaggeredListItemAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    _slideAnimation = Tween<Offset>(
      begin: widget.beginOffset ?? const Offset(0.0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    if (widget.animate) {
      Future.delayed(widget.delay ?? AnimationsHelper.staggeredDelay(widget.index), () {
        if (mounted) {
          _controller.forward();
        }
      });
    } else {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
