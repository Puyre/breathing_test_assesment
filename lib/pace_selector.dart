import 'package:breathing_test_assesment/app_colors.dart';
import 'package:breathing_test_assesment/scrollable_selector.dart';
import 'package:flutter/material.dart';

class PaceSelector extends StatefulWidget {
  const PaceSelector({super.key});

  @override
  State<PaceSelector> createState() => _PaceSelectorState();
}

class _PaceSelectorState extends State<PaceSelector> {
  final List<String> paceTypes = [
    "7.5 bpm",
    "7 bpm",
    "6 bpm",
    "5.5 bpm",
    "5 bpm",
    "4 bpm",
    "3 bpm",
    "2.1 bpm",
  ];

  late final ValueNotifier<String> selectedPaceNotifier =
      ValueNotifier(paceTypes.first);

  @override
  void dispose() {
    selectedPaceNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ValueListenableBuilder<String>(
        valueListenable: selectedPaceNotifier,
        builder: (
          context,
          selectedPace,
          _,
        ) {
          return ScrollableSelector(
            itemBuilder: (index) {
              final pace = paceTypes[index];
              return Text(
                pace,
                style: TextStyle(
                  color: selectedPace == pace
                      ? AppColors.onSurfacePrimary
                      : AppColors.onSurfaceSecondary,
                ),
                textAlign: TextAlign.center,
              );
            },
            onSelectedItemChanged: (index) {
              selectedPaceNotifier.value = paceTypes[index];
            },
            childCount: paceTypes.length,
            itemExtent: 60,
          );
        },
      ),
    );
  }
}
