class TimeLineItem {
  final int index;
  final bool major;

  const TimeLineItem({
    required this.index,
    required this.major,
  });
}

List<TimeLineItem> generateTimeLine() {
  return List.generate(
    31,
    (index) {
      if (index == 0 || index % 10 == 0) {
        return TimeLineItem(
          index: index,
          major: true,
        );
      } else {
        return TimeLineItem(
          index: index,
          major: false,
        );
      }
    },
  );
}
