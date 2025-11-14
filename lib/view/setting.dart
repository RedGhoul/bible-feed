import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../manager/setting_manager.dart';
import '_build_context_extension.dart';
import '_spacing.dart';

class Setting<T extends SettingManager> extends WatchingWidget {
  @override
  Widget build(BuildContext context) {
    final settingManager = watchIt<T>();

    return Opacity(
      opacity: settingManager.canEnable ? 1.0 : 0.5,
      child: IgnorePointer(
        ignoring: !settingManager.canEnable,
        child: Card(
          child: Padding(
            padding: AppSpacing.paddingSM,
            child: SwitchListTile(
              title: Text(
                settingManager.title,
                style: context.settingsTitle,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: AppSpacing.sm),
                child: Text(
                  settingManager.subtitle,
                  style: context.textTheme.bodyMedium,
                ),
              ),
              value: settingManager.isEnabled,
              onChanged: (value) => settingManager.isEnabled = value,
            ),
          ),
        ),
      ),
    );
  }
}
