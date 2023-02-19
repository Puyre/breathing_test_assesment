import 'package:flutter/material.dart';

class ScrollableSelector extends StatelessWidget {
  final Widget Function(int index) itemBuilder;
  final Function(int index) onSelectedItemChanged;
  final int childCount;
  final double itemExtent;

  const ScrollableSelector({
    super.key,
    required this.itemBuilder,
    required this.onSelectedItemChanged,
    required this.childCount,
    required this.itemExtent,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: ListWheelScrollView.useDelegate(
        itemExtent: itemExtent,
        diameterRatio: 10,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: childCount,
          builder: (context, index) {
            return RotatedBox(
              quarterTurns: 1,
              child: itemBuilder(index),
            );
          },
        ),
        onSelectedItemChanged: onSelectedItemChanged,
      ),
    );
  }
}
