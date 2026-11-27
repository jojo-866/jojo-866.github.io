import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class SkyBackground extends StatelessWidget {
  const SkyBackground({super.key, required this.child, this.scroll});

  final Widget child;
  final ScrollController? scroll;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: context.tokens.skyGradient),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _SunriseGlow(scroll: scroll),
          const _DriftingClouds(),
          child,
        ],
      ),
    );
  }
}

class _SunriseGlow extends StatelessWidget {
  const _SunriseGlow({this.scroll});

  final ScrollController? scroll;
  static final ValueNotifier<double> _idle = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final dark = context.isDarkTheme;

    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ListenableBuilder(
            listenable: scroll ?? _idle,
            builder: (context, _) {
              final controller = scroll;
              final offset = (controller != null && controller.hasClients)
                  ? controller.offset
                  : 0.0;
              final t = Curves.easeOut.transform(
                (offset / 1800).clamp(0.0, 1.0),
              );
              return DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(
                      lerpDouble(0, 0.7, t)!,
                      lerpDouble(-1.15, -0.35, t)!,
                    ),
                    radius: 1.15,
                    colors: <Color>[
                      tokens.glow.withValues(alpha: dark ? 0.26 : 0.85),
                      tokens.glow.withValues(alpha: 0),
                    ],
                  ),
                ),
              );
            },
          ),
          RepaintBoundary(
            child: CustomPaint(
              painter: _RaysPainter(
                color: tokens.rays,
                alpha: dark ? 0.09 : 0.32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RaysPainter extends CustomPainter {
  const _RaysPainter({required this.color, required this.alpha});

  final Color color;
  final double alpha;

  static const List<double> _angles = <double>[
    -0.62,
    -0.36,
    -0.12,
    0.12,
    0.36,
    0.62,
  ];
  static const double _spread = 0.07;

  @override
  void paint(Canvas canvas, Size size) {
    final origin = Offset(size.width * 0.5, -size.height * 0.12);
    final reach = size.height * 0.95;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          color.withValues(alpha: alpha),
          color.withValues(alpha: 0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, reach));

    for (final angle in _angles) {
      final left =
          origin +
          Offset(math.sin(angle - _spread), math.cos(angle - _spread)) *
              reach *
              1.6;
      final right =
          origin +
          Offset(math.sin(angle + _spread), math.cos(angle + _spread)) *
              reach *
              1.6;
      final path = Path()
        ..moveTo(origin.dx, origin.dy)
        ..lineTo(left.dx, left.dy)
        ..lineTo(right.dx, right.dy)
        ..close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_RaysPainter old) =>
      old.color != color || old.alpha != alpha;
}

class _Cloud {
  const _Cloud(this.x, this.y, this.size, [this.alpha = 1]);

  final double x;
  final double y;

  final double size;
  final double alpha;
}

const List<_Cloud> _farClouds = <_Cloud>[
  _Cloud(0.08, 0.14, 0.34, 0.8),
  _Cloud(0.55, 0.08, 0.28, 0.6),
  _Cloud(0.85, 0.22, 0.30, 0.7),
];

const List<_Cloud> _nearClouds = <_Cloud>[
  _Cloud(0.20, 0.55, 0.44, 0.9),
  _Cloud(0.70, 0.45, 0.38, 0.8),
];

class _DriftingClouds extends StatefulWidget {
  const _DriftingClouds();

  @override
  State<_DriftingClouds> createState() => _DriftingCloudsState();
}

class _DriftingCloudsState extends State<_DriftingClouds>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 120),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.reducedMotion) {
      _controller
        ..stop()
        ..value = 0.3;
    } else if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = context.tokens.cloud;
    final dark = context.isDarkTheme;

    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight * 0.8;
          return ClipRect(
            child: Stack(
              children: <Widget>[
                _CloudLayer(
                  animation: _controller,
                  cycles: 1,
                  width: width,
                  height: height,
                  color: color,
                  opacity: dark ? 0.20 : 0.75,
                  clouds: _farClouds,
                ),
                _CloudLayer(
                  animation: _controller,
                  cycles: 2,
                  width: width,
                  height: height,
                  color: color,
                  opacity: dark ? 0.12 : 0.55,
                  clouds: _nearClouds,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CloudLayer extends StatelessWidget {
  const _CloudLayer({
    required this.animation,
    required this.cycles,
    required this.width,
    required this.height,
    required this.color,
    required this.opacity,
    required this.clouds,
  });

  final Animation<double> animation;
  final int cycles;
  final double width;
  final double height;
  final Color color;
  final double opacity;
  final List<_Cloud> clouds;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final shift = (animation.value * cycles) % 1.0;
        return Transform.translate(
          offset: Offset(-width * shift, 0),
          child: child,
        );
      },
      child: OverflowBox(
        alignment: Alignment.topLeft,
        minWidth: 0,
        maxWidth: width * 2,
        minHeight: 0,
        maxHeight: height,
        child: RepaintBoundary(
          child: CustomPaint(
            size: Size(width * 2, height),
            painter: _CloudPainter(
              color: color,
              opacity: opacity,
              clouds: clouds,
            ),
          ),
        ),
      ),
    );
  }
}

class _CloudPainter extends CustomPainter {
  const _CloudPainter({
    required this.color,
    required this.opacity,
    required this.clouds,
  });

  final Color color;
  final double opacity;
  final List<_Cloud> clouds;

  static const List<(double, double, double, double)> _puffs =
      <(double, double, double, double)>[
        (-0.30, 0.04, 0.60, 0.26),
        (0.00, -0.02, 0.70, 0.34),
        (0.30, 0.05, 0.55, 0.24),
        (0.00, 0.08, 1.10, 0.22),
      ];

  @override
  void paint(Canvas canvas, Size size) {
    final tile = size.width / 2;
    for (var copy = 0; copy < 2; copy++) {
      for (final cloud in clouds) {
        final base = Offset(
          copy * tile + cloud.x * tile,
          cloud.y * size.height,
        );
        final s = cloud.size * tile;
        for (final (dx, dy, w, h) in _puffs) {
          final rect = Rect.fromCenter(
            center: base + Offset(dx * s, dy * s),
            width: w * s,
            height: h * s,
          );
          final paint = Paint()
            ..shader = RadialGradient(
              colors: <Color>[
                color.withValues(alpha: 0.9 * cloud.alpha * opacity),
                color.withValues(alpha: 0),
              ],
            ).createShader(rect);
          canvas.drawOval(rect, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(_CloudPainter old) =>
      old.color != color || old.opacity != opacity || old.clouds != clouds;
}
