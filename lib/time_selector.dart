import 'package:breathing_test_assesment/app_colors.dart';
import 'package:breathing_test_assesment/scrollable_selector.dart';
import 'package:breathing_test_assesment/timeline_item.dart';
import 'package:flutter/material.dart';

class TimeSelector extends StatefulWidget {
  const TimeSelector({super.key});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  final List<TimeLineItem> timeLineItems = generateTimeLine();
  late final ValueNotifier<TimeLineItem> currentTimeLineItemNotifier =
      ValueNotifier(timeLineItems.first);

  @override
  void dispose() {
    currentTimeLineItemNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TimeLineItem>(
      valueListenable: currentTimeLineItemNotifier,
      builder: (context, currentTimeLineItem, _) {
        final currentTimeText = currentTimeLineItem.index == 0
            ? "∞"
            : "${currentTimeLineItem.index} min";

        return Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                currentTimeText,
                style: const TextStyle(
                  color: AppColors.onSurfacePrimary,
                ),
              ),
            ),
            SizedBox(
              height: 45,
              child: ScrollableSelector(
                itemBuilder: (index) {
                  final timeLineItem = timeLineItems[index];

                  final double itemHeight;

                  if (currentTimeLineItem == timeLineItem) {
                    itemHeight = 12;
                  } else {
                    itemHeight = timeLineItem.major ? 8 : 7;
                  }

                  final Color itemColor;

                  if (currentTimeLineItem == timeLineItem) {
                    itemColor = AppColors.onSurfacePrimary;
                  } else {
                    itemColor = timeLineItem.major
                        ? AppColors.onSurfacePrimary
                        : AppColors.onSurfaceSecondary;
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedOpacity(
                        opacity: timeLineItem.index != 0 ||
                                currentTimeLineItem.index < 3
                            ? 0
                            : 1.0,
                        duration: const Duration(
                          milliseconds: 100,
                        ),
                        child: const Text(
                          "∞",
                          style: TextStyle(
                            color: AppColors.onSurfaceSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6.0,
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: itemHeight,
                            width: 2,
                            color: itemColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                onSelectedItemChanged: (index) {
                  currentTimeLineItemNotifier.value = timeLineItems[index];
                },
                childCount: timeLineItems.length,
                itemExtent: 13,
              ),
            ),
          ],
        );
      },
    );
  }
}
