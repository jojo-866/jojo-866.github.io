import 'package:flutter/material.dart';

class InteractiveRegion extends StatefulWidget {
  const InteractiveRegion({
    super.key,
    required this.builder,
    this.onTap,
    this.semanticLabel,
    this.isLink = false,
    this.selected = false,
  });

  final Widget Function(BuildContext context, bool hovered, bool focused)
  builder;
  final VoidCallback? onTap;
  final String? semanticLabel;
  final bool isLink;
  final bool selected;

  @override
  State<InteractiveRegion> createState() => _InteractiveRegionState();
}

class _InteractiveRegionState extends State<InteractiveRegion> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    if (!enabled) return widget.builder(context, false, false);

    return Semantics(
      button: !widget.isLink,
      link: widget.isLink,
      selected: widget.selected,
      label: widget.semanticLabel,
      excludeSemantics: widget.semanticLabel != null,
      onTap: widget.onTap,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        onShowHoverHighlight: (value) => setState(() => _hovered = value),
        onShowFocusHighlight: (value) => setState(() => _focused = value),
        actions: <Type, Action<Intent>>{
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              widget.onTap?.call();
              return null;
            },
          ),
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onTap,
          child: widget.builder(context, _hovered, _focused),
        ),
      ),
    );
  }
}
