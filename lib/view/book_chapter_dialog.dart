import 'dart:math';

import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../model/feed.dart';
import '../model/list_wheel_state.dart';
import '_build_context_extension.dart';
import '_icons.dart';
import '_spacing.dart';
import 'book_chapter_dialog_footer.dart';
import 'book_chapter_dialog_wheels.dart';

class BookChapterDialog extends StatelessWidget {
  final Feed feed;

  BookChapterDialog(this.feed) {
    sl<BookListWheelState>().index = feed.bookIndex;
    sl<ChapterListWheelState>().index = feed.state.chapter - 1;
  }

  @override
  build(context) {
    withBackground(Widget child) => // fix 3.19 -> 3.22 background color regression
        Container(
          alignment: Alignment.center,
          color: context.colorScheme.surfaceContainerHigh,
          child: child,
        );

    return LayoutBuilder(
      builder: (_, constraints) {
        final maxHeight = constraints.maxHeight * 0.8;
        final maxWidth = min(400.0, constraints.maxWidth * 0.9);
        final isVisible = constraints.maxHeight > 280;

        return Dialog(
          clipBehavior: Clip.hardEdge,
          child: Container(
            constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: maxWidth),
            child: Column(
              children: [
                // Header
                Visibility(
                  visible: isVisible,
                  child: withBackground(
                    Padding(
                      padding: AppSpacing.paddingMD,
                      child: Row(
                        children: [
                          Icon(
                            AppIcons.bibleOpen,
                            size: AppIcons.medium,
                            color: context.colorScheme.primary,
                          ),
                          SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Text(
                              feed.readingList.name,
                              style: context.textTheme.titleLarge,
                            ),
                          ),
                          IconButton(
                            icon: Icon(AppIcons.close, size: AppIcons.medium),
                            onPressed: () => Navigator.pop(context),
                            tooltip: 'Close',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Divider
                if (isVisible)
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: context.colorScheme.outlineVariant,
                  ),

                // Wheels
                Expanded(child: BookChapterDialogWheels(feed.readingList)),

                // Footer with divider
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: context.colorScheme.outlineVariant,
                    ),
                    withBackground(BookChapterDialogFooter(feed)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
