import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/durations.dart';
import '../../core/extensions/context_extensions.dart';

class Reveal extends StatefulWidget {
  const Reveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offset = 24,
    this.duration = AppMotion.reveal,
  });

  final Widget child;
  final Duration delay;
  final double offset;
  final Duration duration;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  late final Animation<double> _curve = CurvedAnimation(
    parent: _controller,
    curve: AppMotion.ease,
  );

  ScrollPosition? _position;
  Timer? _delayTimer;
  bool _triggered = false;
  double _viewportHeight = 800;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewportHeight = MediaQuery.sizeOf(context).height;

    if (context.reducedMotion) {
      _triggered = true;
      _controller.value = 1;
      _detach();
      return;
    }
    if (_triggered) return;

    final position = Scrollable.maybeOf(context)?.position;
    if (position != _position) {
      _detach();
      _position = position;
      _position?.addListener(_check);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  void _check() {
    if (_triggered || !mounted) return;
    final box = context.findRenderObject();
    if (box is! RenderBox || !box.attached || !box.hasSize) return;

    final top = box.localToGlobal(Offset.zero).dy;
    if (top < _viewportHeight * 0.9) {
      _triggered = true;
      _detach();
      _delayTimer = Timer(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  void _detach() {
    _position?.removeListener(_check);
    _position = null;
  }

  @override
  void dispose() {
    _detach();
    _delayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _curve,
      child: AnimatedBuilder(
        animation: _curve,
        child: widget.child,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, (1 - _curve.value) * widget.offset),
          child: child,
        ),
      ),
    );
  }
}
