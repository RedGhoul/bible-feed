import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../manager/feeds_manager.dart';
import '../model/feed.dart';
import '_build_context_extension.dart';
import '_spacing.dart';
import 'book_chapter_dialog.dart';

class FeedTitleBar extends WatchingWidget {
  final Feed feed;
  const FeedTitleBar(this.feed);

  @override
  build(context) {
    final feedsManager = watchIt<FeedsManager>();

    return Row(
      children: [
        Visibility(
          visible: feed.state.isRead && identical(feed, feedsManager.lastModifiedFeed),
          child: Padding(
            padding: const EdgeInsets.only(left: AppSpacing.xs),
            child: Tooltip(
              message: 'This is the last chapter you read',
              child: Icon(Icons.auto_stories, size: AppSpacing.iconMedium),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: AppSpacing.xs),
            child: Text(
              feed.readingList.name,
              style: context.readingListName,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        IconButton(
          key: Key(feed.readingList.key), // for screenshot generator
          icon: Icon(Icons.unfold_more, size: AppSpacing.iconMedium),
          onPressed: () => context.showDialogWithBlurBackground(BookChapterDialog(feed)),
        ),
      ],
    );
  }
}
