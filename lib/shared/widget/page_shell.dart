import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../../core/utils/page_title.dart';
import 'footer.dart';
import 'nav_bar.dart';
import 'nav_drawer.dart';
import 'sky_background.dart';

class PageShell extends StatefulWidget {
  const PageShell({
    super.key,
    required this.route,
    required this.children,
    this.title,
  });

  final String route;
  final String? title;
  final List<Widget> children;

  @override
  State<PageShell> createState() => _PageShellState();
}

class _PageShellState extends State<PageShell> {
  final ScrollController _scroll = ScrollController();

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavDrawer(currentRoute: widget.route),
      endDrawerEnableOpenDragGesture: false,
      body: Title(
        title: pageTitle(widget.title),
        color: context.scheme.primary,
        child: SkyBackground(
          scroll: _scroll,
          child: FocusTraversalGroup(
            policy: OrderedTraversalPolicy(),
            child: Stack(
              children: <Widget>[
                FocusTraversalOrder(
                  order: const NumericFocusOrder(1),
                  child: LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      controller: _scroll,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                const SizedBox(height: NavBar.height),
                                ...widget.children,
                              ],
                            ),
                            const Footer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: FocusTraversalOrder(
                    order: const NumericFocusOrder(0),
                    child: NavBar(currentRoute: widget.route, scroll: _scroll),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
