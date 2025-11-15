import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../manager/all_done_dialog_manager.dart';
import '../manager/feeds_manager.dart';
import '_animations.dart';
import '_build_context_extension.dart';
import '_colors.dart';
import '_icons.dart';
import 'all_done_dialog.dart';

class AllDoneFab extends WatchingWidget {
  @override
  build(context) {
    final feedsManager = watchIt<FeedsManager>();

    void showAllDoneDialog() {
      context.showDialogWithBlurBackground(AllDoneDialog());
      sl<AllDoneDialogManager>().hasShown = true;
    }

    if (sl<AllDoneDialogManager>().isAutoShow) Future(showAllDoneDialog);

    return AnimatedScale(
      duration: AppAnimations.fast,
      curve: AppAnimations.emphasizedDecelerate,
      scale: feedsManager.areChaptersRead ? AppAnimations.noScale : AppAnimations.scaleZero,
      child: FloatingActionButton(
        backgroundColor: AppColors.successColor,
        foregroundColor: Colors.white,
        onPressed: showAllDoneDialog,
        shape: const CircleBorder(),
        elevation: AppSpacing.elevationMedium,
        child: Icon(AppIcons.done, size: 35),
      ),
    );
  }
}
