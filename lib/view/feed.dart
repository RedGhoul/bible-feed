import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../manager/bible_reader_link_manager.dart';
import '../manager/feeds_manager.dart';
import '../model/feed.dart' as model;
import '_animations.dart';
import '_build_context_extension.dart';
import '_elevation.dart';
import '_spacing.dart';
import 'feed_body.dart';
import 'feed_semantics.dart';

class Feed extends WatchingWidget {
  final model.Feed feed;
  const Feed(this.feed);

  @override
  build(context) {
    watch(feed);
    final feedsManager = watchIt<FeedsManager>();
    final isLinked = watchIt<BibleReaderLinkManager>().isLinked;
    final isRead = feed.state.isRead;
    final isCurrent = identical(feed, feedsManager.lastModifiedFeed);
    final isLastReadAndLinked = isRead && isLinked && isCurrent;

    // Animation and opacity
    final fadeOutDuration = isLastReadAndLinked ? AppAnimations.longFadeOut : Duration.zero;
    final opacity = isRead ? AppAnimations.opacityDisabled : AppAnimations.opacityFull;

    // Elevation based on state
    final elevation = AppElevation.feedCard(
      isRead: isRead,
      isCurrent: isCurrent && !isRead,
    );

    return RepaintBoundary(
      child: AnimatedOpacity(
        opacity: opacity,
        duration: fadeOutDuration,
        curve: AppAnimations.defaultCurve,
        child: AnimatedContainer(
          duration: AppAnimations.medium,
          curve: AppAnimations.emphasizedDecelerate,
          margin: EdgeInsets.all(AppSpacing.xxs),
          decoration: BoxDecoration(
            borderRadius: AppSpacing.borderRadiusMD,
            boxShadow: isRead
                ? AppElevation.subtleShadow(context)
                : AppElevation.shadow(context, elevation: elevation),
          ),
          child: Card(
            elevation: 0, // Use custom shadow instead
            shape: RoundedRectangleBorder(
              borderRadius: AppSpacing.borderRadiusMD,
              side: isRead
                  ? BorderSide(
                      color: context.colorScheme.outlineVariant.withOpacity(0.5),
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            clipBehavior: Clip.hardEdge,
            child: FeedSemantics(feed: feed, child: FeedBody(feed)),
          ),
        ),
      ),
    );
  }
}
