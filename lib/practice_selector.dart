import 'package:breathing_test_assesment/app_colors.dart';
import 'package:breathing_test_assesment/scrollable_selector.dart';
import 'package:flutter/material.dart';

class PracticeSelector extends StatefulWidget {
  const PracticeSelector({super.key});

  @override
  State<PracticeSelector> createState() => _PracticeSelectorState();
}

class _PracticeSelectorState extends State<PracticeSelector> {
  final List<String> practiceTypes = [
    "Resonance",
    "Balance",
    "Strength",
    "Focus",
  ];

  late final ValueNotifier<String> selectedPracticeNotifier =
      ValueNotifier(practiceTypes.first);

  @override
  void dispose() {
    selectedPracticeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ValueListenableBuilder<String>(
        valueListenable: selectedPracticeNotifier,
        builder: (
          context,
          selectedPractice,
          _,
        ) {
          return ScrollableSelector(
            itemBuilder: (index) {
              final practice = practiceTypes[index];
              return Text(
                practice,
                style: TextStyle(
                  color: selectedPractice == practice
                      ? AppColors.onSurfacePrimary
                      : AppColors.onSurfaceSecondary,
                ),
                textAlign: TextAlign.center,
              );
            },
            onSelectedItemChanged: (index) {
              selectedPracticeNotifier.value = practiceTypes[index];
            },
            childCount: practiceTypes.length,
            itemExtent: 80,
          );
        },
      ),
    );
  }
}
