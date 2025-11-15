import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../service/platform_service.dart';
import '_build_context_extension.dart';
import '_icons.dart';
import 'share.dart';

class ShareIconButton extends StatelessWidget {
  @override
  build(BuildContext context) {
    final isAndroid = sl<PlatformService>().isAndroid;
    final icon = AppIcons.getShareIcon(isAndroid);

    return IconButton(
      key: const Key('shareIconButton'), // for generate screenshots
      icon: Icon(icon, size: AppIcons.large),
      tooltip: 'Share reading state',
      onPressed: () => context.showDialogWithBlurBackground(Share()),
    );
  }
}
