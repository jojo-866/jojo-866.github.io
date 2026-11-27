import 'package:flutter/material.dart';

import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../data/models/timeline_entry.dart';
import '../../../shared/widget/bullet_list.dart';
import '../../../shared/widget/reveal.dart';
import '../../../shared/widget/tag_chip.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key, required this.entries});

  final List<TimelineEntry> entries;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 760),
      child: Column(
        children: <Widget>[
          for (var i = 0; i < entries.length; i++)
            Reveal(
              child: _TimelineRow(
                entry: entries[i],
                isLast: i == entries.length - 1,
              ),
            ),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.entry, required this.isLast});

  final TimelineEntry entry;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final text = context.type;
    final scheme = context.scheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: 24,
            child: Column(
              children: <Widget>[
                Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: scheme.primary,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: scheme.primary.withValues(alpha: 0.45),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            scheme.primary.withValues(alpha: 0.6),
                            scheme.primary.withValues(alpha: 0.05),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: Space.sm),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: Space.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    entry.period.toUpperCase(),
                    style: text.labelMedium?.copyWith(
                      color: context.tokens.linkText,
                      letterSpacing: 1.6,
                    ),
                  ),
                  const SizedBox(height: Space.xxs),
                  Text(entry.title, style: text.titleLarge),
                  Text(entry.place, style: text.bodySmall),
                  if (entry.note != null) ...<Widget>[
                    const SizedBox(height: Space.xs),
                    Text(
                      entry.note!,
                      style: text.bodyMedium?.copyWith(color: context.tokens.mutedText),
                    ),
                  ],
                  if (entry.highlights.isNotEmpty) ...<Widget>[
                    const SizedBox(height: Space.sm),
                    BulletList(items: entry.highlights),
                  ],
                  if (entry.isPlaceholder) ...<Widget>[
                    const SizedBox(height: Space.xs),
                    const TagChip('Placeholder'),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
