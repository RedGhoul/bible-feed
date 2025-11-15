import 'package:flutter/material.dart';

import '_build_context_extension.dart';
import '_icons.dart';
import 'settings.dart';

class SettingsIconButton extends StatelessWidget {
  @override
  build(BuildContext context) => IconButton(
    key: const Key('settingsIconButton'), // for generate screenshots
    icon: Icon(AppIcons.settings, size: AppIcons.large),
    tooltip: 'Open settings',
    onPressed: () => context.navigateTo(Settings()),
  );
}
