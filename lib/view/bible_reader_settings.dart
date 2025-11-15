import 'package:flutter/material.dart';

import '_build_context_extension.dart';
import '_spacing.dart';
import 'bible_reader_link_icon.dart';
import 'bible_reader_settings_chips.dart';

class BibleReaderSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppSpacing.paddingSM,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.sm,
          children: [
            BibleReaderLinkIcon(),
            Expanded(
              // https://docs.flutter.dev/ui/layout/constraints example 24-25
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSpacing.sm,
                children: [
                  Text(
                    'Bible Reader',
                    style: context.settingsTitle,
                  ),
                  Text(
                    'You can configure a bible reader to open a chapter when tapped. If the bible reader is an app, please ensure it is installed.',
                    style: context.textTheme.bodyMedium,
                  ),
                  BibleReaderSettingsChips(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
